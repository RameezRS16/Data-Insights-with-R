# Load Required Libraries
library(ggplot2)
library(dplyr)

# Load Cleaned Data
data <- read.csv("data/cleaned_dataset.csv")

# Bar Plot (Categorical Variable)
ggplot(data, aes(x = factor(category_column))) +
  geom_bar(fill = "blue") +
  labs(title = "Category-wise Distribution", x = "Category", y = "Count")

# Scatter Plot (Numerical Variables)
ggplot(data, aes(x = numeric_column1, y = numeric_column2)) +
  geom_point(color = "red") +
  labs(title = "Scatter Plot", x = "X-Axis Label", y = "Y-Axis Label")

# Boxplot (Outlier Detection)
ggplot(data, aes(x = factor(category_column), y = numeric_column)) +
  geom_boxplot(fill = "green", alpha = 0.5) +
  labs(title = "Boxplot Analysis", x = "Category", y = "Value")

# Save Visualizations (Optional)
ggsave("assets/barplot.png")

print("Data visualization completed successfully!")
