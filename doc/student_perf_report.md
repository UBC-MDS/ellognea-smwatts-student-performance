student\_perf\_report
================
Sarah Watts
2018-11-22

Relationship between gender and math grades.
--------------------------------------------

Our goal of this project is to understand if there is a statistically significant difference in the mean grade for male and female students in the [UCI Student Performance dataset](https://archive.ics.uci.edu/ml/datasets/Student+Performance). This dataset is comprised of the final math grade achieved in secondary education of two Portuguese schools. A sample of this dataset is shown below. There are two columns of information used in this analysis:

``` r
head(student_math_perf)
```

    ## # A tibble: 6 x 2
    ##   sex    final_math_grade
    ##   <chr>             <int>
    ## 1 Female               30
    ## 2 Female               30
    ## 3 Female               50
    ## 4 Female               75
    ## 5 Female               50
    ## 6 Male                 75

The grades range from 0-100, with the majority of grades conentrated around the 50% mark.

![](../results/violin-student-math-perf.png)
