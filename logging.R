# Load Required Library
library(logger)

# Set Up Logging File
log_appender(appender_file("logs/model_logs.log"))

# Log Start of the Monitoring Process
log_info("Monitoring process started at {Sys.time()}")

# Function to Log Model Performance
log_performance <- function(metric_name, metric_value) {
  log_info("{metric_name}: {metric_value}")
}

# Load Performance Metrics
performance_metrics <- read.csv("results/performance_metrics.csv")

# Log Accuracy, Precision, Recall, and F1-Score
log_performance("Accuracy", performance_metrics$Accuracy)
log_performance("Precision", performance_metrics$Precision)
log_performance("Recall", performance_metrics$Recall)
log_performance("F1 Score", performance_metrics$F1_Score)

# Log Completion of the Monitoring Process
log_info("Monitoring process completed at {Sys.time()}")

print("Logging completed successfully!")
