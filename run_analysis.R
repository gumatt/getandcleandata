##  This is a script for the Course Project in Cousera course:  Getting and Cleaning Data
##     The objectives of the script are:  
##      1. Merges the training and the test sets to create one data set.
##      2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##      3. Uses descriptive activity names to name the activities in the data set
##      4. Appropriately labels the data set with descriptive variable names. 
##
##     and rrom the data set in step 4, 
##      5. creates a second, independent tidy data set with the average of each variable for each 
##         activity and each subject.
library(plyr)
library(reshape2)


##
##  confirm_rawdata is a helper function that confirms that the Samsung data is in the current working 
##                  directory.  If not the data is downloaded and the necessary directory is created 
##
confirm_rawdata <- function(dir) {
    if (!file.exists(dir)) {
        root.dir <- "./"
        dir.create(paste(root.dir, dir))
        message("dowloading data ... ")
        archive <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", archive, mode="wb")
        unzip(archive)
    }
}


##
##  get_test_and_train is a helper function that reads all the necessary, raw data from the given direcotory
##                     into a list of data frames
##        datasets$measureNames - holds the id and measurement names 
##        datasets$activityNames - holds the ids and names of the six activities
##        datasets$test - holds all the observations from the test data
##        datasets$train - holds all the observations from teh train data
##
get_test_and_train <- function(dir) {
    data.dir <- paste('./', dir, sep='')
    datasets <- list()
    
    ## read the global feature/observation names, and the activity names from the main data directory
    ##   these will be used to rename the columns of the raw data (feature/observation), and
    ##   to give meaningful labels to the activity IDs (activity names instead of the numeric ids in the raw data)
    message('reading features.txt...')
    datasets$measureNames <- read.table(paste(data.dir, 'features.txt', sep='/'), col.names=c('id','measure'),stringsAsFactors=FALSE)
    message('reading activity_lables.txt...')
    datasets$activityNames <- read.table(paste(data.dir, 'activity_labels.txt', sep='/'), col.names=c('id','activity'),stringsAsFactors=FALSE)

    ## read the raw test data and them combine the three files into a data frame and add it to the datasets list
    message('reading test subject data set')
    testsubjects <- read.table(paste(data.dir, "test", "subject_test.txt", sep="/"), col.names="subject")
    message('reading test activity data set')
    testYdata <- read.table(paste(data.dir, 'test', 'y_test.txt', sep='/'), col.names=('activity.ID'))
    message('reading test observation data set')
    testXdata <- read.table(paste(data.dir, 'test', 'x_test.txt', sep='/'))
    datasets$test <- cbind(testsubjects,testYdata,testXdata)
    
    ## read the raw test data and them combine the three files into a data frame and add it to the datasets list    
    message('reading train subject data set')
    trainsubjects <- read.table(paste(data.dir, "train", "subject_train.txt", sep="/"), col.names="subject")
    message('reading train activity data set')
    trainYdata <- read.table(paste(data.dir, 'train', 'y_train.txt', sep='/'), col.names=('activity.ID'))
    message('reading train observation data set')
    trainXdata <- read.table(paste(data.dir, 'train', 'x_train.txt', sep='/'))
    datasets$train <- cbind(trainsubjects,trainYdata,trainXdata)

    ## return the datasets list 
    datasets
}


##
##  clean_measure_names is a helper function that cleans up the measurement names
##  inputs:
##      dataframe:   data frame with two columns:  id (int), and measure (chr
##  output:
##      a dataframe with the $measure column cleaned up 
##
clean_measure_names <- function(dataframe) {
    outdata <- dataframe
    outdata$measure <- gsub('-mean', '.Mean', outdata$measure)
    outdata$measure <- gsub('-std', '.StdDev', outdata$measure)
    outdata$measure <- gsub('fB', 'FFT.B', outdata$measure)
    outdata$measure <- gsub('fG', 'FFT.G', outdata$measure)
    outdata$measure <- gsub('tB', 'Time.B', outdata$measure)
    outdata$measure <- gsub('tG', 'Time.G', outdata$measure)
    
    outdata
}

##
##  run_analysis is the primary script used to extract and clean up the raw Samsung data
##               if the raw data is not in the expected data directory it is downloaded into the default 
##               directory name "./UCI HAR Dataset".
##               The data is cleaned and merged (test and train data merged and clean column names used), 
##               and a tidy data frame is output with the average observations for the mean and StdDev 
##               measurements for every subject and activity -- this is a wide version of the tidy data.
##               if an output file name is provided the tidy data is written to that file using (write.table)
##  inputs:
##      data.dir - the name of the subdirectory where the raw data is expected
##      outfilename - the name of the file that the tidy data will be written to, if empty no file is written
##
run_analysis <-function(outfilename = "", rawdata.dir = "UCI HAR Dataset") {
    #  confirm or download raw data
    confirm_rawdata(rawdata.dir)
    
    #  load raw data into list of data frames
    data.raw <- get_test_and_train(rawdata.dir)
    
    #  clean the measure names 
    data.raw$measureNames <- clean_measure_names(data.raw$measureNames)
    
    #  identify the column IDs of only the measure we want
    measureColumns.we.want <- grep("Mean\\(|StdDev\\(", data.raw$measureNames$measure)
    
    #  merge the test and train data into one data frame
    data.merged <- rbind(data.raw$test, data.raw$train)
    
    #  reduce the merged data frame to only those measurements we want 
    data.merged <- data.merged[,c(1,2,measureColumns.we.want + 2)]
    
    #  name the measurement columns in the data frame using the human readable clean measure names
    names(data.merged) <- c("subject", "activity.id", data.raw$measureNames[measureColumns.we.want,2])
    
    #  use the human readable activity names in reach row in the data set, and get rid of the activity.id column
    data.merged <- merge(data.merged, data.raw$activityNames, by.x="activity.id", by.y="id")
    data.clean <- data.merged[,!names(data.merged) %in% c('activity.id')]
    
    #  tidy the data by getting a single average value for each measurement type for each subject and activity
    data.clean <- ddply(melt(data.clean, id.vars=c('subject','activity')),.(subject, activity, variable), summarize, mean=mean(value))
    data.tidy <- dcast(data.clean, subject + activity ~ variable, value.var="mean")
    
    #  write the tidy data to a file, if the file name is give
    if (nchar(outfilename) > 0) {
        write.table(data.tidy, file=outfilename, row.name=FALSE)
    }
    
    #  return the tidy data
    data.tidy
}
