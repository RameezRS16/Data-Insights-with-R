# Load Required Libraries
library(dplyr)

# Load Dataset
data <- read.csv("data/dataset.csv")  # Apne dataset ka path update karo

# Checking for Missing Values
sum(is.na(data))

# Handling Missing Values (Example: Replacing NA with Mean)
data <- data %>% mutate(across(where(is.numeric), ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))

# Removing Duplicates
data <- distinct(data)

# Summary After Cleaning
summary(data)

# Save Cleaned Data
write.csv(data, "data/cleaned_dataset.csv", row.names = FALSE)

print("Data cleaning completed successfully!")



