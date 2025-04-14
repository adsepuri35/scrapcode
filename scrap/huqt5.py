import numpy as np
import matplotlib.pyplot as plt

# Parameters for the normal distribution
mean = 1000
variance = 20000
std_dev = np.sqrt(variance)  # Standard deviation is the square root of variance

# Generate random samples from the normal distribution
samples = np.random.normal(mean, std_dev, 1000)

# Plot the histogram of the samples
plt.figure(figsize=(10, 6))
plt.hist(samples, bins=30, color='blue', alpha=0.7, edgecolor='black', density=True)

# Add labels and title
plt.title("Histogram of Normally Distributed Random Variable X", fontsize=14)
plt.xlabel("Value", fontsize=12)
plt.ylabel("Density", fontsize=12)

# Overlay the theoretical normal distribution curve
x = np.linspace(mean - 4 * std_dev, mean + 4 * std_dev, 1000)
pdf = (1 / (std_dev * np.sqrt(2 * np.pi))) * np.exp(-0.5 * ((x - mean) / std_dev) ** 2)
plt.plot(x, pdf, color='red', linewidth=2, label="Theoretical PDF")

# Add legend
plt.legend(fontsize=12)

# Show the plot
plt.grid(alpha=0.3)
plt.show()