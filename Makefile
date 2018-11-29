# Makefile
# Sarah Watts & Orphelia Ellogne, Nov 2018

# This Makefile generates a report that analyzes the
# statistically significant difference in mean math grade earned by gender
# for students in the UCI Student Performance Data Set
# https://archive.ics.uci.edu/ml/datasets/Student+Performance
# takes no arguments.

# example usage:
# make clean
# make all

all: doc/student_perf_report.md

# clean the data
data/clean-student-math-perf.csv : data/student-math-perf.csv src/clean_student_perf_data.R
	Rscript src/clean_student_perf_data.R data/student-math-perf.csv data/clean-student-math-perf.csv

# create EDA plot
results/violin-student-math-perf.png : data/clean-student-math-perf.csv src/explore_student_perf.R
	Rscript src/explore_student_perf.R data/clean-student-math-perf.csv results/violin-student-math-perf.png

# run the hypothesis test
results/estimate_table.csv results/t-test_results.csv : data/clean-student-math-perf.csv src/analysis_t-test_estimates.R
	Rscript src/analysis_t-test_estimates.R data/clean-student-math-perf.csv  results/estimate_table.csv results/t-test_results.csv

# create a final plot comparing means/confidence intervals
results/mean_CI_plot.png : results/estimate_table.csv src/report_mean_CI.R
	Rscript src/report_mean_CI.R results/estimate_table.csv results/mean_CI_plot.png

doc/student_perf_report.md : results/mean_CI_plot.png results/violin-student-math-perf.png data/clean-student-math-perf.csv results/t-test_results.csv
	Rscript -e "rmarkdown::render('doc/student_perf_report.Rmd')"

clean :
	rm -f data/clean-student-math-perf.csv
	rm -f results/violin-student-math-perf.png
	rm -f results/estimate_table.csv
	rm -f results/t-test_results.csv
	rm -f results/mean_CI_plot.png
	rm -f doc/student_perf_report.html
