# Load Required Libraries
library(ggplot2)
library(dplyr)

# Load Cleaned Data
data <- read.csv("data/cleaned_dataset.csv")

# Summary Statistics
summary(data)

# Correlation Matrix (Numerical Features)
correlation_matrix <- cor(data[, sapply(data, is.numeric)], use = "complete.obs")
print(correlation_matrix)

# Histogram of a Numeric Column (Replace 'column_name' with actual column)
ggplot(data, aes(x = column_name)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  labs(title = "Distribution of Column", x = "Column Name", y = "Count")

# Boxplot for Outlier Detection
ggplot(data, aes(y = column_name)) +
  geom_boxplot(fill = "red", alpha = 0.5) +
  labs(title = "Boxplot of Column", y = "Column Name")

print("Exploratory Data Analysis Completed!")




