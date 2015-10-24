# Need to insert some preamable here.

# This requires the 'reshape2' library and assumes it is already installed on the user's system.
library(reshape2)

# A function to handle getting the data from the files and then pass that data back.
# Need to pass in the activities file, the readings file, and the subjects file.
parse_readings <- function(activities_file, readings_file, subjects_file) {
    data_subjects <- read.table(subjects_file, header = FALSE)
    data_activity_numbers <- read.table(activities_file,header = FALSE)
    activity_labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                         "SITTING", "STANDING", "LAYING")
    data_activity_labels <- vector(mode="character", length=length(data_activity_numbers))
    for (i in 1:nrow(data_activity_numbers)) {
        data_activity_labels[i] <- activity_labels[data_activity_numbers[i,1]]
    }
    x <- read.fwf(
        file=readings_file,
        as.is = TRUE,
        widths=(c(rep(16, 561))))
    data_selected <- cbind(x[, 1:6], x[, 41:46], x[, 81:86], x[, 121:126], x[, 161:166], x[, 201:202],
                           x[, 214:215], x[, 227:228], x[, 240:241], x[, 253:254], x[, 266:271],
                           x[, 345:350], x[, 424:429], x[, 503:504], x[, 516:517], x[, 529:530],
                           x[, 542:543])
    cbind(data_subjects, data_activity_labels, data_selected)
    
}

melt_and_display_data <- function(filename, var_columns) {
    
    current_directory <- getwd()
    setwd(original_dir)
    setwd("output")
    
    # First we 'melt' the data to only have the information we most want to see
    melted_data <- melt(collected_data, id=c("Subject","Activities"),measure.vars = var_columns)
    
    # Calculating the mean for the variable columns in the melted data
    subject_activity_data <- dcast(melted_data, Subject+Activities ~ variable,mean)
    
    # Displaying the head and tail of the resulting data
    # print("Here is the output of the melted data:")
    write.table(subject_activity_data, file = paste0(filename, ".txt"), row.names = FALSE)
    
    setwd(current_directory)
}

# Check if our desired working directory exists. If it doesn't, then create it.
if(!file.exists("./data")){dir.create("./data")}
if(!file.exists("./output")){dir.create("./output")}

# Moving into the desired working directory after recording our starting directory.
original_dir <- getwd()
setwd("./data")

# First step is to download the zip file that contains our data.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "Dataset.zip"
if(!file.exists(zipFile)){download.file(fileUrl,destfile=zipFile,mode="wb")}

# Next step is to extract the data from the zip file.
unzip(zipFile)

# Need to move into the directory that contains the data.
data_dir <- list.dirs('.', recursive = FALSE)

setwd(data_dir)

# Set the locations of the files we need to scan here.
training_activities_file <- "train/y_train.txt"
training_readings_file <- "train/X_train.txt"
training_subjects_file <- "train/subject_train.txt"
testing_activities_file <- "test/y_test.txt"
testing_readings_file <- "test/X_test.txt"
testing_subjects_file <- "test/subject_test.txt"

collected_data <- parse_readings(training_activities_file, training_readings_file, training_subjects_file)
collected_data <- rbind(collected_data, parse_readings(testing_activities_file, testing_readings_file,
                                                       testing_subjects_file))
column_names <- c("Subject", "Activities", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
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
colnames(collected_data) <- column_names

# Making an example set of data by calculating the mean of the tBodyAcc mean and std values for all axes
tBodyAcc_cols <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
                   "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z")
tGravityAcc_cols <- c("tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", 
                      "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z")
tBodyAccJerk_cols <- c("tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
                       "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z")
tBodyGyro_cols <- c("tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", 
                    "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z")
tBodyGyroJerk_cols <- c("tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", 
                        "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z")
tBodyAccMag_cols <- c("tBodyAccMag-mean()", "tBodyAccMag-std()")
tGravityAccMag_cols <- c("tGravityAccMag-mean()", "tGravityAccMag-std()")
tBodyAccJerkMag_cols <- c("tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()")
tBodyGyroMag_cols <- c("tBodyGyroMag-mean()", "tBodyGyroMag-std()")
tBodyGyroJerkMag_cols <- c("tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()")
fBodyAcc_cols <- c("fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", 
                   "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z")
fBodyAccJerk_cols <- c("fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", 
                       "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z")
fBodyGyro_cols <- c("fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", 
                    "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z")
fBodyAccMag_cols <- c("fBodyAccMag-mean()", "fBodyAccMag-std()")
fBodyBodyAccJerkMag_cols <- c("fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()")
fBodyBodyGyroMag_cols <- c("fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()")
fBodyBodyGyroJerkMag_cols <- c("fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")


# There is a lot of data to display. Here's where we call the necessary functions.
melt_and_display_data("tBodyAcc", tBodyAcc_cols)
melt_and_display_data("tGravityAcc", tGravityAcc_cols)
melt_and_display_data("tBodyAccJerk", tBodyAccJerk_cols)
melt_and_display_data("tBodyGyro", tBodyGyro_cols)
melt_and_display_data("tBodyGyroJerk", tBodyGyroJerk_cols)
melt_and_display_data("tBodyAccMag", tBodyAccMag_cols)
melt_and_display_data("tGravityAccMag", tGravityAccMag_cols)
melt_and_display_data("tBodyAccJerkMag", tBodyAccJerkMag_cols)
melt_and_display_data("tBodyGyroMag", tBodyGyroMag_cols)
melt_and_display_data("tBodyGyroJerkMag", tBodyGyroJerkMag_cols)
melt_and_display_data("fBodyAcc", fBodyAcc_cols)
melt_and_display_data("fBodyAccJerk", fBodyAccJerk_cols)
melt_and_display_data("fBodyGyro", fBodyGyro_cols)
melt_and_display_data("fBodyAccMag", fBodyAccMag_cols)
melt_and_display_data("fBodyBodyAccJerkMag", fBodyBodyAccJerkMag_cols)
melt_and_display_data("fBodyBodyGyroMag", fBodyBodyGyroMag_cols)
melt_and_display_data("fBodyBodyGyroJerkMag", fBodyBodyGyroJerkMag_cols)

# When all is said and done, we must return to our starting directory.
setwd(original_dir)
