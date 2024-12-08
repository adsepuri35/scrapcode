# Parameters
n <- 10^4
delta <- 0.2
epsilon <- 0.2
trials <- 10^4

# Function to calculate the logarithmic integral Li(n)
log_integral <- function(n) {
  integrate(function(x) 1 / log(x), lower = 2, upper = n)$value
}

# Generate Bernoulli random variables for X_k
generate_pi <- function(n) {
  X <- numeric(n)
  X[1] <- 0
  X[2] <- 1
  for (k in 3:n) {
    X[k] <- rbinom(1, 1, prob = 1 / log(k))
  }
  sum(X)
}

# Calculate Li(n)
Li_n <- log_integral(n)

# Perform simulations
deviations <- replicate(trials, {
  pi_n <- generate_pi(n)
  (pi_n - Li_n) / (n^(0.5 + delta))
})

# Calculate probability |Z| > epsilon
prob <- mean(abs(deviations) > epsilon)
cat("P(|Z| > epsilon):", prob, "\n")

# P(|Z| > epsilon): 5e-04
