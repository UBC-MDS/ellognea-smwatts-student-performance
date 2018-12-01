# Relationship between gender and math grades

Does the gender of a student affect their final math grade?

This project uses the UCI Student Performance Data Set (https://archive.ics.uci.edu/ml/datasets/Student+Performance) to evaluate the relationship between a student gender (Female/Male) and their final math grade. 
The data set contains math and Portuguese grades of high school students attending two Portuguese schools: Gabriel Pereira (GP) and Mousinho da Silveira (MS) as well as demographics, social and school related features. 

The results of a two-tailed hypothesis test that determine if there was a statistically significant difference in the mean math grade for male and female students is reported. Additionally, there is a visualization of the data that shows the mean, confidence intervals and distribution for each sample (Female and Male).

### Scripts

The data analysis is carried out in 4 scripts saved in the ./src/folder and ran in the following order:

1- [clean_student_perf_data.R](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/src/clean_student_perf_data.R): cleans the original data and saves the transforms data

2- [explore_student_perf.R](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/src/explore_student_perf.R):  creates a visualization of the data distribution with a violin/jitter plot 

3- [analysis_t-test_estimates.R](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/src/analysis_t-test_estimates.R): performs a t-test and calculates the estimate and confidence intervals for each sample

4- [report_mean_CI.R](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/src/report_mean_CI.R): creates a visualization of the mean and confidence intervals for each sample

### Dependencies

RStudio [tidyverse (version 1.2.1)](https://www.tidyverse.org)

RStudio [ggplot2 (version 3.1.0)](https://github.com/tidyverse/ggplot2)

### Usage

| File           | Use      |
|----------------|---------------|
|[run_all](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/run_all.sh) | bash run_all.sh |
|[Makefile](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/Makefile) |make clean <br> make all | 

An overview of the analysis found in this repo is below. It includes the scripts that are run, the order they run in and the expected inputs/outputs:
```
# 1. clean the data found in the UCI Student Performance Data Set to only include relevant columns
# input: data/student-math-perf.csv
# output: data/clean-student-math-perf.csv
Rscript src/clean_student_perf_data.R data/student-math-perf.csv data/clean-student-math-perf.csv

# 2. create a violin and jitter plot to show the distribution of final math grades by gender
# input: data/clean-student-math-perf.csv
# output: results/violin-student-math-perf.png
Rscript src/explore_student_perf.R data/clean-student-math-perf.csv results/violin-student-math-perf.png

# 3.1 create a table with the mean and 95% confidence intervals for each sample (male and female students)
# 3.2 test the hypothesis that the mean final math graded is equal for male and female students
# input: data/clean-student-math-perf.csv
# output: results/estimate_table.csv results/t-test_results.csv
Rscript src/analysis_t-test_estimates.R data/clean-student-math-perf.csv  results/estimate_table.csv results/t-test_results.csv

# 4. create a final plot for the means with error bars representing 95% confidence intervals
# input: results/estimate_table.csv
# output: results/mean_CI_plot.png
Rscript src/report_mean_CI.R results/estimate_table.csv results/mean_CI_plot.png

# 5. generate a final the report to reveal the findings of the hypothesis test
# input: results/mean_CI_plot.png results/violin-student-math-perf.png data/clean-student-math-perf.csv results/t-test_results.csv
# output: doc/student_perf_report.md
Rscript -e "rmarkdown::render('doc/student_perf_report.Rmd')"
```

### Report

The final report is saved in the [student_perf_report.Rmd](https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/doc/student_perf_report.md) file, found in the ./doc folder. It presents the original data, a statistical summary, and figures.
