# Load the data file
source("final_problem4_data.R")

# Inspect the data
head(x)   # x_i values
head(Y)   # Y_i values

# Initialize
max_d <- 10 # Adjust as necessary
coefficients_list <- list()

for (d in 1:max_d) {
  # Create the design matrix for polynomial regression
  X <- model.matrix(~ poly(x, d, raw = TRUE))  # Polynomial terms up to degree d
  
  # Fit the model
  fit <- lm(Y ~ X - 1)  # No intercept since it's included in the polynomial terms
  
  # Store coefficients
  coefficients_list[[d]] <- coef(fit)
  
  # Check the leading coefficient
  leading_coeff <- tail(coefficients_list[[d]], 1)
  cat("d =", d, ", Leading coefficient =", leading_coeff, "\n")
  
  # Stop if the leading coefficient is near zero
  if (abs(leading_coeff) < 1e-6) {
    cat("Optimal value of d found:", d, "\n")
    break
  }
}

# Fit the final model with the chosen d
final_d <- d  # Replace with the chosen value
X_final <- model.matrix(~ poly(x, final_d, raw = TRUE))
final_fit <- lm(Y ~ X_final - 1)

# Extract the estimate and standard error for alpha_1
alpha1_hat <- coef(final_fit)[1]
se_alpha1 <- summary(final_fit)$coefficients[1, 2]

# Perform the t-test
t_stat <- alpha1_hat / se_alpha1
p_value <- 2 * pt(-abs(t_stat), df = length(Y) - (final_d + 1))  # Two-sided p-value
cat("Estimate of alpha_1 =", alpha1_hat, "\n")
cat("P-value for H0: alpha_1 = 0:", p_value, "\n")

# Critical t-value for 95% CI
t_crit <- qt(0.975, df = length(Y) - (final_d + 1))

# Confidence interval
ci_lower <- alpha1_hat - t_crit * se_alpha1
ci_upper <- alpha1_hat + t_crit * se_alpha1
cat("95% Confidence Interval for alpha_1: [", ci_lower, ",", ci_upper, "]\n")
