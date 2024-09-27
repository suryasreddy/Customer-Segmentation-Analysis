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
The [dataset](https://www.kaggle.com/datasets/bkcoban/customer-transactions) we will be using for customer segmentation is derived from retail transaction records, which provide insights into both customer demographics and purchasing behavior. This data is crucial for understanding customer patterns and segmenting them based on their shopping habits. By analyzing these behaviors, we can uncover actionable insights that can help businesses improve marketing strategies, customer retention, and personalized recommendations.

### Fields Included
- **Customer ID**: The unique identifier for each customer. This field is essential for tracking individual customers across multiple transactions and linking demographic data to purchasing behavior.
- **Gender**: A key demographic field, allowing us to analyze and segment customers based on gender preferences and purchasing habits.
- **Age**: This field will be used to calculate the customer's age, which is critical for age-based segmentation and identifying generational buying patterns.
- **Transaction Amount**: The total monetary value of each transaction. This is a core metric that will help us analyze customer spending habits and categorize them based on how much they spend over time.
- **Date**: The date of the transaction. By analyzing transaction dates, we can identify purchasing trends over time, such as frequency of purchases, seasonal patterns, and loyalty.
- **Category**: The publication date of the video. This information is useful for understanding trends over time and the lifecycle of video popularity.

### Fields Not Used
- **Name and Surname**: These fields are included in the dataset but will not be used for analysis, as they are not relevant for customer segmentation.
- **Merchant Name**: While this field tracks where transactions occurred, it will not be used in this analysis, as the focus is on customer behavior rather than specific merchant relationships.

### Objective
The objective of analyzing these fields is to segment customers based on both demographic factors (such as age and gender) and their purchasing behaviors (such as spending patterns and product preferences). By doing so, we can help businesses tailor their marketing efforts to specific customer groups, offer personalized product recommendations, and increase customer engagement and satisfaction. The segmentation will enable a more precise understanding of customer behavior, empowering businesses to implement data-driven strategies that align with different customer needs and preferences.

## Data Analysis

### 1. What is the demographic breakdown of customers by gender and age?

#### Objective
Understand the distribution of customers based on gender and age groups.
#### Why?
This will help us identify which demographics are most represented in the customer base, enabling targeted marketing strategies.

### Data Visualization

| Gender | Count  | Percentage |
|--------|--------|------------|
| F      | 22,713 | 45.426%    |
| M      | 22,240 | 44.480%    |
| Other  | 5,047  | 10.094%    |
<img src="https://github.com/user-attachments/assets/1f5424b0-a104-4fd4-8b39-cc87e91f4a96" width="600">

#### Insights
The customer base shows a nearly balanced distribution between male and female customers, indicating the need for marketing approaches that cater equally to both genders.
A significant portion of the customer base identifies as 'Other', suggesting the importance of including non-binary or gender-neutral marketing strategies to appeal to this growing demographic segment.

### 2. How do spending habits vary by age group and gender?

#### Objective
Analyze the average transaction amount across different age groups and between males and females.
#### Why?
This will reveal which demographic segments spend more on average, helping in the development of customer-specific promotions or incentives.

### Data Visualization
<img src="https://github.com/user-attachments/assets/f8ba5f86-8764-49f5-bf3e-fd4051c2f96f" width="600">


#### Insights
- **Transaction Amounts**: Average spending ranges from **$250 to $400** across all age groups.
- **Gender Spending Patterns**: Similar spending patterns between genders, with marginal differences in some age groups.
- **Consistency in Spending**: Uniform spending behavior observed from ages 18 to 65+, indicating consistent purchasing power.

### 3. Which product categories are the most popular, and how do they vary by customer demographics?

#### Objective
Determine which product categories (e.g., electronics, apparel, groceries) are purchased most frequently and whether certain age groups or genders prefer specific categories.
#### Why?
This insight helps in refining product offerings and targeted campaigns based on customer preferences.

### Data Visualization
![image](https://github.com/user-attachments/assets/24d44bbd-1fe5-404b-9fb9-9c06d166c73a)


#### Insights
- **Category Popularity Across Age Groups**:
  - **Electronics** and **Market** categories show high transaction numbers consistently across all age groups, indicating a universal appeal.
  - **Travel** and **Restaurant** categories are less frequented, particularly by the older demographics (65+), which may reflect lifestyle or accessibility differences.

- **Gender Differences**:
  - Males predominantly engage more in transactions within the **Electronics** category across all age groups.
  - Females show a higher number of transactions in the **Clothing** and **Cosmetics** categories, especially within the 18-55 age groups.

- **Age Group Variations**:
  - Younger groups (18-25, 26-35) show greater activity in the **Restaurant** and **Travel** categories, likely reflecting different lifestyle preferences and disposable income levels.
  - The **65+** age group displays considerable activity in the **Market** category, suggesting a focus on essential goods.

### 4. How does customer spending vary over time (monthly, weekly, or seasonally)?

#### Objective
Track changes in total transaction amounts and purchase frequency over time, such as seasonal trends or differences by day of the week.
#### Why?
Understanding spending patterns over time can help in planning promotions and inventory management during peak seasons or slow periods.

### Data Visualization
<p align="center">
  <img src="https://github.com/user-attachments/assets/6d29caf3-3dd0-4a2d-8ff4-937c7b3c2c27" alt="Total Transaction Amount by Season" width="45%">
  <img src="https://github.com/user-attachments/assets/15b2e947-6de9-49ec-bb61-7e1214bba9ce" alt="Monthly Transaction Amount Over Time" width="45%">
</p>

#### Insights 

- **Seasonal Spending Trends**:
  - **Spring** and **Summer** see the highest transaction amounts, suggesting increased consumer activity during warmer months.
  - **Fall** shows the least spending, which could indicate a potential period for targeted promotions to boost sales.
  - **Winter** sees moderate spending, likely influenced by holiday shopping.

- **Monthly Spending Trends**:
  - Spending peaks in May and June, aligning with typical vacation planning and summer activities.
  - A sharp decline in transaction amounts is observed in September, marking the end of summer and possibly reflecting a return to school or work routines.

 ### 5. What are the characteristics of high-value vs. low-value customers?

#### Objective
Segment customers into groups based on their total transaction amounts (e.g., high spenders, low spenders) and analyze their demographics, purchasing behaviors, and product preferences.
#### Why?
Identifying high-value customers allows the business to focus on retention strategies, while low-value customer segments may benefit from upselling or cross-selling strategies.

### Data Visualization
<p align="center">
  <img src="https://github.com/user-attachments/assets/76808883-d335-47f5-b790-a82fb975c403" width="600">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/a71bd552-6c85-4238-9f1d-27c88de40bc7" width="600">
</p>
<p align="center">
  <img src="https://github.com/user-attachments/assets/7ddee729-d781-4b97-8bb6-cb53f7139af7" width="600">
</p>


#### 

- **Transaction Amount Distribution**:
  - High-value customers show a wide range of transaction amounts, indicating variability in their spending patterns.
  - Low-value customers have significantly lower transaction amounts, consistently across the board.
  - Medium spenders display moderate spending with less variability than high spenders.

- **Gender Distribution by Customer Segment**:
  - High-value and medium-value segments show a balanced gender distribution, with both genders nearly equally represented.
  - Low-value segments also exhibit a balanced gender distribution, suggesting uniformity across spending segments in terms of gender.

- **Product Category Preferences by Customer Segment**:
  - High spenders predominantly purchase in **Electronics** and **Travel**, indicating preferences for higher-value transactions.
  - Medium spenders show significant activity across **Clothing**, **Market**, and **Restaurant**, suggesting diverse interests.
  - Low spenders are most active in **Market** purchases, potentially indicating necessity-driven buying behavior.




