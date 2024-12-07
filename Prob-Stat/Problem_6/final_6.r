# Parameters
lambda <- 1/3  # Rate parameter
time_limit <- 10  # Time limit in months
simulations <- 10^5  # Number of simulations

# Function to simulate number of crashes within 10 months
simulate_crashes <- function() {
  # Generate inter-arrival times for 1000 crashes
  inter_arrival_times <- rexp(1000, rate = lambda)
  
  # Compute cumulative times of crashes
  cumulative_times <- cumsum(inter_arrival_times)
  
  # Count how many crashes occur within the time limit
  sum(cumulative_times < time_limit)
}

# Perform simulations
results <- replicate(simulations, simulate_crashes())

# Approximate expected number of crashes
expected_crashes <- mean(results)
cat("Simulated expected number of crashes in 10 months:", expected_crashes, "\n")

# Simulated expected number of crashes in 10 months: 3.33035 