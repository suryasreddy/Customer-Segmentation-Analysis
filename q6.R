# Load necessary libraries
library(dplyr)
library(ggplot2)

setwd("/Users/suryareddy/Desktop/Data_Analyst_Projects/Customer_Segmentation/")
# Load the dataset
data <- read.csv("customer_data.csv")

# Check the structure of the dataset
str(data)

# 1. Correlation Between Customer Age and Spending
# Group by customer to calculate total spending
customer_spending <- data %>%
  group_by(Customer.ID, Age) %>%
  summarise(Total_Transaction_Amount = sum(Transaction.Amount, na.rm = TRUE))

# Calculate Pearson correlation between Age and Total Transaction Amount
correlation_age_spending <- cor(customer_spending$Age, customer_spending$Total_Transaction_Amount, use = "complete.obs", method = "pearson")

# Print the correlation result
print(paste("Correlation between Age and Spending:", correlation_age_spending))

# Visualization: Scatter plot of Age vs Total Transaction Amount
ggplot(customer_spending, aes(x = Age, y = Total_Transaction_Amount)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Correlation between Age and Spending",
       x = "Customer Age",
       y = "Total Transaction Amount") +
  theme_minimal()

# 2. Correlation Between Product Categories and Transaction Amounts
# Group by product category to calculate average transaction amount
category_spending <- data %>%
  group_by(Category) %>%
  summarise(Avg_Transaction_Amount = mean(Transaction.Amount, na.rm = TRUE))

# Print the average transaction amount by category
print(category_spending)

# Visualization: Bar plot of Average Transaction Amount by Category
ggplot(category_spending, aes(x = reorder(Category, -Avg_Transaction_Amount), y = Avg_Transaction_Amount, fill = Category)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Average Transaction Amount by Product Category",
       x = "Product Category",
       y = "Average Transaction Amount") +
  theme_minimal()
