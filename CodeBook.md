# Code Book

This is the code book describing the data that results from the run_analysis() script described in the [README](README.md).  

### The Raw Data

The original source data comes from the Human Activity Recognition Using Smartphones Dataset Version 1.0 found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and copied into the UCI HAR Dataset directory.  The details of the original measurements can be found in the [README](UCI HAR Dataset/README.txt), [features.txt](UCI HAR Dataset/features.txt), and [features_info.txt](UCI HAR Dataset/features_indo.txt) files in the UCI HAR Dataset directory.


### Tidy Means

The data produced by the included script is stored in tidy_Mean()-csv.  The data table found in tidy_means.csv includes an average value for every mean and standard deviation observation measured in the test and train data set from the raw data.  The units are maintained from the original HAR data.  Each row in the table represents the average measurements for each participant-activity.  The data columns are:

| tidy_means.csv Column          | Original Name               | type    |
| ------------------------------ | --------------------------- | ------- |
| Activity                       |                             | integer |
| Subject                        |                             | factor  |
| Time.BodyAcc.Mean()-X          | tBodyAcc-mean()-X           | numeric |
| Time.BodyAcc.Mean()-Y          | tBodyAcc-mean()-Y           | numeric |
| Time.BodyAcc.Mean()-Z          | tBodyAcc-mean()-Z           | numeric |
| Time.BodyAcc.StdDev()-X        | tBodyAcc-std()-X            | numeric |
| Time.BodyAcc.StdDev()-Y        | tBodyAcc-std()-Y            | numeric |
| Time.BodyAcc.StdDev()-Z        | tBodyAcc-std()-Z            | numeric |
| Time.GravityAcc.Mean()-X       | tGravityAcc-mean()-X        | numeric |
| Time.GravityAcc.Mean()-Y       | tGravityAcc-mean()-Y        | numeric |
| Time.GravityAcc.Mean()-Z       | tGravityAcc-mean()-Z        | numeric |
| Time.GravityAcc.StdDev()-X     | tGravityAcc-std()-X         | numeric |
| Time.GravityAcc.StdDev()-Y     | tGravityAcc-std()-Y         | numeric |
| Time.GravityAcc.StdDev()-Z     | tGravityAcc-std()-Z         | numeric |
| Time.BodyAccJerk.Mean()-X      | tBodyAccJerk-mean()-X       | numeric |
| Time.BodyAccJerk.Mean()-Y      | tBodyAccJerk-mean()-Y       | numeric |
| Time.BodyAccJerk.Mean()-Z      | tBodyAccJerk-mean()-Z       | numeric |
| Time.BodyAccJerk.StdDev()-X    | tBodyAccJerk-std()-X        | numeric |
| Time.BodyAccJerk.StdDev()-Y    | tBodyAccJerk-std()-Y        | numeric |
| Time.BodyAccJerk.StdDev()-Z    | tBodyAccJerk-std()-Z        | numeric |
| Time.BodyGyro.Mean()-X         | tBodyGyro-mean()-X          | numeric |
| Time.BodyGyro.Mean()-Y         | tBodyGyro-mean()-Y          | numeric |
| Time.BodyGyro.Mean()-Z         | tBodyGyro-mean()-Z          | numeric |
| Time.BodyGyro.StdDev()-X       | tBodyGyro-std()-X           | numeric |
| Time.BodyGyro.StdDev()-Y       | tBodyGyro-std()-Y           | numeric |
| Time.BodyGyro.StdDev()-Z       | tBodyGyro-std()-Z           | numeric |
| Time.BodyGyroJerk.Mean()-X     | tBodyGyroJerk-mean()-X      | numeric |
| Time.BodyGyroJerk.Mean()-Y     | tBodyGyroJerk-mean()-Y      | numeric |
| Time.BodyGyroJerk.Mean()-Z     | tBodyGyroJerk-mean()-Z      | numeric |
| Time.BodyGyroJerk.StdDev()-X   | tBodyGyroJerk-std()-X       | numeric |
| Time.BodyGyroJerk.StdDev()-Y   | tBodyGyroJerk-std()-Y       | numeric |
| Time.BodyGyroJerk.StdDev()-Z   | tBodyGyroJerk-std()-Z       | numeric |
| Time.BodyAccMag.Mean()         | tBodyAccMag-mean()          | numeric |
| Time.BodyAccMag.Std()          | tBodyAccMag-std()           | numeric |
| Time.GravityAccMag.Mean()      | tGravityAccMag-mean()       | numeric |
| Time.GravityAccMag.Std()       | tGravityAccMag-std()        | numeric |
| Time.BodyAccJerkMag.Mean()     | tBodyAccJerkMag-mean()      | numeric |
| Time.BodyAccJerkMag.Std()      | tBodyAccJerkMag-std()       | numeric |
| Time.BodyGyroMag.Mean()        | tBodyGyroMag-mean()         | numeric |
| Time.BodyGyroMag.Std()         | tBodyGyroMag-std()          | numeric |
| Time.BodyGyroJerkMag.Mean()    | tBodyGyroJerkMag-mean()     | numeric |
| Time.BodyGyroJerkMag.Std()     | tBodyGyroJerkMag-std()      | numeric |
| FFT.BodyAcc.Mean()-X           | fBodyAcc-mean()-X           | numeric |
| FFT.BodyAcc.Mean()-Y           | fBodyAcc-mean()-Y           | numeric |
| FFT.BodyAcc.Mean()-Z           | fBodyAcc-mean()-Z           | numeric |
| FFT.BodyAcc.StdDev()-X         | fBodyAcc-std()-X            | numeric |
| FFT.BodyAcc.StdDev()-Y         | fBodyAcc-std()-Y            | numeric |
| FFT.BodyAcc.StdDev()-Z         | fBodyAcc-std()-Z            | numeric |
| FFT.BodyAccJerk.Mean()-X       | fBodyAccJerk-mean()-X       | numeric |
| FFT.BodyAccJerk.Mean()-Y       | fBodyAccJerk-mean()-Y       | numeric |
| FFT.BodyAccJerk.Mean()-Z       | fBodyAccJerk-mean()-Z       | numeric |
| FFT.BodyAccJerk.StdDev()-X     | fBodyAccJerk-std()-X        | numeric |
| FFT.BodyAccJerk.StdDev()-Y     | fBodyAccJerk-std()-Y        | numeric |
| FFT.BodyAccJerk.StdDev()-Z     | fBodyAccJerk-std()-Z        | numeric |
| FFT.BodyGyro.Mean()-X          | fBodyGyro-mean()-X          | numeric |
| FFT.BodyGyro.Mean()-Y          | fBodyGyro-mean()-Y          | numeric |
| FFT.BodyGyro.Mean()-Z          | fBodyGyro-mean()-Z          | numeric |
| FFT.BodyGyro.StdDev()-X        | fBodyGyro-std()-X           | numeric |
| FFT.BodyGyro.StdDev()-Y        | fBodyGyro-std()-Y           | numeric |
| FFT.BodyGyro.StdDev()-Z        | fBodyGyro-std()-Z           | numeric |
| FFT.BodyAccMag.Mean()          | fBodyAccMag-mean()          | numeric |
| FFT.BodyAccMag.Std()           | fBodyAccMag-std()           | numeric |
| FFT.BodyBodyAccJerkMag.Mean()  | fBodyBodyAccJerkMag-mean()  | numeric |
| FFT.BodyBodyAccJerkMag.Std()   | fBodyBodyAccJerkMag-std()   | numeric |
| FFT.BodyBodyGyroMag.Mean()     | fBodyBodyGyroMag-mean()     | numeric |
| FFT.BodyBodyGyroMag.Std()      | fBodyBodyGyroMag-std()      | numeric |
| FFT.BodyBodyGyroJerkMag.Mean() | fBodyBodyGyroJerkMag-mean() | numeric |
| FFT.BodyBodyGyroJerkMag.Std()  | fBodyBodyGyroJerkMag-std()  | numeric |

There were 30 subjects (idenified by an id), and the each subject engaged in 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  