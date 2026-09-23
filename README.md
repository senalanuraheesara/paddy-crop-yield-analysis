# Paddy Crop Yield Analysis

## Statistical Modelling Approach for Paddy Yield Analysis and Prediction in Sri Lanka

---

## Project Overview

This project focuses on analysing historical paddy cultivation data in Sri Lanka to identify factors influencing crop yield and develop statistical models for yield prediction.

The project is conducted as part of the **IT3081 – Statistical Modelling Group Assignment**, where the team acts as a statistical consulting company to transform agricultural data into meaningful insights and evidence-based recommendations.

The main objective is to analyse patterns in paddy production, evaluate statistical relationships between agricultural factors, and develop predictive models that can support agricultural decision-making.

---

# Problem Statement

Agricultural organizations require reliable information about crop productivity to support:

- Production planning
- Resource allocation
- Food security decisions
- Agricultural policy development
- Risk management

Variations in paddy yield occur due to factors such as:

- Cultivation season
- Geographic location
- Cultivated area
- Harvested area
- Farming systems
- Historical trends

This project aims to identify important factors affecting paddy yield and build statistical models for predicting future yield outcomes.

---

# Project Objectives

The objectives of this project are:

1. Analyse historical paddy cultivation patterns across Sri Lankan districts.

2. Identify statistical relationships between cultivation factors and crop yield.

3. Perform descriptive and inferential statistical analysis.

4. Develop predictive regression models for paddy yield estimation.

5. Evaluate advanced statistical techniques including:
   - Regression modelling
   - Principal Component Analysis (PCA)
   - Bayesian statistical approaches
   - Time series analysis applications

6. Propose a data-driven decision support solution for agricultural stakeholders.

---

# Dataset Description

## Dataset Name

**Sri Lanka Paddy Crop Yield Dataset**

## Data Source

The dataset was constructed from official paddy statistics reports containing district-level cultivation information.

## Dataset Coverage

The dataset contains historical records across:

- Multiple years
- Maha and Yala cultivation seasons
- Sri Lankan districts

## Main Variables

| Variable | Description |
|---|---|
| Year | Cultivation year |
| Season | Maha / Yala cultivation season |
| District | Paddy cultivation location |
| Major Sown Area | Cultivated area under major irrigation schemes |
| Minor Sown Area | Cultivated area under minor irrigation schemes |
| Rainfed Sown Area | Rain-dependent cultivated area |
| Harvested Area | Successfully harvested land extent |
| Average Yield | Paddy yield per hectare |
| Nett Harvested Area | Productive harvested extent |
| Total Production | Total paddy production in metric tons |

---

# Research Questions

This project investigates:

### 1. Yield Variation Analysis

- How does paddy yield vary across districts?
- Are there differences between Maha and Yala seasons?

### 2. Factor Analysis

- Which agricultural factors influence yield?
- Does harvested area significantly affect production?

### 3. Prediction

- Can historical agricultural data be used to predict future paddy yield?

---

# Statistical Methodology

## 1. Data Preprocessing

Activities:

- Data cleaning
- Missing value analysis
- Outlier detection
- Feature preparation
- Data transformation


## 2. Exploratory Data Analysis (EDA)

Analysis includes:

- Yield trends over time
- District-level comparisons
- Seasonal comparisons
- Production analysis
- Statistical summaries


## 3. Statistical Inference

Planned methods:

- Hypothesis testing
- Comparison of means
- ANOVA analysis
- Variance comparison


## 4. Predictive Modelling

The main prediction target:

```
Average_Yield_kg_per_ha
```

Candidate models:

- Multiple Linear Regression
- Ridge Regression
- LASSO Regression
- Generalized Linear Models


## 5. Advanced Statistical Evaluation

Additional methods:

### Principal Component Analysis (PCA)

Used to evaluate:

- Feature relationships
- Dimensionality reduction
- Important agricultural factors


### Bayesian Methods

Evaluated for:

- Uncertainty estimation
- Probabilistic decision-making


### Time Series Analysis

Discussed for:

- Long-term yield trends
- Seasonal forecasting
- Future agricultural planning

---

# Project Structure

```
paddy-crop-yield-analysis/

│
├── README.md
│
├── data/
│   ├── raw/
│   │   └── original_dataset.csv
│   │
│   └── processed/
│       └── cleaned_dataset.csv
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_analysis.ipynb
│   ├── 03_statistical_tests.ipynb
│   ├── 04_regression_models.ipynb
│   └── 05_pca_analysis.ipynb
│
├── src/
│   ├── preprocessing.py
│   ├── modelling.py
│   └── visualization.py
│
├── results/
│   ├── figures/
│   └── model_outputs/
│
├── reports/
│   ├── final_report.pdf
│   └── presentation.pptx
│
└── requirements.txt
```

---

# Technologies Used

Programming Language:

- Python

Libraries:

- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Statsmodels
- Jupyter Notebook


---

# Expected Outcomes

The project aims to deliver:

- Understanding of paddy yield patterns
- Identification of significant yield-related factors
- Statistical evidence supporting agricultural decisions
- Predictive yield models
- Recommendations for data-driven agricultural planning

---

# Team Members

| Name | Role |
|---|---|
| IT24102643 | Data Analysis |
| IT24103055 | Statistical Modelling |
| IT24103549 | Visualization |
| IT24102822 | Report & Documentation |

---

# Acknowledgement

The dataset sources, research papers, software tools, and analytical methods used in this project will be properly acknowledged according to academic integrity requirements.

---

# License

This project is developed for academic purposes as part of the IT3081 Statistical Modelling course.
