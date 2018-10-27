# Peer Graded Assignment Project- Getting and Cleaning Data
# You should create one R script called run_analysis.R that does the following.

# Merges the training and the test sets to create one data set.
# Extract only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

# Download data files
setwd("C:/Users/Milind/Desktop/move/Data Science/Library/Getting and Cleaning Data/Week4/data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="dataSet.zip", method="curl")

# Libraries
library(data.table)
library(dplyr)
library(stringr)

# Read data files - training
setwd("C:/Users/Milind/Desktop/move/Data Science/Library/Getting and Cleaning Data/Week4/data/dataSet/train/")
subject_train <- read.table("subject_train.txt", header = FALSE, sep = "")
Y_train <- read.table("y_train.txt", header = FALSE, sep = "")
X_train <- read.table("X_train.txt", header = FALSE, sep = "")

# Read data files - testing
setwd("C:/Users/Milind/Desktop/move/Data Science/Library/Getting and Cleaning Data/Week4/data/dataSet/test/")
subject_test <- read.table("subject_test.txt", header = FALSE, sep = "")
Y_test <- read.table("y_test.txt", header = FALSE, sep = "")
X_test <- read.table("X_test.txt", header = FALSE, sep = "")

# Read "Features.txt" and activity_labels.txt
setwd("C:/Users/Milind/Desktop/move/Data Science/Library/Getting and Cleaning Data/Week4/data/dataSet/")
features <- read.table("features.txt", header = FALSE, sep = "")
activity_labels<- read.table("activity_labels.txt", header = FALSE, sep = "")


# 1 Merges the training and the test sets to create one data set.
dfX <- rbind(X_train, X_test)
dfY <- rbind(Y_train, Y_test)
dfSubject <- rbind(subject_train, subject_test)

# 2 Extract only the measurements on the mean and standard deviation for each measurement.
MeanStd <- grep("mean()|std()", features[, 2]) 
dfX <- dfX[,MeanStd]

#Subset "features" dataset
features1 <- features[MeanStd,]

# 3. Uses descriptive activity names to name the activities in the data set
# extract activity column of , re-name lable of levels with activity_levels, and apply it to dataSet.
activityCol <- factor(dfY$V1)
levels(activityCol) <- activity_labels[,2]
dfY$V1 <- activityCol
names(dfY) <- "activity"

# 4 Appropriately labels the data set with descriptive variable names.
features2 <- gsub("[()]","",features1$V2)
names(dfX) <- features2
names(dfSubject) <- "subID"

# merge all datasets to create a final data set.
dataSet <- cbind(dfSubject,dfY, dfX)

# 5 From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.

dataSetGrouped <- group_by(dataSet, subID, activity)
tidyDataSet <- summarize_all(dataSetGrouped, funs(mean))

# Write data to a text file.
write.table(tidyDataSet, "tidyData.txt",row.name=FALSE) 


