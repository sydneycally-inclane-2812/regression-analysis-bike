library(tidyverse)
library(ggplot)
install.packages("ggplot2")

# Load the data
data <- read_csv("Bike Prices.csv")

# Remove the Model column
data <- data %>% select(-Model)
data <- data %>% select(-Seller_Type)
data <- data %>% select(-Ex_Showroom_Price)
data

# Create a scatter plot
ggplot(data, aes(x = Year, y = Selling_Price)) +
  geom_point() +
  labs(title = "Bike Prices Over Time",
       x = "Year",
       y = "Selling Price") +
  theme_minimal()

# Save the plot
ggsave("bike_prices.png", bg = "white")

# Create a histogram of the Selling Price
ggplot(data, aes(x = Selling_Price)) +
  geom_histogram(binwidth = 5000, fill = "#04ffab", color = "black") +
  labs(title = "Distribution of Selling Prices",
       x = "Selling Price",
       y = "Frequency") +
  theme_minimal()

# Create a log transformation of the Selling Price
data$log_Selling_Price <- log(data$Selling_Price)

# Create a histogram of the log transformed Selling Price
ggplot(data, aes(x = log_Selling_Price)) +
  geom_histogram(binwidth = 0.5, fill = "#04ffab", color = "black") +
  labs(title = "Distribution of Log Transformed Selling Prices",
       x = "Log Selling Price",
       y = "Frequency") +
  theme_minimal()
o