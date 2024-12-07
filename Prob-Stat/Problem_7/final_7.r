# Parameters
n <- 10^6  # Number of simulations

# Generate random points for both darts
x1 <- runif(n, -1, 1)
y1 <- runif(n, -1, 1)
x2 <- runif(n, -1, 1)
y2 <- runif(n, -1, 1)

# Compute Euclidean distances
distances <- sqrt((x1 - x2)^2 + (y1 - y2)^2)

# Compute the proportion where distance < 1
probability <- mean(distances < 1)

cat("Simulated probability that distance < 1:", probability, "\n")

# Simulated probability that distance < 1: 0.483477 
