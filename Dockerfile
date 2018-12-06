# Docker file for DSCI_522-ellognea-smwatts-student-performance
# Sarah Watts, Orphelia Ellogne --- Dec 06, 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# then install the tidyverse package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    tidyverse
