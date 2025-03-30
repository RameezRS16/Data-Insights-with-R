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

# Define Parameter Grid for Hyperparameter Tuning
tune_grid <- expand.grid(mtry = c(2, 4, 6),
                         splitrule = c("gini", "extratrees"),
                         min.node.size = c(1, 5, 10))

# Train Random Forest with Hyperparameter Tuning
tuned_model <- train(target_variable ~ ., data = train_data,
                     method = "ranger",
                     trControl = trainControl(method = "cv", number = 5),
                     tuneGrid = tune_grid)

# Best Model Parameters
print(tuned_model$bestTune)

# Predictions on Test Set
tuned_predictions <- predict(tuned_model, test_data)

# Evaluate Model Performance
conf_matrix <- confusionMatrix(tuned_predictions, test_data$target_variable)
print(conf_matrix)

# Save the Tuned Model
saveRDS(tuned_model, "models/tuned_random_forest_model.rds")

print("Model tuning completed successfully!")
