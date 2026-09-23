# ============================================================
# IT3081 Statistical Modelling
# Paddy Crop Yield Analysis - Task 3
# ============================================================

rm(list = ls())


library(tidyverse)

# Import dataset
paddy <- read.csv(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Data\\Paddy_20Year_Two_Season_Analysis_Dataset.csv"
)

# Convert categorical variables
paddy <- paddy %>%
  mutate(
    Season = as.factor(Season),
    Geography = as.factor(Geography),
    Geography_Type = as.factor(Geography_Type)
  )

# Basic dataset checks
dim(paddy)
head(paddy)
tail(paddy)
str(paddy)

# Check seasons
table(paddy$Season)

# Check districts
table(paddy$Geography)

# Check years
sort(unique(paddy$Reference_Year))

# Target variable
summary(paddy$Average_Yield_kg_per_ha)

mean(
  paddy$Average_Yield_kg_per_ha,
  na.rm = TRUE
)

sd(
  paddy$Average_Yield_kg_per_ha,
  na.rm = TRUE
)

# Missing values
colSums(is.na(paddy))

missing_summary <- data.frame(
  Variable = names(paddy),
  Missing_Count = colSums(is.na(paddy))
)

missing_summary$Missing_Percentage <-
  (missing_summary$Missing_Count / nrow(paddy)) * 100

missing_summary

# Missing Values Visualization

# Missing Values Visualization

missing_plot <- ggplot(
  missing_summary %>% filter(Missing_Count > 0),
  aes(
    x = reorder(Variable, Missing_Percentage),
    y = Missing_Percentage
  )
) +
  geom_col(fill = "#2E7D32") +
  coord_flip() +
  labs(
    title = "Missing Values by Variable",
    x = NULL,
    y = "Percent Missing (%)"
  ) +
  theme_minimal()

# Display plot
missing_plot

ggsave(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Figures/Figure_3_1_Missing_Values.png",
  plot = missing_plot,
  width = 8,
  height = 6,
  dpi = 300
)

write.csv(
  missing_summary,
  "D:/Sliit/3rd year 1 semester/Statistical Modeling/Paddy_Yield_Statistical_Modelling/Results/Task3_Missing_Value_Summary.csv",
  row.names = FALSE
)


# ============================================================
# Outlier Analysis
# ============================================================

Q1 <- quantile(
  paddy$Average_Yield_kg_per_ha,
  0.25,
  na.rm = TRUE
)

Q3 <- quantile(
  paddy$Average_Yield_kg_per_ha,
  0.75,
  na.rm = TRUE
)

IQR_value <- IQR(
  paddy$Average_Yield_kg_per_ha,
  na.rm = TRUE
)

Lower_Bound <- Q1 - 1.5 * IQR_value
Upper_Bound <- Q3 + 1.5 * IQR_value

Q1
Q3
IQR_value
Lower_Bound
Upper_Bound

outliers <- paddy %>%
  filter(
    Average_Yield_kg_per_ha < Lower_Bound |
      Average_Yield_kg_per_ha > Upper_Bound
  )

outliers

nrow(outliers)

write.csv(
  outliers,
  "D:/Sliit/3rd year 1 semester/Statistical Modeling/Paddy_Yield_Statistical_Modelling/Results/Task3_Outlier_Observations.csv",
  row.names = FALSE
)

# ============================================================
# Boxplot for Average Paddy Yield
# ============================================================

yield_boxplot <- ggplot(
  paddy,
  aes(y = Average_Yield_kg_per_ha)
) +
  geom_boxplot(
    fill = "#81C784",
    colour = "#2E7D32"
  ) +
  labs(
    title = "Boxplot of Average Paddy Yield",
    x = NULL,
    y = "Average Yield (kg/ha)"
  ) +
  theme_minimal()

# Display boxplot
yield_boxplot

ggsave(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Figures\\Figure_3_2_Average_Yield_Boxplot.png",
  plot = yield_boxplot,
  width = 7,
  height = 5,
  dpi = 300
)

# Descriptive Statistics

# Select main numerical variables
numeric_data <- paddy %>%
  select(
    Major_Sown_Ha,
    Minor_Sown_Ha,
    Rainfed_Sown_Ha,
    All_Sown_Ha,
    Major_Harvested_Ha,
    Minor_Harvested_Ha,
    Rainfed_Harvested_Ha,
    All_Harvested_Ha,
    Major_Yield_kg_per_ha,
    Minor_Yield_kg_per_ha,
    Rainfed_Yield_kg_per_ha,
    Average_Yield_kg_per_ha,
    Nett_Harvested_Ha,
    Total_Production_MT
  )

# Descriptive statistics table
descriptive_statistics <- numeric_data %>%
  summarise(
    across(
      everything(),
      list(
        N = ~sum(!is.na(.)),
        Mean = ~mean(., na.rm = TRUE),
        SD = ~sd(., na.rm = TRUE),
        Median = ~median(., na.rm = TRUE),
        Minimum = ~min(., na.rm = TRUE),
        Maximum = ~max(., na.rm = TRUE)
      )
    ))

