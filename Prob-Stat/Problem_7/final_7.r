x1 <- runif(10^6, -1, 1)
y1 <- runif(10^6, -1, 1)
x2 <- runif(10^6, -1, 1)
y2 <- runif(10^6, -1, 1)

# euclidean distanes
distances <- sqrt((x1 - x2)^2 + (y1 - y2)^2)

probability <- mean(distances < 1)

cat("prob that distance < 1:", probability, "\n")

# Simulated probability that distance < 1: 0.483477 
