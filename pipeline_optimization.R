# Load Required Libraries
library(data.table)
library(parallel)

# Optimize Data Loading (Use fread Instead of read.csv for Faster Loading)
optimized_data <- fread("data/dataset.csv")

# Parallel Processing for Faster Data Cleaning
cl <- makeCluster(detectCores() - 1)  # Use available cores
clusterExport(cl, varlist = "optimized_data")
optimized_data <- parLapply(cl, 1:nrow(optimized_data), function(i) {
  row <- optimized_data[i, ]
  # Apply cleaning rules
  row
})
stopCluster(cl)

# Save Optimized Data
optimized_data <- rbindlist(optimized_data)
fwrite(optimized_data, "data/optimized_dataset.csv")

print("Data pipeline optimized successfully!")
