# load_dataset.R
#
# This script loads the data found in the "data/student-math-perf.csv" file in this repo
# This dataset was originally taken from https://archive.ics.uci.edu/ml/datasets/Student+Performance
# This script takes no arguments.
#
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/load_student_perf_data.R

library(tidyverse)

student_math_perf <- read_csv("data/student-math-perf.csv")
print(head(student_math_perf))