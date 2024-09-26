# Load necessary libraries
library(dplyr)
library(ggplot2)
library(lubridate)

setwd("/Users/suryareddy/Desktop/Data_Analyst_Projects/Customer_Segmentation/")
# Load the dataset
data <- read.csv("customer_data.csv")

# Check the structure of the dataset
str(data)

# Convert 'Transaction Date' to date format
data$Transaction.Date <- as.Date(data$Transaction.Date, format = "%Y-%m-%d")

# Create time components
data <- data %>%
  mutate(Month = month(Transaction.Date, label = TRUE),  # Extract the month
         Weekday = wday(Transaction.Date, label = TRUE),  # Extract the day of the week
         Year = year(Transaction.Date),                  # Extract the year
         Quarter = quarter(Transaction.Date),            # Extract the quarter
         Season = case_when(
           Month %in% c("Dec", "Jan", "Feb") ~ "Winter",
           Month %in% c("Mar", "Apr", "May") ~ "Spring",
           Month %in% c("Jun", "Jul", "Aug") ~ "Summer",
           TRUE ~ "Fall"  # Sep, Oct, Nov
         ))

# 1. Total transaction amounts by month
monthly_spending <- data %>%
  group_by(Year, Month) %>%
  summarise(Total_Transaction_Amount = sum(Transaction.Amount, na.rm = TRUE),
            Transaction_Count = n())

# Print the monthly spending data
print(monthly_spending)

# 2. Total transaction amounts by weekday
weekday_spending <- data %>%
  group_by(Weekday) %>%
  summarise(Total_Transaction_Amount = sum(Transaction.Amount, na.rm = TRUE),
            Transaction_Count = n())

# Print the weekday spending data
print(weekday_spending)

# 3. Total transaction amounts by season
seasonal_spending <- data %>%
  group_by(Year, Season) %>%
  summarise(Total_Transaction_Amount = sum(Transaction.Amount, na.rm = TRUE),
            Transaction_Count = n())

# Print the seasonal spending data
print(seasonal_spending)

# 4. Visualization: Monthly transaction amounts
ggplot(monthly_spending, aes(x = Month, y = Total_Transaction_Amount, group = Year, color = as.factor(Year))) +
  geom_line(size = 1.2) +
  labs(title = "Monthly Transaction Amount Over Time",
       x = "Month",
       y = "Total Transaction Amount") +
  theme_minimal()

# 5. Visualization: Weekly transaction amounts
ggplot(weekday_spending, aes(x = Weekday, y = Total_Transaction_Amount, fill = Weekday)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Transaction Amount by Day of the Week",
       x = "Day of the Week",
       y = "Total Transaction Amount") +
  theme_minimal()

# 6. Visualization: Seasonal transaction amounts
ggplot(seasonal_spending, aes(x = Season, y = Total_Transaction_Amount, fill = Season)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Transaction Amount by Season",
       x = "Season",
       y = "Total Transaction Amount") +
  theme_minimal()
