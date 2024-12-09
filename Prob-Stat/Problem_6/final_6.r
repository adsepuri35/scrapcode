#lambda <- 1/3
t_lim <- 10

# sim crashes in 10 mos
simulate_crashes <- function() {
  iat <- rexp(1000, rate = 1/3)
  
  # Compute cumulative times of crashes
  c_t <- cumsum(iat)
  
  # Count how many crashes occur within the time limit
  sum(c_t < t_lim)
}
res <- replicate(10^5, simulate_crashes())

# Approximate expected number of crashes
expected_crashes <- mean(res)
cat("Simulated expected number of crashes in 10 months:", expected_crashes, "\n")

# Simulated expected number of crashes in 10 months: 3.33035 