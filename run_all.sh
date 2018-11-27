# run_all.sh
# Sarah Watts & Orphelia Ellogne, Nov 2018

# This run_all.sh script generates a report that analyzes the
# statistically significant difference in mean math grade earned by gender
# for students in the UCI Student Performance Data Set
# https://archive.ics.uci.edu/ml/datasets/Student+Performance
# takes no arguments.

# example usage:
# bash run_all.sh

# clean the data
Rscript src/clean_student_perf_data.R data/student-math-perf.csv data/clean-student-math-perf.csv

# create EDA plot
Rscript src/explore_student_perf.R data/clean-student-math-perf.csv results/violin-student-math-perf.png

# run the hypothesis test
Rscript src/analysis_t-test_estimates.R data/clean-student-math-perf.csv  results/estimate_table.csv results/t-test_results.csv

# create a final plot comparing means/confidence intervals
Rscript src/report_mean_CI.R results/estimate_table.csv results/mean_CI_plot.png

# write the report
Rscript -e "rmarkdown::render('doc/student_perf_report.Rmd')"
