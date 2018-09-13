# GettingCleaningDataPeerAssignment

## run_analysis.R

This script cleans the Human Activity Recognition Using Smartphones Dataset.
More specifically, the script performs the following:     
1. Merges the training and test data sets  
2. Extracts the mean and standard deviation for each measurement  
3. Names the activities with descriptive names  
4. Labels the data set with descriptive variable names  
5. Creates an independent data set with the average of each variable for each
            activity and each subject  
         
### 1. Merge the training and test datasets

The datasets are spread across the following files:  

   'train/subject_train.txt': Each row identifies the subject who performed the activity 
                        for each window sample. Its range is from 1 to 30.   
   'train/X_train.txt'      : Training set.  
   'train/y_train.txt'      : Training labels.  

   'test/subject_test.txt': Each row identifies the subject who performed the activity 
                        for each window sample. Its range is from 1 to 30.   
   'test/X_test.txt'      : Test set.  
   'test/y_test.txt'      : Test labels.  


The script reads the subject, data and activity labels for the training and test data sets and
for the subject and label data, adds variable names.  

E.g., for the test data set:
```{r}
testSubjects <- read.table("test/subject_test.txt", col.names = "subject")
testData <- read.table("test/X_test.txt", colClasses = "numeric", nrows = 7352)
testLabels <- read.table("test/y_test.txt", col.names = "activity")

testSet <- cbind(testSubjects, testLabels, testData)
```

Then it clears data frames not needed anymore and merges the training and test datasets with:
```{r}
dataSet <- rbind(trainSet,testSet)
```
### 2. Extract the mean and standard deviation for each measurement

 Mean and standard deviation of each measurement are identified by the "mean()" and
 "std()" strings in the features list that is found in file "features.txt". The script
 will read this file, get the features name list, find the indices for the mean and std 
 measurements with grep:  
```{r}
featuresList <- read.table("features.txt")

isMean <- grep("mean()",featuresList$V2,fixed = TRUE) # V2 is the R assign name of the 2nd col 
isStd <- grep("std()",featuresList$V2,fixed = TRUE)
```
and extract those from the dataSet data frame. It hen joins mean and std columns indices and sorts them so that the order of columns is preserved (adding 2 to index correctly into dataSet). It then
extracts mean and std datasets (together with subject and activity). 
```{r}
isExtract <- sort(append(isMean,isStd)+2)
dataSet <- dataSet[,append(c(1,2),isExtract)]
```

### 3. Name the activities with descriptive names

Activities names are stored in "activity_labels.txt". The script indexes in to actLabels with dataSet activity indices and replaces activity indices by Labels factor
```{r}
dataSet$activity <- Labels
```

### 4. Label the data set with descriptive variable names
The variable names are stored in file "features.txt". The script gets variable labels from varLabels by indexing with isMean and isStd (uses as.character to get character vector instead of factors). Then it cleans the labels (remove "()" and "-") and applies useLabels to column names.  
```{r}
names(dataSet)[3:ncol(dataSet)] <- useLabels
```
### 5. Create an independent data set with the average of each variable for each activity and each subject

The script uses a function gatherData and tapply to perform this action.  

```{r}
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
```
It creates an empty data frame and adds "subject" variable values:  
```{r}
averageDataSet <- data.frame(subject = rep(1:30,6))
```
Then loops through variables and computes mean by subject and activity using tapply. Then gathers and adds to averageDataSet:  
```{r}
for (j in 3:ncol(dataSet)) {
        
        averagedData <- as.data.frame(tapply(dataSet[,names(dataSet)[j]],list(dataSet$subject,
                                dataSet$activity),mean))
        
        if (j == 3){
                averageDataSet <- cbind(averageDataSet, gatherData(averagedData,1))  
        } else {
                averageDataSet <- cbind(averageDataSet, gatherData(averagedData))  
        }
        
}
```
Finally, it gives appropriate names to data columns.  

### 6. Save data sets

```{r}
saveDataSet <- write.table(dataSet,"dataSet.txt")
saveAverageDataSet <- write.table(averageDataSet,"averageDataSet.txt", row.names = FALSE)
```
