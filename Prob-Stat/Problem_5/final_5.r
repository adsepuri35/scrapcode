# Parameters
n <- 120          # Matrix dimension
num_samples <- 10^3  # Number of simulations

# Initialize storage for eigenvalues
eigenvalues <- numeric(0)

# Simulation loop
for (i in 1:num_samples) {
  # Generate a symmetric matrix
  M <- matrix(rnorm(n^2), n, n)  # Random normal entries
  M <- (M + t(M)) / 2            # Make it symmetric
  
  # Compute eigenvalues
  eig <- eigen(M)$values
  
  # Store the eigenvalues
  eigenvalues <- c(eigenvalues, eig)
}

# Randomly pick one eigenvalue per simulation
X <- sample(eigenvalues, size = num_samples, replace = TRUE)

# Plot approximated PDF
hist(X, breaks = 50, probability = TRUE, col = "blue", main = "Approximated PDF of X", xlab = "Eigenvalue")
lines(density(X), col = "red", lwd = 2)

# Approximate mean and variance
mean_X <- mean(X)
var_X <- var(X)

cat("Mean of X:", mean_X, "\n")
cat("Variance of X:", var_X, "\n")

# Test the hypothesis by changing the dimension n
dimensions <- c(50, 100, 200, 500)
variances <- numeric(length(dimensions))
for (i in seq_along(dimensions)) {
  n <- dimensions[i]
  
  # Generate a symmetric matrix
  M <- matrix(rnorm(n^2), n, n)
  M <- (M + t(M)) / 2
  
  # Compute eigenvalues
  eig <- eigen(M)$values
  
  # Compute variance
  variances[i] <- var(eig)
}

# Display variances
data.frame(Dimension = dimensions, Variance = variances)
