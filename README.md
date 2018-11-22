# DSCI_522-ellognea-smwatts-student-performance

Does the gender of a student affect their final math grade ?

This project uses the UCI Student Performance Data Set (https://archive.ics.uci.edu/ml/datasets/Student+Performance) to evaluate the relationship between a student gender (Female/Male) and their final math grade. 
The data set contains math and portuguese grades of high school students attending two Portuguese schools : Gabriel Pereira (GP) and Mousinho da Silveira (MS) as well as demographics, social and school related features. 

The results of a two-tailed hypothesis test are reported as well as a visualization of the data that shows the mean, confidence intervals and distribution for each sample (Female and Male).

### Scripts

The data analysis is carried out in 4 scripts saved in the ./src/folder and ran in the following order :

1- **load_student_perf_data.R** : loads the data found in the "data/student-math-perf.csv" file of this repository

2- **clean_student_perf_data.R** : cleans the "data/student-math-perf.csv" data and saves it as "data/clean-student-math-perf.csv"

3- **explore_student_perf.R** :  creates a visualization of the data in "data/clean-student-math-perf.csv" data that shows the mean, confidence intervals and distribution of each sample.

4- **t-test_results.R**: performs a t-test on the data/clean-student-math-perf.csv data and saves the summary table as results/t-test_results.csv

### Dependencies

RStudio tidyverse 
RStudio ggplot2

### Report

The final report is saved as an Rmd file in ./doc folder. It presents the original data, the statistical summary, and the figures.


### Project's repo URL 

https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance

