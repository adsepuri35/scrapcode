n <- 100000

log_integral <- function(n) {
  integrate(function(x) 1 / log(x), lower = 2, upper = n)$value
}

g_p <- function(n) {
  X <- numeric(n)
  X[1] <- 0
  X[2] <- 1
  for (k in 3:n) {
    X[k] <- rbinom(1, 1, prob = 1 / log(k))
  }
  sum(X)
}
dev <- replicate(10^4, {
  pi_n <- g_p(n)
  (pi_n - log_integral(n)) / (n^(0.5 + 0.2))
})

prob <- mean(abs(dev) > epsilon)
cat(prob)

# P(|Z| > epsilon): 1e-04
