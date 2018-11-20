# src/load_student_perf_data.R
#
# This script loads the data found in the "data/student-math-perf.csv" file in this repo
# This dataset is taken from: https://archive.ics.uci.edu/ml/datasets/Student+Performance
# This script takes in one arguments
# 1. The argument for the path & filenmae to the clean dataset (i.e. "data/student-math-perf.csv")
#
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/load_student_perf_data.R data/student-math-perf.csv

library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]

student_math_perf <- read_csv(input_file)
print(head(student_math_perf))