descriptive_statistics

write.csv(
  descriptive_statistics,
  "D:/Sliit/3rd year 1 semester/Statistical Modeling/Paddy_Yield_Statistical_Modelling/Results/Task3_Descriptive_Statistics.csv",
  row.names = FALSE
)


# Descriptive statistics by season

season_statistics <- paddy %>%
  group_by(Season) %>%
  summarise(
    N = sum(!is.na(Average_Yield_kg_per_ha)),
    Mean_Yield = mean(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    SD_Yield = sd(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    Median_Yield = median(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    Minimum_Yield = min(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    Maximum_Yield = max(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    )
  )

season_statistics

write.csv(
  season_statistics,
  "D:/Sliit/3rd year 1 semester/Statistical Modeling/Paddy_Yield_Statistical_Modelling/Results/Task3_Season_Statistics.csv",
  row.names = FALSE
)

# Descriptive statistics by district

district_statistics <- paddy %>%
  group_by(Geography) %>%
  summarise(
    N = sum(!is.na(Average_Yield_kg_per_ha)),
    Mean_Yield = mean(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    SD_Yield = sd(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    Median_Yield = median(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    Minimum_Yield = min(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    Maximum_Yield = max(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    )
  )

district_statistics

write.csv(
  district_statistics,
  "D:/Sliit/3rd year 1 semester/Statistical Modeling/Paddy_Yield_Statistical_Modelling/Results/Task3_District_Statistics.csv",
  row.names = FALSE
)



# Figure 3.3 - Distribution of Average Paddy Yield

yield_histogram <- ggplot(
  paddy,
  aes(x = Average_Yield_kg_per_ha)
) +
  geom_histogram(
    bins = 30,
    fill = "#2E7D32",
    colour = "white",
    na.rm = TRUE
  ) +
  labs(
    title = "Distribution of Average Paddy Yield",
    x = "Average Yield (kg/ha)",
    y = "Frequency"
  ) +
  theme_minimal()

# Display histogram
yield_histogram

ggsave(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Figures\\Figure_3_3_Yield_Distribution.png",
  plot = yield_histogram,
  width = 8,
  height = 6,
  dpi = 300
)

# Figure 3.4 - Average Yield by Season

season_boxplot <- ggplot(
  paddy,
  aes(
    x = Season,
    y = Average_Yield_kg_per_ha
  )
) +
  geom_boxplot(
    fill = "#81C784",
    colour = "#2E7D32",
    na.rm = TRUE
  ) +
  labs(
    title = "Average Paddy Yield by Cultivation Season",
    x = "Cultivation Season",
    y = "Average Yield (kg/ha)"
  ) +
  theme_minimal()

# Display boxplot
season_boxplot

ggsave(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Figures\\Figure_3_4_Yield_by_Season.png",
  plot = season_boxplot,
  width = 7,
  height = 5,
  dpi = 300
)

# Figure 3.5 - Average Yield by District

district_boxplot <- ggplot(
  paddy,
  aes(
    x = reorder(Geography, Average_Yield_kg_per_ha, FUN = median),
    y = Average_Yield_kg_per_ha
  )
) +
  geom_boxplot(
    fill = "#81C784",
    colour = "#2E7D32",
    na.rm = TRUE
  ) +
  coord_flip() +
  labs(
    title = "Average Paddy Yield by District",
    x = "District",
    y = "Average Yield (kg/ha)"
  ) +
  theme_minimal()

# Display plot
district_boxplot

ggsave(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Figures\\Figure_3_5_Yield_by_District.png",
  plot = district_boxplot,
  width = 9,
  height = 8,
  dpi = 300
)

# Figure 3.6 - Average Yield Trend by Year and Season

year_season_yield <- paddy %>%
  group_by(Reference_Year, Season) %>%
  summarise(
    Mean_Yield = mean(
      Average_Yield_kg_per_ha,
      na.rm = TRUE
    ),
    .groups = "drop"
  )

yield_trend_plot <- ggplot(
  year_season_yield,
  aes(
    x = Reference_Year,
    y = Mean_Yield,
    group = Season,
    linetype = Season
  )
) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  labs(
    title = "Average Paddy Yield Trend by Year and Season",
    x = "Reference Year",
    y = "Average Yield (kg/ha)",
    linetype = "Season"
  ) +
  theme_minimal()

# Display plot
yield_trend_plot

ggsave(
  "D:\\Sliit\\3rd year 1 semester\\Statistical Modeling\\Paddy_Yield_Statistical_Modelling\\Figures\\Figure_3_6_Yield_Trend_by_Year_Season.png",
  plot = yield_trend_plot,
  width = 9,
  height = 6,
  dpi = 300
)

