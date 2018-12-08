# Relationship between gender and math grades

Does the gender of a student affect their final math grade?

This project uses the UCI Student Performance Data Set (https://archive.ics.uci.edu/ml/datasets/Student+Performance) to evaluate the relationship between a student gender (Female/Male) and their final math grade. 
The data set contains math and Portuguese grades of high school students attending two Portuguese schools: Gabriel Pereira (GP) and Mousinho da Silveira (MS) as well as demographics, social and school related features. 

The results of a two-tailed hypothesis test that determine if there was a statistically significant difference in the mean math grade for male and female students is reported. Additionally, there is a visualization of the data that shows the mean, confidence intervals and distribution for each sample (Female and Male).

### Scripts

The data analysis is carried out in 4 scripts saved in the ./src/folder and ran in the following order:

1- [clean_student_perf_data.R](https://github.com/UBC-MDS/ellognea-smwatts-student-performance/blob/master/src/clean_student_perf_data.R): cleans the original data and saves the transforms data

2- [explore_student_perf.R](https://github.com/UBC-MDS/ellognea-smwatts-student-performance/blob/master/src/explore_student_perf.R):  creates a visualization of the data distribution with a violin/jitter plot 

3- [analysis_t-test_estimates.R](https://github.com/UBC-MDS/ellognea-smwatts-student-performance/blob/master/src/analysis_t-test_estimates.R): performs a t-test and calculates the estimate and confidence intervals for each sample

4- [report_mean_CI.R](https://github.com/UBC-MDS/ellognea-smwatts-student-performance/blob/master/src/report_mean_CI.R): creates a visualization of the mean and confidence intervals for each sample

### Dependencies

RStudio [tidyverse (version 1.2.1)](https://www.tidyverse.org)

RStudio [ggplot2 (version 3.1.0)](https://github.com/tidyverse/ggplot2)

### Makefile Usage

You can reproduce our analysis with the following steps:

1. Clone this repo
2. Using the command line, navigate to the root of this project
3. Run the Makefile by typing following code in the terminal:

| File           | Commands      |
|----------------|---------------|
|[Makefile](https://github.com/UBC-MDS/ellognea-smwatts-student-performance/blob/master/Makefile) |make clean <br> make all | 
 
The Makefile creates an entire data analysis pipeline for our project by executing the four scripts listed above one by one.

### Docker Usage

To run the analysis using docker:

1.	Clone this repo
2.	Using the command line, navigate to the root of this project 
3.	Type the following (filling in PATH_ON_YOUR_COMPUTER with the absolute path to the root of this project on your computer) :

```
docker run --rm -it -e PASSWORD=stuperf -v PATH_ON_YOUR_COMPUTER:/home/ellognea-smwatts-student-performance ellognea/ellognea-smwatts-student-performance make -C /home/ellognea-smwatts-student-performance all 

```
To clean up the analysis type:

```
docker run --rm -it -e PASSWORD=stuperf -v PATH_ON_YOUR_COMPUTER :/home/ellognea-smwatts-student-performance ellognea/ellognea-smwatts-student-performance make -C /home/ellognea-smwatts-student-performance clean 
```

### Report

The final report is saved in the [student_perf_report.Rmd](https://github.com/UBC-MDS/ellognea-smwatts-student-performance/blob/master/doc/student_perf_report.md) file, found in the ./doc folder. It presents the original data, a statistical summary, and figures.
