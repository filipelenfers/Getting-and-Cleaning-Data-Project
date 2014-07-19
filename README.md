#Getting and Cleaning Data Project

This repository contains:

+ run_analysis.R : a R script to tranform the original dataset (Human Activity Recognition Using Smartphones Data Set Version 1.0) into a tidy version.
+ Codebook.md : the codebook for this dataset, contains explanations needed to understante the data.
+ meanOfVariablesByActivityAndSubject.txt : tidy dataset created by the run_analysis.R script.
+ README.MD : this file.

The R script do the following steps:

1. Download and unzip the original dataset
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 