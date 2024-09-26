# Unlocking Customer Insights: Segmentation Analysis for Retail Business

## Introduction
### Background and Problem Statement
In today’s highly competitive retail environment, understanding customer behavior and tailoring marketing strategies accordingly is crucial for business success. Retailers often face the challenge of addressing the diverse needs of their customers, who vary in terms of purchasing habits, preferences, and demographics. Segmenting customers based on these factors can help retailers better target their marketing efforts, increase customer satisfaction, and ultimately drive more sales.
In this project, I will explore customer segmentation by analyzing purchasing behaviors and demographic data from a retail business. The aim is to categorize customers into distinct groups based on common characteristics such as purchasing frequency, product preferences, and demographic attributes like age, income, and location. By identifying these customer segments, businesses can create personalized marketing strategies and improve customer engagement.
The ultimate goal of this project is to provide actionable insights that can help the business enhance customer retention and loyalty, improve product recommendations, and optimize marketing campaigns.

### Tools Used
- **Excel, R**: Data cleaning and wrangling
- **R (ggplot2)**: Exploratory Data Analysis (EDA) and data visualization
- **R (K-means clustering)**: Customer segmentation based on purchasing behavior and demographics
- **Tableau, R**: Building Dashboard
  
[Visit Dashboard](https://public.tableau.com/app/profile/surya.reddy1876/viz/Customer-Segmentation-Analysis/Dashboard1?publish=yes)

## Data Cleaning

For the customer segmentation project, data cleaning steps were performed to ensure the dataset was structured properly for analysis and free of unnecessary information. The cleaning process was executed in Excel to prepare the data for further analysis in R.

### Column Removal
Initially, three columns—`Name`, `Surname`, and `Merchant Name`—were removed, as they were not relevant to the analysis. These fields did not contribute to understanding customer behavior or demographics and were excluded to streamline the dataset and focus on the key variables needed for segmentation.

### Birthdate to Age Transformation
The `Birthdate` column was transformed into an `Age` column. This was done by calculating each customer’s age based on the current date and their birthdate. The following formula was applied in Excel to extract the year of birth and calculate the age:

```excel
=DATEDIF(C2, TODAY(), "Y")
```

### Date Column Renaming
For improved readability and clarity, the Date column was renamed to Transaction Date. This change helps clarify the type of information this field contains and ensures consistency when performing time-based analyses, such as calculating transaction frequency or identifying trends over time.

## Missing Values:
No missing values were identified during the cleaning process, so no imputation or further adjustments were necessary. The cleaned dataset was ready for the next stage of exploratory data analysis (EDA) and customer segmentation.
**Note:** The data file provided in the repository is the cleaned version of the dataset, which has undergone the above transformations and adjustments. It does not include the original raw data.



