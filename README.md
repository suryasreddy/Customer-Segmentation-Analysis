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
