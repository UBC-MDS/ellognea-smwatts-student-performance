# src/clean_student_perf_data.R
# Sarah Watts, Oct 20 2018
#
# This script writes a clean version of the "data/student-math-perf.csv" data
# This dataset was originally taken from https://archive.ics.uci.edu/ml/datasets/Student+Performance
# This script takes in two arguments
# 1. The argument for the path & filenmae to the input dataset (i.e. "data/student-math-perf.csv")
# 2. The argument for the path & filename to write the output tidy dataset (i.e. "data/clean-student-math-perf.csv")
#
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/clean_student_perf_data.R data/student-math-perf.csv data/clean-student-math-perf.csv

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# define main function
main <- function(){
  # read in data
  student_math_perf <- read_csv(input_file)
  print(head(student_math_perf))
  clean_student_math_perf <- student_math_perf %>% mutate(final_math_grade = (G3/20)*100 ) %>% select(sex,final_math_grade)
  write_csv(clean_student_math_perf, output_file)
}

# call main function
main()