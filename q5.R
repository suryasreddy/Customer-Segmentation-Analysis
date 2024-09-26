# Load necessary libraries
library(dplyr)
library(ggplot2)

setwd("/Users/suryareddy/Desktop/Data_Analyst_Projects/Customer_Segmentation/")
# Load the dataset
data <- read.csv("customer_data.csv")

# Check the structure of the dataset
str(data)

# 1. Calculate the total transaction amount for each customer
customer_spending <- data %>%
  group_by(Customer.ID, Gender, Age) %>%
  summarise(Total_Transaction_Amount = sum(Transaction.Amount, na.rm = TRUE),
            Transaction_Count = n()) %>%
  ungroup()

# 2. Segment customers into low, medium, and high-value groups based on their total spending
# We'll use quantiles to segment the customers
customer_spending <- customer_spending %>%
  mutate(Spending_Segment = case_when(
    Total_Transaction_Amount >= quantile(Total_Transaction_Amount, 0.75) ~ "High",
    Total_Transaction_Amount >= quantile(Total_Transaction_Amount, 0.25) ~ "Medium",
    TRUE ~ "Low"
  ))

# Print the customer segments summary
print(customer_spending)

# 3. Analyze demographics and behavior by segment
segment_summary <- customer_spending %>%
  group_by(Spending_Segment) %>%
  summarise(
    Avg_Age = mean(Age, na.rm = TRUE),
    Gender_Distribution = list(table(Gender)),
    Avg_Transaction_Amount = mean(Total_Transaction_Amount, na.rm = TRUE),
    Avg_Transaction_Count = mean(Transaction_Count, na.rm = TRUE)
  )

# Print the segment summary
print(segment_summary)

# 4. Analyze product preferences by segment
product_preferences <- data %>%
  inner_join(customer_spending, by = "Customer.ID") %>%
  group_by(Spending_Segment, Category) %>%
  summarise(Category_Count = n()) %>%
  arrange(desc(Category_Count))

# Print the product preferences summary
print(product_preferences)

# 5. Visualization: Transaction amount distribution by segment
ggplot(customer_spending, aes(x = Spending_Segment, y = Total_Transaction_Amount, fill = Spending_Segment)) +
  geom_boxplot() +
  labs(title = "Transaction Amount Distribution by Customer Segment",
       x = "Customer Segment",
       y = "Total Transaction Amount") +
  theme_minimal()

# 6. Visualization: Gender distribution by segment
ggplot(customer_spending, aes(x = Spending_Segment, fill = Gender)) +
  geom_bar(position = "fill") +
  labs(title = "Gender Distribution by Customer Segment",
       x = "Customer Segment",
       y = "Proportion of Customers") +
  theme_minimal()

# 7. Visualization: Product category preferences by customer segment
ggplot(product_preferences, aes(x = Category, y = Category_Count, fill = Spending_Segment)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Product Category Preferences by Customer Segment",
       x = "Product Category",
       y = "Number of Purchases") +
  theme_minimal()

