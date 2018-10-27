# GettingAndCleaningData
## This document describes, how the script works

### Preparation:
  Setup the data directory and download data files from the website.
  
### Step1: Merges the training and the test sets to create one data set.
  Read data tables for training, testing, activity labels and features.
  Merge training and testing data into dfX, dfY and dfSubject dataset.
  
### Step2:Extracts only the measurements on the mean and standard deviation for each measurement.
  Extract column indices for mean and standard functions from the features dataset. Assign it to MeanStd.
  Extract columns of dataset dfX using above indices.
  Subset the features vector based on MeanStd and assign it to features1
  
### Step3:Uses descriptive activity names to name the activities in the data set.
  Extract factors out of activity vector.
  Assign activity_labels(descriptions) to activityCol levels.
  Change variable name of dfY to "activity"
  
### Step4:Appropriately labels the data set with descriptive variable names.
  Modify features1 data to create meaningful variable names(features2).
  Modify variable names of data table dfX using features2.  
  Change the variable name of dfSubject to "subID"
  Merge all data tables (dfSubject,dfY, dfX) to create a master data table called dataSet.
  
### Step5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Group dataSet by subject ID followed by activity and summarize the mean of the grouped data subset to create a tidy dataset.
  Write the tidy dataset to a "tidyData.txt" file. 
  
