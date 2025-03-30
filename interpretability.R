# Load Required Libraries
library(DALEX)
library(ggplot2)

# Load Dataset
dataset <- read.csv("data/secured_dataset.csv")

# Load Trained Model
model <- readRDS("models/tuned_random_forest_model.rds")

# Create Explainer Object
explainer <- DALEX::explain(model,  
                            data = dataset[, -which(names(dataset) == "target_variable")],  
                            y = dataset$target_variable,  
                            label = "Random Forest Model")

# Generate Feature Importance
feature_importance <- DALEX::model_parts(explainer)
plot(feature_importance)

# Save Feature Importance Results
write.csv(feature_importance, "results/feature_importance.csv", row.names = FALSE)

print("Model interpretability analysis completed successfully!")
