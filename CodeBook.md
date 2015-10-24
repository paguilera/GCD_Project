# CookBook

This file contains a description of variables, data, and transformations performed on the data collected
from the specified online data source given in the original project assignment.

## Variables

A basic variable was created to track the URL for the file specified in the project.
Additionally, a variable to track the local name for the file after it was downloaded was created

**fileUrl** <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
**zipFile** <- "Dataset.zip"

Given the output of the zip file, some variables were set up to store the names of the files that were
used to import the data for manipulation.
**training_activities_file** stores the location of the 'y_train.txt' file
**training_readings_file** stores the location of the 'X_train.txt'
**training_subjects_file** stores the location of the 'subject_train.txt'
**testing_activities_file** stores the location of the 'y_test.txt'
**testing_readings_file** stores the location of the 'X_test.txt'
**testing_subjects_file** stores the location of the 'subject_test.txt'

## Data

**column_names** <- c("Subject", "Activities", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
                  "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", 
                  "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", 
                  "tGravityAcc-std()-Z", "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
                  "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", 
                  "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", 
                  "tBodyGyro-std()-Z", "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", 
                  "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", 
                  "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", 
                  "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", 
                  "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", 
                  "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", 
                  "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", 
                  "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", 
                  "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", "fBodyAccMag-mean()", 
                  "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", 
                  "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", 
                  "fBodyBodyGyroJerkMag-std()")

**tBodyAcc_cols** <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
                   "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z")
**tGravityAcc_cols** <- c("tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", 
                      "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z")
**tBodyAccJerk_cols** <- c("tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
                       "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z")
**tBodyGyro_cols** <- c("tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", 
                    "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z")
**tBodyGyroJerk_cols** <- c("tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", 
                        "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z")
**tBodyAccMag_cols** <- c("tBodyAccMag-mean()", "tBodyAccMag-std()")
**tGravityAccMag_cols** <- c("tGravityAccMag-mean()", "tGravityAccMag-std()")
**tBodyAccJerkMag_cols** <- c("tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()")
**tBodyGyroMag_cols** <- c("tBodyGyroMag-mean()", "tBodyGyroMag-std()")
**tBodyGyroJerkMag_cols** <- c("tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()")
**fBodyAcc_cols** <- c("fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", 
                   "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z")
**fBodyAccJerk_cols** <- c("fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", 
                       "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z")
**fBodyGyro_cols** <- c("fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", 
                    "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z")
**fBodyAccMag_cols** <- c("fBodyAccMag-mean()", "fBodyAccMag-std()")
**fBodyBodyAccJerkMag_cols** <- c("fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()")
**fBodyBodyGyroMag_cols** <- c("fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()")
**fBodyBodyGyroJerkMag_cols** <- c("fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")


## Transformations and Work
