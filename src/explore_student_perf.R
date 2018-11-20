# explore_student_perf.R
#
# This script explores the data in "data/clean-student-math-perf.csv" data
# This script takes in two arguments
# 1. The argument for the path & filenmae to the clean dataset (i.e. "data/clean-student-math-perf.csv")
# 2. The argument for the path & filename to write a graphical display of the dataset (i.e. "result/hist-student-math-perf.png")
# 
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/explore_student_perf.R data/clean-student-math-perf.csv results/hist-student-math-perf.png

library(tidyverse)
library(ggplot2)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

# define main function
main <- function(){
  # read in data
  student_math_perf <- read_csv(input_file)
  sex_labels <- c(
    `F` = "Female",
    `M` = "Male"
  )
  hist_student_perf <- student_math_perf %>% ggplot(aes(x=final_math_grade)) +
    geom_histogram(bins = 20) + facet_grid(. ~ sex, labeller = as_labeller(sex_labels)) +
    ggtitle("Distribution of Math Grades by Gender") +
    xlab("Final math grade (%)") + ylab("Count") + 
    theme_bw() + 
    theme(panel.background = element_blank(), panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  ggsave(file = output_file, plot = hist_student_perf, width = 4, height = 3, dpi = 120)
}

# call main function
main()