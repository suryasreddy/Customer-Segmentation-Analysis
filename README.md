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

## Missing Values
No missing values were identified during the cleaning process, so no imputation or further adjustments were necessary. The only empty cells in the dataset were located in the Gender column with a small portion of them being blank. To deal with this I named every NULL cell "Other" for the purposes of preserving the data. The cleaned dataset was ready for the next stage of exploratory data analysis (EDA) and customer segmentation.
**Note:** The customer_data.csv file provided in the repository is the cleaned version of the dataset, which has undergone the above transformations and adjustments. It does not include the original raw data.

## Dataset Overview
The [dataset](https://www.kaggle.com/datasets/bkcoban/customer-transactions)) we will be using for customer segmentation is derived from retail transaction records, which provide insights into both customer demographics and purchasing behavior. This data is crucial for understanding customer patterns and segmenting them based on their shopping habits. By analyzing these behaviors, we can uncover actionable insights that can help businesses improve marketing strategies, customer retention, and personalized recommendations.

### Fields Included
- **Customer ID**: The unique identifier for each customer. This field is essential for tracking individual customers across multiple transactions and linking demographic data to purchasing behavior.
- **Gender**: A key demographic field, allowing us to analyze and segment customers based on gender preferences and purchasing habits.
- **Age**: This field will be used to calculate the customer's age, which is critical for age-based segmentation and identifying generational buying patterns.
- **Transaction Amount**: The total monetary value of each transaction. This is a core metric that will help us analyze customer spending habits and categorize them based on how much they spend over time.
- **Date**: The date of the transaction. By analyzing transaction dates, we can identify purchasing trends over time, such as frequency of purchases, seasonal patterns, and loyalty.
- **Category**: The publication date of the video. This information is useful for understanding trends over time and the lifecycle of video popularity.


