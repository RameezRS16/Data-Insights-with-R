# Load Required Libraries
library(dplyr)

# Load Cleaned Data
data <- read.csv("data/cleaned_dataset.csv")

# Creating a New Feature (Example: Log Transformation for Skewed Data)
data$log_numeric_column <- log1p(data$numeric_column)

# Creating an Interaction Feature (Multiplying Two Numeric Columns)
data$interaction_feature <- data$numeric_column1 * data$numeric_column2

# Encoding Categorical Variables (One-Hot Encoding)
data <- data %>%
  mutate(category_encoded = as.numeric(factor(category_column)))

# Binning a Numeric Column into Categories
data <- data %>%
  mutate(numeric_binned = cut(numeric_column, breaks = 3, labels = c("Low", "Medium", "High")))

# Save the Feature-Engineered Data
write.csv(data, "data/feature_engineered_dataset.csv", row.names = FALSE)

print("Feature engineering completed successfully!")

