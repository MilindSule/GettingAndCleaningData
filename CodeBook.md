# Code Book describes the variables.

fileUrl - Defines URL for the website to get the dataset.

subject_train - Stores subjects for training dataset.

Y_train - Stores activities for training dataset.

X_train - Stores obersrvations for training dataset.

subject_test - Stores subjects for testing dataset.

Y_test - Stores activities for testing dataset.

X_test - Stores obersrvations for testing dataset.

features - List of all features.

activity_labels - List of activity descriptions

dfX - Merged dataset for all observations in training and testing datasets. 

dfY - Merged dataset for all activities in training and testing datasets. 

dfSubject - Merged dataset for all subjects in training and testing datasets. 

features1 - subset of features which contain text strings "mean" and "standard" in the variable names. 

features2 - Clean and descriptive variable names from features1 dataset.

dataSet - Master dataset

dataSetGrouped - Dataset grouped by subjects followed by activities.

tidyDataSet - Tidy Dataset, it stores mean of grouped observations.

tidyData.txt - stores Tidy dataset into a file.
