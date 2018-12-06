# src/explore_student_perf.R
# Sarah Watts, Oct 20 2018
#
# This script explores the data in "data/clean-student-math-perf.csv" data
# It creates a volin & jitter plot for each sample (male/female) to display the distribution
# This script takes in two arguments
# 1. The argument for the path & filename to the clean dataset (i.e. "data/clean-student-math-perf.csv")
# 2. The argument for the path & filename to write a violin plot of the dataset (i.e. "results/violin-student-math-perf.png")
# 
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/explore_student_perf.R data/clean-student-math-perf.csv results/violin-student-math-perf.png  

library(tidyverse)
library(ggplot2)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
voilin_file <- args[2]

# define main function
main <- function(){
  # read in data
  student_math_perf <- read_csv(input_file)
  violin_student_perf <- student_math_perf %>% 
    mutate(sex = fct_reorder(sex, final_math_grade)) %>% 
    ggplot(aes(sex)) +
    geom_violin(aes(y = final_math_grade)) +
    geom_jitter(aes(y = final_math_grade), 
                alpha=0.2, width=0.1, size=0.5) +
    theme_bw() + ggtitle("Distribution of Math Grades by Gender") +
    xlab("Gender") + ylab("Final math grade (%)") +
    theme(panel.background = element_blank(), panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  ggsave(file = voilin_file, plot = violin_student_perf, width = 4, height = 3, dpi = 120)
}

# call main function
main()