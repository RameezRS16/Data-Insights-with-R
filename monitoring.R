# Load Required Libraries
library(caret)
library(ggplot2)

# Load New Test Data
new_test_data <- read.csv("data/new_test_dataset.csv")

# Load Trained Model
model <- readRDS("models/tuned_random_forest_model.rds")

# Generate Predictions
new_predictions <- predict(model, new_test_data)

# Evaluate Performance
conf_matrix <- confusionMatrix(new_predictions, new_test_data$target_variable)

# Save Performance Metrics
performance_metrics <- data.frame(
  Accuracy = conf_matrix$overall["Accuracy"],
  Precision = conf_matrix$byClass["Precision"],
  Recall = conf_matrix$byClass["Recall"],
  F1_Score = 2 * (conf_matrix$byClass["Precision"] * conf_matrix$byClass["Recall"]) / 
             (conf_matrix$byClass["Precision"] + conf_matrix$byClass["Recall"])
)
write.csv(performance_metrics, "results/performance_metrics.csv", row.names = FALSE)

# Visualization of Accuracy Over Time
accuracy_history <- read.csv("results/accuracy_history.csv")
accuracy_history <- rbind(accuracy_history, data.frame(Timestamp = Sys.time(), Accuracy = performance_metrics$Accuracy))
write.csv(accuracy_history, "results/accuracy_history.csv", row.names = FALSE)

ggplot(accuracy_history, aes(x = Timestamp, y = Accuracy)) +
  geom_line() +
  geom_point() +
  ggtitle("Model Accuracy Over Time") +
  theme_minimal()

print("Model monitoring completed successfully!")
