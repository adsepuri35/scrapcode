# Set parameters
set.seed(123)
n <- 20                  # Sample size
num_sim <- 100000        # Number of simulations
sigma_epsilon <- sqrt(4) # Standard deviation of errors
alpha1 <- 2
alpha2 <- 1

# Generate x values
x <- 1:n

# Initialize vectors to store results
alpha_sum_squared <- numeric(num_sim)
correlation_r <- numeric(num_sim)

for (sim in 1:num_sim) {
  # Simulate errors and Y values
  epsilon <- rnorm(n, mean = 0, sd = sigma_epsilon)
  Y <- alpha1 + alpha2 * x + epsilon
  
  # Fit linear regression
  fit <- lm(Y ~ x)
  
  # Extract coefficients
  alpha_hat <- coef(fit)
  alpha_sum_squared[sim] <- alpha_hat[1]^2 + alpha_hat[2]^2
  
  # Compute correlation coefficient
  correlation_r[sim] <- cor(x, Y)
}

# Part 1: Approximated PDF of alpha_1^2 + alpha_2^2
hist(alpha_sum_squared, breaks = 100, probability = TRUE, main = "PDF of alpha_1^2 + alpha_2^2", xlab = "alpha_1^2 + alpha_2^2")
lines(density(alpha_sum_squared), col = "blue")
mean_alpha_sum_squared <- mean(alpha_sum_squared)
var_alpha_sum_squared <- var(alpha_sum_squared)

# Part 2: Approximated PDF of r
hist(correlation_r, breaks = 100, probability = TRUE, main = "PDF of r", xlab = "Correlation Coefficient r")
lines(density(correlation_r), col = "blue")
mean_r <- mean(correlation_r)
var_r <- var(correlation_r)

# Compute P(0.9 < r < 0.95)
prob_r <- mean(correlation_r > 0.9 & correlation_r < 0.95)

# Results
list(
  mean_alpha_sum_squared = mean_alpha_sum_squared,
  var_alpha_sum_squared = var_alpha_sum_squared,
  mean_r = mean_r,
  var_r = var_r,
  prob_r_between_0.9_and_0.95 = prob_r
)
