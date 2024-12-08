n=100
x=c(-4.61,-5.73,-14.85,-1.53,-11.92,-10.24,-11.68,7.12,-5.17,0.55,-0.8,19.09,8.99,-0.85,-11.77,-17.4,5.17,3.86,4.22,-12.61,-1.5,11.01,12.91,12.42,11.93,-10.1,2.36,-0.95,-8.14,12.83,5.29,-3.65,-4.77,14.35,-11.57,-1.89,10.15,-22.92,-13.82,-0.91,1.92,2.58,-4.26,2.28,-12.73,5.66,12.55,10.75,12.46,3.97,7.56,-7.89,26.03,3.23,14.71,5.64,11.93,0.44,6.18,-2.31,-1.46,-4.47,12.8,-2.01,-9.95,-17.93,11.89,3.04,-14.39,-3.3,22.26,6.02,-3.48,-14.64,5.7,-1.52,11.19,4.65,0.52,-8.06,9.04,22.07,-2.41,4.21,8.59,14.42,-9.28,-6.53,-11.93,-5.34,-10.56,7.48,-21.65,1.32,0.07,9.4,-0.07,-7.92,-4.48,-10.13)
Y=c(681.1,1523.81,55602.32,25.82,23826.97,13340.14,22061.28,1952.65,1031.89,8.18,1.44,119669.27,5249.31,19.99,22715.97,102775.18,494.54,160.32,212.42,29595.13,30.42,12281.63,23834.18,20299.06,17176.81,12656.73,5.94,-5.81,5565.12,23221.48,551.77,298.76,775.91,36939.32,21257.27,42.93,8769.78,301073.28,42124.53,-3.78,8.92,22.62,504.87,31.59,30683.85,738.69,21185.36,11144.66,20571.84,161.58,2519.25,4967.49,425218.67,68.12,40924.86,719.62,17177.88,24.51,1102.32,65.41,12.64,609.17,23007.59,28.99,11972.57,115497.28,16922.05,60.01,49241.17,202.51,224493.36,978.61,250.93,52615.82,765.07,33.92,13141.15,318.28,10.15,5368.89,5379.14,216765.89,79.02,221.46,4353.18,37681.84,9180.16,2472.46,23914.53,1165.82,15011.87,2410.9,240904.43,7.36,-8.81,6341.18,-5.67,5057.55,633.71,12792.61)


# Inspect the data
head(x)   # x_i values
head(Y)   # Y_i values

# Initialize
max_d <- 10 # Adjust as necessary
coefficients_list <- list()

for (d in 1:max_d) {
  # Create the design matrix for polynomial regression
  X <- model.matrix(~ poly(x, d, raw = TRUE))  # Polynomial terms up to degree d
  
  # Fit the model
  fit <- lm(Y ~ X - 1)  # No intercept since it's included in the polynomial terms
  
  # Store coefficients
  coefficients_list[[d]] <- coef(fit)
  
  # Check the leading coefficient
  leading_coeff <- tail(coefficients_list[[d]], 1)
  cat("d =", d, ", Leading coefficient =", leading_coeff, "\n")
  
  # Stop if the leading coefficient is near zero
  if (abs(leading_coeff) < 1e-6) {
    cat("Optimal value of d found:", d, "\n")
    break
  }
}

# Fit the final model with the chosen d
final_d <- d  # Replace with the chosen value
X_final <- model.matrix(~ poly(x, final_d, raw = TRUE))
final_fit <- lm(Y ~ X_final - 1)

# Extract the estimate and standard error for alpha_1
alpha1_hat <- coef(final_fit)[1]
se_alpha1 <- summary(final_fit)$coefficients[1, 2]

# Perform the t-test
t_stat <- alpha1_hat / se_alpha1
p_value <- 2 * pt(-abs(t_stat), df = length(Y) - (final_d + 1))  # Two-sided p-value
cat("Estimate of alpha_1 =", alpha1_hat, "\n")
cat("P-value for H0: alpha_1 = 0:", p_value, "\n")

# Critical t-value for 95% CI
t_crit <- qt(0.975, df = length(Y) - (final_d + 1))

# Confidence interval
ci_lower <- alpha1_hat - t_crit * se_alpha1
ci_upper <- alpha1_hat + t_crit * se_alpha1
cat("95% Confidence Interval for alpha_1: [", ci_lower, ",", ci_upper, "]\n")
