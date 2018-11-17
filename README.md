# DSCI_522-ellognea-smwatts-student-performance

### Project's repo URL 
https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance

We wil work with the UCI Student Performance Data Set (https://archive.ics.uci.edu/ml/datasets/Student+Performance) to answer the following inferential question : Does the gender of a student affect their final math grade ?

The data set contains math and portuguese grades of high school students attending two Portuguese schools : Gabriel Pereira (GP) and Mousinho da Silveira (MS) as well as demographics, social and school related features.

### Script to load the data
https://github.com/UBC-MDS/DSCI_522-ellognea-smwatts-student-performance/blob/master/scripts/load_dataset.R

### Dependencies
RStudio tidyverse 

### Analysis plan

We'll perform a two-tailed hypothesis test using a t-test. We'll work with the variables  "sex" - student's sex (binary: 'F' - female or 'M' - male) and "G3" - final grade (numeric: from 0 to 20, output target).  We'll split the data into two samples (female/male) and follow the five steps to hypothesis test :
  
#### 1-  Define null and alternative hypotheses:
  Null hypothesis: The mean final math grade for male students and female students are equal.
  
  Alternative hypothesis: The mean final math grade for male students and female students are different.

#### 2-  Compute a test statistic that corresponds to the null hypothesis :
  Our test statistic is the difference in means.
  
#### 3-  Create a model of the null hypothesis:

  We'll use a t-distribution, with degrees of freedom equal to the Welch (or Satterthwaite) approximation to the degrees of freedom.
  
#### 4- See where the test statistic falls on the distribution
   
#### 5- Depending on where the test statistic falls, reject, or fail to reject the null hypothesis.

#### Summary Plan

We'll create a visualization of the data that shows the estimate, confidence intervals and distribution for each sample. We'll also apply broom::tidy to the output of t.test to get a tidy data frame version of the results.

