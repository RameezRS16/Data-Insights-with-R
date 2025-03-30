# Load Required Libraries
library(dplyr)

# Load Cleaned Data
data <- read.csv("data/cleaned_dataset.csv")

# Summary Statistics
summary(data)

# Correlation Matrix
cor_matrix <- cor(data[, sapply(data, is.numeric)], use = "complete.obs")
print(cor_matrix)

# Hypothesis Testing: t-test (Example: Compare Two Groups)
t_test_result <- t.test(data$numeric_column ~ data$category_column)
print(t_test_result)

# ANOVA Test (For Multiple Group Comparisons)
anova_result <- aov(numeric_column ~ category_column, data = data)
summary(anova_result)

# Chi-Square Test (For Categorical Variables)
chi_result <- chisq.test(table(data$category_column1, data$category_column2))
print(chi_result)

print("Statistical analysis completed successfully!")

