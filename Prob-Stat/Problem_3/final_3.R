n <- 20
alpha1 <- 2
alpha2 <- 1
sigma2_eps <- 4
num_simulations <- 1e5

sum_alpha_sq <- numeric(num_simulations)
for (sim in 1:num_simulations) {
  xi <- 1:n
  epsilon <- rnorm(n, mean = 0, sd = (sigma2_eps))
  Yi <- alpha1 + alpha2 * xi + epsilon
  model <- lm(Yi ~ xi)
  est_alpha1 <- coef(model)[1]
  est_alpha2 <- coef(model)[2]
  sum_alpha_sq[sim] <- est_alpha1^2 + est_alpha2^2
}

hist(sum_alpha_sq,
     probability = TRUE,
     breaks = 50,
     main = "Approximated PDF of alpha1^2 + alpha2^2",
     xlab = expression(alpha[1]^2 + alpha[2]^2),
     col = "gray")

mean_sum_alpha_sq <- mean(sum_alpha_sq)
var_sum_alpha_sq <- var(sum_alpha_sq)
cat("Mean of alpha1^2 + alpha2^2:", mean_sum_alpha_sq, "\n")
cat("Variance of alpha1^2 + alpha2^2:", var_sum_alpha_sq, "\n")

r_values <- numeric(num_simulations)
for (sim in 1:num_simulations) {
  xi <- 1:n
  epsilon <- rnorm(n, mean = 0, sd = sqrt(sigma2_eps))
  Yi <- alpha1 + alpha2 * xi + epsilon
  r_values[sim] <- cor(xi, Yi)
}

hist(r_values,
     probability = TRUE,
     breaks = 50,
     main = "Approximated PDF of Correlation Coefficient",
     xlab = "Correlation Coefficient (r)",
     col = "gray")

mean_r <- mean(r_values)
var_r <- var(r_values)
prob_range <- mean(r_values > 0.9 & r_values < 0.95)
cat("Mean of r:", mean_r, "\n")
cat("Variance of r:", var_r, "\n")
cat("P(0.9 < r < 0.95):", prob_range, "\n")
