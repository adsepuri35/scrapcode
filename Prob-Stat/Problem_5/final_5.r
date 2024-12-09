X <- numeric(1000)
for (j in seq_len(1000)) {
  dim_size <- 120
  M <- matrix(0, dim_size, dim_size)
  upper_values <- rnorm(dim_size * (dim_size + 1) / 2)
  M[upper.tri(M, diag = TRUE)] <- upper_values
  M <- M + t(M) - diag(diag(M))
  eigenvalues <- eigen(M, only.values = TRUE)$values
  X[j] <- sample(eigenvalues, 1)
}
cat("Mean:", mean(X), "\n")
cat("Variance:", var(X), "\n")
plot(density(eigenvalues))