# Load Required Libraries
library(digest)
library(openssl)

# Function to Hash Sensitive Data (SHA-256)
hash_sensitive_data <- function(data_column) {
  return(sapply(data_column, function(x) digest(x, algo = "sha256")))
}

# Load Dataset
dataset <- read.csv("data/optimized_dataset.csv")

# Apply Hashing to Sensitive Columns
dataset$user_id <- hash_sensitive_data(dataset$user_id)
dataset$email <- hash_sensitive_data(dataset$email)

# Save Secured Dataset
write.csv(dataset, "data/secured_dataset.csv", row.names = FALSE)

print("Data security applied successfully!")
