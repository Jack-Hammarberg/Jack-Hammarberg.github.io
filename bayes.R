# Load necessary packages
library(bayesAB)

# Read the dataset
data <- read.csv(file="ab_test_data.csv", header=TRUE, sep=",")

# Extract control and treatment groups
control <- data[data$group == "control", ]
treatment <- data[data$group == "test", ]

# Define the number of conversions and the number of visitors
control_conversions <- control$conversion
control_visitors <- control$visitors
treatment_conversions <- treatment$conversion
treatment_visitors <- treatment$visitors

# Calculate proportions
control_proportion <- control_conversions / control_visitors
treatment_proportion <- treatment_conversions / treatment_visitors

# Perform the Bayesian A/B test using the Bernoulli model
AB_test <- bayesTest(
  A_data = rbinom(control_visitors, 1, control_proportion),
  B_data = rbinom(treatment_visitors, 1, treatment_proportion),
  priors = c('alpha' = 1, 'beta' = 1),
  distribution = 'bernoulli'
)

# Summarize and interpret the results
summary(AB_test)

# Plot the posterior distributions
plot(AB_test)


# Define parameters for the simulation
true_control_rate <- 0.03     # True conversion rate for control group
true_treatment_rate <- 0.045  # True conversion rate for treatment group
n_visitors <- 4678            # Number of visitors in each group
n_simulations <- 1000         # Number of simulations

# Function to perform a single simulation and test
perform_simulation <- function() {
  control_data <- rbinom(n_visitors, 1, true_control_rate)
  treatment_data <- rbinom(n_visitors, 1, true_treatment_rate)
  
  AB_test <- bayesTest(
    A_data = control_data,
    B_data = treatment_data,
    priors = c('alpha' = 1, 'beta' = 1),
    distribution = 'bernoulli'
  )
  
  summary_AB <- summary(AB_test)
  p_A_greater_B <- summary_AB$probability
  
  return(p_A_greater_B < 0.05)  # Return TRUE if we detect the effect (control < treatment)
}

# Perform multiple simulations
results <- replicate(n_simulations, perform_simulation())

# Calculate power
bayesian_power <- mean(results)
print(paste("Estimated Bayesian power:", bayesian_power))

