# src/explore_student_perf.R
# Sarah Watts, Oct 20 2018
#
# This script explores the data in "data/clean-student-math-perf.csv" data
# This script takes in two arguments
# 1. The argument for the path & filenmae to the clean dataset (i.e. "data/clean-student-math-perf.csv")
# 2. The argument for the path & filename to write a histogram of the dataset (i.e. "results/hist-student-math-perf.png")
# 3. The argument for the path & filename to write a violin plot of the dataset(i.e. "results/violin-student-math-perf.png")
# 
# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/explore_student_perf.R data/clean-student-math-perf.csv results/hist-student-math-perf.png results/violin-student-math-perf.png

library(tidyverse)
library(ggplot2)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
hist_file <- args[2]
voilin_file <- args[3]

hist <- function(student_math_perf){
  hist_student_perf <- student_math_perf %>% ggplot(aes(x=final_math_grade)) +
    geom_histogram(bins = 20) + facet_grid(. ~ sex) +
    ggtitle("Distribution of Math Grades by Gender") +
    xlab("Final math grade (%)") + ylab("Count") + 
    theme_bw() + 
    theme(panel.background = element_blank(), panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  ggsave(file = hist_file, plot = hist_student_perf, width = 4, height = 3, dpi = 120)  
}

violin <- function(student_math_perf){
  student_perf_est <- student_math_perf %>% 
    group_by(sex) %>% 
    summarize(
      mean_grade  = mean(final_math_grade),
      se          = sd(final_math_grade)/sqrt(length(final_math_grade)))
  student_perf_est <- student_perf_est %>% mutate(ci_upper = mean_grade + 1.96*se,
                                                  ci_lower = mean_grade - 1.96*se)
  violin_student_perf <- student_math_perf %>% 
    mutate(sex = fct_reorder(sex, final_math_grade)) %>% 
    ggplot(aes(sex)) +
    geom_violin(aes(y = final_math_grade)) +
    geom_jitter(aes(y = final_math_grade), 
                alpha=0.2, width=0.1, size=0.5) +
    theme_bw() + ggtitle("Distribution of Math Grades by Gender") +
    xlab("Gender") + ylab("Final math grade (%)") +
    geom_errorbar(data=student_perf_est, aes(x=sex, ymax=ci_upper, ymin=ci_lower), width=0.3) +
    geom_point(data=student_perf_est,aes(x=sex, y=mean_grade))
  ggsave(file = voilin_file, plot = violin_student_perf, width = 4, height = 3, dpi = 120)
}

# define main function
main <- function(){
  # read in data
  student_math_perf <- read_csv(input_file)
  student_math_perf <- student_math_perf %>% mutate(sex = replace(sex, sex == 'F', 'Female')) %>% 
                        mutate(sex = replace(sex, sex == 'M', 'Male'))
  hist(student_math_perf)
  violin(student_math_perf)
}


# call main function
main()