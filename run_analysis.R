#Download and unzip the data.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "dataset.zip", method = 'curl')
unzip("dataset.zip")

#Change work directory to the unziped dir
setwd("UCI HAR Dataset/")

#1. Merges the training and the test sets to create one data set.
#read data
trainData <- read.table("train/X_train.txt")
testData <- read.table("test/X_test.txt")
allData <- rbind(trainData,testData)
#read classes
allClasses <- rbind(read.table("train/y_train.txt"),read.table("test/y_test.txt"))
#read subjects
allSubjects <- rbind(read.table("train/subject_train.txt"),read.table("test/subject_test.txt"))

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
meanIndexes <- grep("mean",features[,2],ignore.case = TRUE)
stdIndexes <- grep("std",features[,2],ignore.case = TRUE)
indexes <- union(meanIndexes,stdIndexes)
allData <- allData[, indexes]


#3. Uses descriptive activity names to name the activities in the data set
colnames(allClasses) <- "activity"
activities <- read.table("activity_labels.txt")
descActivityNames <- tolower(as.character(activities[, 2]))
allClasses$activity <- descActivityNames[allClasses$activity]

#4. Appropriately labels the data set with descriptive variable names. 
colnames(allData) <- tolower(features[indexes, 2])
colnames(allSubjects) <- "subject"
dataset <- cbind(allSubjects, allClasses, allData)
dataset$activity <- factor(dataset$activity)

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
meanOfVariablesByActivityAndSubject <- aggregate( . ~ activity + subject, data=dataset, mean )
write.table( meanOfVariablesByActivityAndSubject, "meanOfVariablesByActivityAndSubject.txt" )