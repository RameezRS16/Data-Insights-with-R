# Load Required Libraries
library(dplyr)
library(caret)

# Load Dataset
dataset <- read.csv("data/secured_dataset.csv")

# Load Trained Model
model <- readRDS("models/tuned_random_forest_model.rds")

# Generate Predictions
dataset$predictions <- predict(model, dataset)

# Check Bias Across a Sensitive Attribute (e.g., Gender)
bias_summary <- dataset %>%
  group_by(Gender) %>%
  summarise(
    Mean_Prediction = mean(as.numeric(predictions)),
    Count = n()
  )

# Save Bias Report
write.csv(bias_summary, "results/bias_report.csv", row.names = FALSE)

print("Bias analysis completed successfully!")
