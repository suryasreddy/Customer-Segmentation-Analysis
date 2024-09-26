# Load necessary libraries
library(dplyr)
library(ggplot2)

setwd("/Users/suryareddy/Desktop/Data_Analyst_Projects/Customer_Segmentation/")
# Load the dataset
data <- read.csv("customer_data.csv")

# Check the structure of the dataset
str(data)

# Replace missing or empty Gender values with "Other"
data_clean <- data %>%
  mutate(Gender = ifelse(is.na(Gender) | Gender == "", "Other", Gender))

# Gender distribution with count and percentage
gender_distribution <- data_clean %>%
  group_by(Gender) %>%
  summarise(Count = n()) %>%
  mutate(Percentage = Count / sum(Count) * 100)

# Print the gender distribution
print(gender_distribution)

# Visualization: Pie chart of Gender distribution with numbers
ggplot(gender_distribution, aes(x = "", y = Count, fill = Gender)) +
  geom_bar(stat = "identity", width = 1) + 
  coord_polar(theta = "y") +
  geom_text(aes(label = paste0(Count, " (", round(Percentage, 1), "%)")), 
            position = position_stack(vjust = 0.5), color = "white") +  # Add text labels inside the slices
  scale_fill_manual(values = c("M" = "#1f77b4", "F" = "#ff7f0e", "Other" = "#2ca02c")) +  # Custom colors for clarity
  labs(title = "Gender Distribution of Customers") +
  theme_void() +
  theme(legend.position = "right")

