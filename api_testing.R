# Load Required Library
library(httr)

# Define API URL
api_url <- "http://127.0.0.1:8000/predict"

# Create a Sample Request
response <- POST(api_url, body = list(x1 = 10, x2 = 20), encode = "json")

# Print Response
print(content(response))
