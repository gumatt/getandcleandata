#  Course Project - Getting and Cleaning Data

This repository holds the the raw data, a tidy version of the means (tidy_means.csv) and standard deviation measures found in the raw data, and an R script to produce the tidy means from the raw data.  There is also a CodeBook.md that describes the format and data in the tidy.

## Raw Data

The raw data is from a study performed by Samsung to determine if human activity can be recognized by smart devices equiped with gyroscopes, and accelerometers.  Details of the study can be found in the README.txt in the UCI HAR Dataset directory.  

The run_analysis() method in the run_analysis.R script assumes that the raw data is in a sub-directory ("UCI HAR Dataset") of the current working directory.  If the data is in another directory (e.g ./foo) use: run_analysis(rawdata.dir="foo"). If no directory is specified and the default directory is not present the script will download the raw data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and load it into the default directory

## The Script

The run_analysis.R script contains helper functions and a primary script:  run_analysis().  This function returns a data frame containing tidy data (i.e. a data frame with mean and std deviation values for every measurement for each participant-activity combination).  By default the script looks for the raw data in "UCI HAR Dataset" directory.  This can be overridden with the `rawdata.dir` argument.  

The script will also write the tidy data to a file if the `outfilename` argument is used. 

###### Usage:

`source("run_analysis.R")

run_analysis()`

or 

`run_analysis(rawdata.dir="foo")`

or

`run_analydid(outfilename="tidy_mean.csv")`

###### Dependencies:
The included script uses the libraries reshape2 and plyr
