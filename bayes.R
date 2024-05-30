# Install and load the bayesAB package
install.packages("bayesAB")
library(bayesAB)

# Define your data
testgroup_conversions <- 206
testgroup_visitors <- 4678
controlgroup_conversions <- 142
controlgroup_visitors <- 4678

# Prepare the data for the Bayesian test
A_successes <- controlgroup_conversions
A_failures <- controlgroup_visitors - controlgroup_conversions
B_successes <- testgroup_conversions
B_failures <- testgroup_visitors - testgroup_conversions

# Perform the Bayesian A/B test using BinomTest
AB_test <- BinomTest(A_successes, A_failures, B_successes, B_failures)

# Summarize and interpret the results
summary(AB_test)
plot(AB_test)

install.packages("pkgbuild")
library(pkgbuild)
find_rtools()
