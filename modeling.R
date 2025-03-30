 # Load Required Libraries
library(caret)
library(randomForest)

# Load Feature-Engineered Data
data <- read.csv("data/feature_engineered_dataset.csv")

# Split Data into Training & Testing Sets
set.seed(123)
trainIndex <- createDataPartition(data$target_variable, p = 0.8, list = FALSE)
train_data <- data[trainIndex, ]
test_data  <- data[-trainIndex, ]

# Train a Random Forest Model
model <- randomForest(target_variable ~ ., data = train_data, ntree = 100)

# Model Summary
print(model)

# Predictions on Test Set
predictions <- predict(model, test_data)

# Evaluate Model Performance
conf_matrix <- confusionMatrix(predictions, test_data$target_variable)
print(conf_matrix)

# Save the Model
saveRDS(model, "models/random_forest_model.rds")

print("Machine Learning Model Training Completed!")
