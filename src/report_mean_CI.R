# src/report_mean_CI.R
# Orphelia Ellogne, Oct 22 2018
#
# This script uses the results/estimate_table.csv table to create a visualization of the mean and confidence intervals for each sample.
# This script takes in two arguments
# 1. The argument for the path & filename to the estimate table  (i.e. "results/estimate_table.csv")
# 2. The argument for the path & filename to the estimate and CI plot (i.e. "results/mean_CI_plot.png")


# Note: Commands must be run from the root of this repo
#
# Usage: Rscript src/report_mean_CI.R results/estimate_table.csv results/mean_CI_plot.png


library(tidyverse)


# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_img <- args[2]

# define main function
main <- function(){
  
  # read in data
  estimate_table <- read_csv(input_file)
  
  #plot
  mean_CI_plot <- ggplot(estimate_table,aes(x=sex, y= mean_grade)) +
    
    geom_point()  + 
    geom_errorbar(aes(ymax=ci_upper, ymin=ci_lower), width=0.3) +
    theme_bw() + 
    ggtitle(" Final math grade mean and CI by Gender") +
    xlab("Gender") + 
    ylab("Final math grade") +
    theme(panel.background = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
  
ggsave(file = output_img, plot = mean_CI_plot , width = 4, height = 3, dpi = 120)

}

# call main function
main()