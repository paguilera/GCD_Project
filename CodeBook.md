# CookBook

This file contains a description of variables, data, and transformations performed on the data collected
from the specified online data source given in the original project assignment.

## Variables

A basic variable was created to track the URL for the file specified in the project.
Additionally, a variable to track the local name for the file after it was downloaded was created

+ **fileUrl** <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
+ **zipFile** <- "Dataset.zip"

Given the output of the zip file, some variables were set up to store the names of the files that were
used to import the data for manipulation:

+ **training_activities_file** stores the location of the 'y_train.txt' file
+ **training_readings_file** stores the location of the 'X_train.txt'
+ **training_subjects_file** stores the location of the 'subject_train.txt'
+ **testing_activities_file** stores the location of the 'y_test.txt'
+ **testing_readings_file** stores the location of the 'X_test.txt'
+ **testing_subjects_file** stores the location of the 'subject_test.txt'
+ **column_names** stores the names of the columns used in the merged data frame. 

## Data

The imported data is most valuable to us in grouped columns. To help with that, these variables were created based on the incoming data and logical separation and grouping of those columns.

+ **tBodyAcc_cols** are the columns that contain data related to the tBodyAcc mean and standard deviation on the X, Y, and Z axes.
+ **tGravityAcc_cols** are the columns that contain data related to the tGravityAcc mean and standard deviation on the X, Y, and Z axes. 
+ **tBodyAccJerk_cols** are the columns that contain data related to the tBodyAccJerk mean and standard deviation on the X, Y, and Z axes. 
+ **tBodyGyro_cols** are the columns that contain data related to the tBodyGyro mean and standard deviation on the X, Y, and Z axes.
+ **tBodyGyroJerk_cols** are the columns that contain data related to the tBodyGyroJerk mean and standard deviation on the X, Y, and Z axes.
+ **tBodyAccMag_cols** are the columns that contain the data for the tBodyAccMag mean and standard deviation.
+ **tGravityAccMag_cols** are the columns that contain the data for the tGravityAccMag mean and standard deviation.
+ **tBodyAccJerkMag_cols** are the columns that contain the data for the tBodyAccJerkMag mean and standard deviation.
+ **tBodyGyroMag_cols** are the columns that contain the data for the tBodyGyroMag mean and standard deviation.
+ **tBodyGyroJerkMag_cols** are the columns that contain the data for the tBodyGyroJerkMag mean and standard deviation.
+ **fBodyAcc_cols** are the columns that contain data related to the fBodyAcc mean and standard deviation on the X, Y, and Z axes.
+ **fBodyAccJerk_cols** are the columns that contain data related to the fBodyAccJerk mean and standard deviation on the X, Y, and Z axes.
+ **fBodyGyro_cols** are the columns that contain data related to the fBodyGyro mean and standard deviation on the X, Y, and Z axes.
+ **fBodyAccMag_cols** are the columns that contain the data for the fBodyAccMag mean and standard deviation.
+ **fBodyBodyAccJerkMag_cols** are the columns that contain the data for the fBodyBodyAccJerkMag mean and standard deviation.
+ **fBodyBodyGyroMag_cols** are the columns that contain the data for the fBodyBodyGyroMag mean and standard deviation.
+ **fBodyBodyGyroJerkMag_cols** are the columns that contain the data for the fBodyBodyGyroJerkMag mean and standard deviation.


## Transformations and Work

Taken from the comments in the R script, here are the steps followed to take our original source data and processing it until we have our indivdually generated output files (found in the _data_ directory created in step 1 described below).

1. Check if our desired working and output directories exist. If either doesn't, then create it.
1. Moving into the desired working directory after recording our starting directory.
1. First step is to download the zip file that contains our data if it hasn't already been downloaded.
1. Next step is to extract the data from the zip file.
1. Need to move into the directory that contains the data.
1. Set the locations of the files we need to scan here.
1. Now we build a data frame to contain the data using our previously declared function. In total, this merges 6 different files into a single unified data frame.
1. Set up the names of the columns to be used in our unified data frame.
1. Defining our groups of columns that we will use to create the output files in the next step.
1. There is a lot of data to generate. Here's where we call the previously defined function that displays each collected set of columns as an individual file. In total, there are 18 separate files created.
1. When all is said and done, we return to our starting directory. However, we now have the input and output data in the created subfolders so that a user can peruse the data at a future time.
