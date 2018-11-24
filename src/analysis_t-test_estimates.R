# src/analysis_t-test_estimates.R
# Orphelia Ellogne, Oct 21 2018
#
# This script uses the clean data : data/clean-student-math-perf.csv to calculate the estimate and confidence intervals for each sample and to perform a t-test.
# This script takes in three arguments
# 1. The argument for the path & filename to the clean dataset (i.e. "data/clean-student-math-perf.csv")
# 2. The argument for the path & filename to the estimate and CI table (i.e. "results/estimate_table.csv")
# 3. The argument for the path & filename to the t-test summary table (i.e. "results/t-test_results.csv")



# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/analysis_t-test_estimates.R data/clean-student-math-perf.csv  results/estimate_table.csv results/t-test_results.csv


library(tidyverse)


# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
estimate_table <- args[2]
results_table <- args[3]


# define main function
main <- function(){
  
  # read in data
  student_math_perf <- read_csv(input_file)
  
  # Estimate and CI table
  student_perf_est <- student_math_perf %>% 
    group_by(sex) %>% 
    summarize(
    mean_grade  = mean(final_math_grade),
    se          = sd(final_math_grade)/sqrt(length(final_math_grade)))
  
  student_perf_est <- student_perf_est %>% mutate(ci_upper = mean_grade + 1.96*se,
                                                  ci_lower = mean_grade - 1.96*se)
  
  # Perform two-tailed t-test
  results <- broom::tidy(t.test(final_math_grade ~ sex, data=student_math_perf ,var.equal=FALSE))
  
  #Save output
  write_csv(student_perf_est,estimate_table )
  write_csv(results,results_table )
 
}

# call main function
main()


