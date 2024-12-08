# Set parameters
set.seed(123)   # For reproducibility
n <- 20         # Sample size
num_sim <- 100000   # Number of simulations
sigma_epsilon <- 2 # Standard deviation (sqrt(4))

# Generate X values
x <- 1:n

# Coefficients
alpha1 <- 2
alpha2 <- 1
alpha3 <- 1
alpha4 <- 2

# Initialize a vector to store sums of estimates
sum_alpha_hat <- numeric(num_sim)

for (sim in 1:num_sim) {
  # Generate random errors
  epsilon <- rnorm(n, mean = 0, sd = 4)
  
  # Generate Y values
  Y <- alpha1 + alpha2 * x + alpha3 * x^2 + alpha4 * log(x) + epsilon
  
  # Fit the model
  fit <- lm(Y ~ x + I(x^2) + I(log(x)))
  
  # Sum of coefficients
  sum_alpha_hat[sim] <- sum(coef(fit))
}

# Plot the approximated PDF
hist(sum_alpha_hat, breaks = 100, probability = TRUE, main = "Approximated PDF of Sum of Coefficients", xlab = "Sum of Estimates")
lines(density(sum_alpha_hat), col = "blue")

# Approximate mean and variance
mean_est <- mean(sum_alpha_hat)
var_est <- var(sum_alpha_hat)

#mean_est = 6.00846116427962
mean_est
#var_est = 21.3869
var_est

