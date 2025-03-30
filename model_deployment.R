# Load Required Libraries
library(plumber)

# Load the Trained Model
model <- readRDS("models/tuned_random_forest_model.rds")

# Define API Endpoints
#* @apiTitle ML Model API

#* Predict on new data
#* @param x1 Numeric input 1
#* @param x2 Numeric input 2
#* @post /predict
function(x1, x2) {
  new_data <- data.frame(numeric_column1 = as.numeric(x1), 
                         numeric_column2 = as.numeric(x2))
  prediction <- predict(model, new_data)
  return(list(prediction = prediction))
}

# Run API (Uncomment below line to run locally)
# pr <- plumber::plumb("model_deployment.R")
# pr$run(port = 8000)
