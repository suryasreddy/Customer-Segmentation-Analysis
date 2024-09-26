# Load necessary libraries
library(dplyr)
library(ggplot2)

setwd("/Users/suryareddy/Desktop/Data_Analyst_Projects/Customer_Segmentation/")
# Load the dataset
data <- read.csv("customer_data.csv")

# Check the structure of the dataset
str(data)

# Create age groups
data <- data %>%
  mutate(Age_Group = case_when(
    Age >= 18 & Age <= 25 ~ "18-25",
    Age >= 26 & Age <= 35 ~ "26-35",
    Age >= 36 & Age <= 45 ~ "36-45",
    Age >= 46 & Age <= 55 ~ "46-55",
    Age >= 56 & Age <= 65 ~ "56-65",
    Age > 65 ~ "65+",
    TRUE ~ "Unknown"
  ))

# Remove rows with missing gender values
data_clean <- data %>% filter(!is.na(Gender))

# Group by Gender and Age Group, and calculate average transaction amount
spending_habits <- data_clean %>%
  group_by(Gender, Age_Group) %>%
  summarise(Average_Transaction_Amount = mean(Transaction.Amount, na.rm = TRUE))

# Print the summary
print(spending_habits)

# Visualization: Bar plot of average transaction amount by gender and age group
ggplot(spending_habits, aes(x = Age_Group, y = Average_Transaction_Amount, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Transaction Amount by Age Group and Gender",
       x = "Age Group",
       y = "Average Transaction Amount") +
  theme_minimal() +
  theme(legend.position = "right")
