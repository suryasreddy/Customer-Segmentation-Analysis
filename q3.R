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

# 1. Popular Product Categories Overall
category_popularity <- data_clean %>%
  group_by(Category) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count))

# Print the category popularity
print(category_popularity)

# 2. Popularity of Product Categories by Gender and Age Group
category_demographics <- data_clean %>%
  group_by(Category, Gender, Age_Group) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count))

# Print the category popularity by demographics
print(category_demographics)

# 3. Visualization: Most popular categories overall
ggplot(category_popularity, aes(x = reorder(Category, -Count), y = Count, fill = Category)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Most Popular Product Categories",
       x = "Product Category",
       y = "Number of Purchases") +
  theme_minimal() +
  theme(legend.position = "none")

# 4. Visualization: Product categories by gender and age group
ggplot(category_demographics, aes(x = Age_Group, y = Count, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Category, scales = "free_y") +
  labs(title = "Popularity of Product Categories by Gender and Age Group",
       x = "Age Group",
       y = "Number of Purchases") +
  theme_minimal()
