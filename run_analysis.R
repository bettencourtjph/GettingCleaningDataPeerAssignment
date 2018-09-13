# Getting and cleaning data course project.
# This script cleans the Human Activity Recognition Using Smartphones Dataset.
# More specifically, the script performs the following:
#         1. Merges the training and test data sets
#         2. Extracts the mean and standard deviation for each measurement
#         3. Names the activities with descriptive names
#         4. Labels the data set with descriptive variable names
#         5. Creates an independent data set with the average of each variable for each
#            activity and each subject
         
# 1. Merge the training and test datasets

# The datasets are spread across the following files:
#
#   'train/subject_train.txt': Each row identifies the subject who performed the activity 
#                        for each window sample. Its range is from 1 to 30. 
#   'train/X_train.txt'      : Training set.
#   'train/y_train.txt'      : Training labels.
#
#   'test/subject_test.txt': Each row identifies the subject who performed the activity 
#                        for each window sample. Its range is from 1 to 30. 
#   'test/X_test.txt'      : Test set.
#   'test/y_test.txt'      : Test labels.
#

# Read the subject, data and activity labels for the training data set
# For the subject and label data, add variable names.

trainSubjects <- read.table("train/subject_train.txt", col.names = "subject")
trainData <- read.table("train/X_train.txt", colClasses = "numeric", nrows = 7352)
trainLabels <- read.table("train/y_train.txt", col.names = "activity")

trainSet <- cbind(trainSubjects, trainLabels, trainData)

# Read the subject, data and activity labels for the test data set
# For the subject and label data, add variable names.

testSubjects <- read.table("test/subject_test.txt", col.names = "subject")
testData <- read.table("test/X_test.txt", colClasses = "numeric", nrows = 7352)
testLabels <- read.table("test/y_test.txt", col.names = "activity")

testSet <- cbind(testSubjects, testLabels, testData)

# Clear data frames not needed anymore

rm(trainSubjects,trainLabels,trainData,testSubjects,testLabels,testData)

# Merge training and test datasets

dataSet <- rbind(trainSet,testSet)

# 2. Extract the mean and standard deviation for each measurement
#
# Mean and standard deviation of each measurement are identified by the "mean()" and
# "std()" strings in the features list that is found in file "features.txt". The script
# will read this file, get the features name list, find the indices for the mean and std 
# measurements and extract those from the dataSet data frame.

featuresList <- read.table("features.txt")

isMean <- grep("mean()",featuresList$V2,fixed = TRUE) # V2 is the R assign name of the 2nd col 
isStd <- grep("std()",featuresList$V2,fixed = TRUE)

# Join mean and std columns indices and sort so that the order of columns is preserved 
# (add 2 to index correctly into dataSet)

isExtract <- sort(append(isMean,isStd)+2)

# Extract mean and std datasets (together with subject and activity)

dataSet <- dataSet[,append(c(1,2),isExtract)]

# 3. Name the activities with descriptive names

# Activities names are stored in "activity_labels.txt".

actLabels <- read.table("activity_labels.txt")

# Index in to actLabels with dataSet activity indices

Labels <- actLabels$V2[dataSet$activity]

# Replace activity indices by Labels factor

dataSet$activity <- Labels

# 4. Label the data set with descriptive variable names

# The variable names are stored in file "features.txt".

varLabels <- read.table("features.txt")

# Get variable labels from varLabels by indexing with isMean and isStd (use as.character to get 
# character vector instead of factors)

useLabels <- as.character(varLabels$V2[sort(append(isMean,isStd))])

# Clean the labels (remove ()")

useLabels <- sapply(useLabels, function(x) tolower(gsub("()","",x,fixed = TRUE)))

# And once again to remove "-"

useLabels <- sapply(useLabels, function(x) tolower(gsub("-","",x,fixed = TRUE)))

# Apply useLabels to column names

names(dataSet)[3:ncol(dataSet)] <- useLabels

# 5. Create an independent data set with the average of each variable for each
#    activity and each subject

library(tidyr)
library(dplyr)

gatherData <- function(x,useAct=0) {
        # Takes a data frame x with subjects as observations and activities as variables
        # and returns a data frame y with activities as factor and averages as value. There are 30 subjects and
        # 6 activities so the output has 180 rows.
        # If useAct is 1, return activity and values, if 0 return only values
        
        if (useAct == 1){
           y <- gather(x,activity,mean, factor_key = TRUE)    
        } else if (useAct == 0) {
           y <- gather(x,activity,mean, factor_key = TRUE)
           y$mean
        }
}

# Create empty data frame and add "subject" variable values

averageDataSet <- data.frame(subject = rep(1:30,6))

# Loop through variables and compute mean by subject and activity. Then gather and add to averageDataSet

for (j in 3:ncol(dataSet)) {
        
        averagedData <- as.data.frame(tapply(dataSet[,names(dataSet)[j]],list(dataSet$subject,
                                dataSet$activity),mean))
        
        if (j == 3){
                averageDataSet <- cbind(averageDataSet, gatherData(averagedData,1))  
        } else {
                averageDataSet <- cbind(averageDataSet, gatherData(averagedData))  
        }
        
}

# Give appropriate names to data columns

names(averageDataSet)[3:ncol(averageDataSet)] <- sapply(names(dataSet)[3:ncol(averageDataSet)],
                                                        function(x) paste("average",x,sep=""))

# 6. Save data set

saveAverageDataSet <- write.table(averageDataSet,"averageDataSet.txt", row.names = FALSE)

