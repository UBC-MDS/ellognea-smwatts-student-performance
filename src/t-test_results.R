# src/t-test_results.R
# Orphelia Ellogne, Oct 21 2018
#
# This script performs a t-test on the clean data : data/clean-student-math-perf.csv
# This script takes in two arguments
# 1. The argument for the path & filename to the clean dataset (i.e. "data/clean-student-math-perf.csv")
# 2. The argument for the path & filename to the t-test summary table (i.e. "results/t-test-results.csv")
#
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/t-test-results.R data/clean-student-math-perf.csv results/t-test_results.csv


library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]


# define main function
main <- function(){
  
  # read in data
  student_math_perf <- read_csv(input_file)
  
  # Perform two-tailed t-test
  results <- broom::tidy(t.test(final_math_grade ~ sex, data=student_math_perf ,var.equal=FALSE))
  
  #Save output
  write_csv(results,output_file )
 
}

# call main function
main()


