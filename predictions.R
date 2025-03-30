# Load Required Libraries
library(caret)

# Load the Tuned Model
tuned_model <- readRDS("models/tuned_random_forest_model.rds")

# Load New Data for Predictions
new_data <- read.csv("data/new_dataset.csv")

# Ensure Same Preprocessing as Training Data
# (Apply the same feature engineering steps here if needed)

# Make Predictions
predictions <- predict(tuned_model, new_data)

# Save Predictions to CSV
predictions_df <- data.frame(new_data, Predicted_Value = predictions)
write.csv(predictions_df, "results/predictions.csv", row.names = FALSE)

print("Predictions generated and saved successfully!")
