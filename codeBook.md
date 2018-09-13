# Getting and Cleaning Data Programming Assignment Code Book

## Data Set 1 

### Description

This data set contains the mean and standard deviation measurements of the Human Activity Recognition Using Smartphones 
Dataset Version 1.0
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 
50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has 
been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force 
is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency 
was used. 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
From each window, a vector of features was obtained by calculating variables from the 
time and frequency domain. See 'features_info.txt' for more details. Features are normalized and bounded within [-1,1].

**Details of "features_info.txt"**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

**Data Manipulation**

Briefly, the following steps were taken to obtain the dataset from the Human Activity Recognition Using Smartphones 
Dataset Version 1.0:

1. The training and test data sets were merged.
2. The mean and standard deviation features were extracted.
3. The mean and standard deviation features were averaged by subject and activity.

### Variables

Variables are listed below in the order they occupy in the data set, one column per variable. Variables are non-dimensional. The value in the data set is the average by subject and activity of the feature listed below.  

*subject* : Test subject identification (numeric integer)  
*activity*: Activity identification (character)  
*averagetbodyaccmeanx*: mean of time signal of body acceleration in x (numeric double)  
*averagetbodyaccmeany*: mean of time signal of body acceleration in y (numeric double)    
*averagetbodyaccmeanz*: mean of time signal of body acceleration in z (numeric double)    
*averagetbodyaccstdx*: standard deviation of time signal of body acceleration in x (numeric double)    
*averagetbodyaccstdy*: standard deviation of time signal of body acceleration in y (numeric double)    
*averagetbodyaccstdz*: standard deviation of time signal of body acceleration in z (numeric double)   
*averagetgravityaccmeanx*: mean of time signal of gravity acceleration in x (numeric double)    
*averagetgravityaccmeany*: mean of time signal of gravity acceleration in y (numeric double)      
*averagetgravityaccmeanz*: mean of time signal of gravity acceleration in z (numeric double)      
*averagetgravityaccstdx*: standard deviation of time signal of gravity acceleration in x (numeric double)   
*averagetgravityaccstdy*: standard deviation of time signal of gravity acceleration in y (numeric double)  
*averagetgravityaccstdz*: standard deviation of time signal of gravity acceleration in z (numeric double)  
*averagetbodyaccjerkmeanx*: mean of jerk time signal of body acceleration in x (numeric double)    
*averagetbodyaccjerkmeany*: mean of jerk time signal of body acceleration in y (numeric double)    
*averagetbodyaccjerkmeanz*: mean of jerk time signal of body acceleration in z (numeric double)    
*averagetbodyaccjerkstdx*: standard deviation of jerk time signal of body acceleration in x (numeric double)  
*averagetbodyaccjerkstdy*: standard deviation of jerk time signal of body acceleration in y (numeric double)  
*averagetbodyaccjerkstdz*: standard deviation of jerk time signal of body acceleration in z (numeric double)  
*averagetbodygyromeanx*: mean of time signal of body angular velocity in x (numeric double)     
*averagetbodygyromeany*: mean of time signal of body angular velocity in y (numeric double)   
*averagetbodygyromeanz*: mean of time signal of body angular velocity in z (numeric double)   
*averagetbodygyrostdx*:standard deviation of time signal of body angular velocity in x (numeric double)     
*averagetbodygyrostdy*:standard deviation of time signal of body angular velocity in y (numeric double)  
*averagetbodygyrostdz*:standard deviation of time signal of body angular velocity in z (numeric double)  
*averagetbodygyrojerkmeanx*: mean of jerk time signal of body angular velocity in x (numeric double)  
*averagetbodygyrojerkmeany*: mean of jerk time signal of body angular velocity in y (numeric double)  
*averagetbodygyrojerkmeanz*: mean of jerk time signal of body angular velocity in z (numeric double)  
*averagetbodygyrojerkstdx*: standard deviation of jerk time signal of body angular velocity in x (numeric double)   
*averagetbodygyrojerkstdy*: standard deviation of jerk time signal of body angular velocity in y (numeric double)  
*averagetbodygyrojerkstdz*: standard deviation of jerk time signal of body angular velocity in z (numeric double)  
*averagetbodyaccmagmean*: mean of time signal of body acceleration magnitude (numeric double)    
*averagetbodyaccmagstd*: standard deviation of time signal of body acceleration magnitude (numeric double)   
*averagetgravityaccmagmean*: mean of time signal of gravity acceleration magnitude (numeric double)     
*averagetgravityaccmagstd*: standard deviation of time signal of gravity acceleration magnitude (numeric double)  
*averagetbodyaccjerkmagmean*: mean of jerk time signal of body acceleration magnitude (numeric double)   
*averagetbodyaccjerkmagstd*: standard deviation of jerk time signal of body acceleration magnitude (numeric double)  
*averagetbodygyromagmean*: mean of time signal of body angular velocity magnitude (numeric double)  
*averagetbodygyromagstd*: standar deviation of time signal of body angular velocity magnitude (numeric double)   
*averagetbodygyrojerkmagmean*: mean of jerk time signal of body angular velocity magnitude (numeric double)    
*averagetbodygyrojerkmagstd*: standard deviation of jerk time signal of body angular velocity magnitude (numeric double)   
*averagefbodyaccmeanx*: mean of frequency signal of body acceleration in x (numeric double)    
*averagefbodyaccmeany*: mean of frequency signal of body acceleration in y (numeric double)   
*averagefbodyaccmeanz*: mean of frequency signal of body acceleration in z (numeric double)   
*averagefbodyaccstdx*: standard deviation of frequency signal of body acceleration in x (numeric double)   
*averagefbodyaccstdy*: standard deviation of frequency signal of body acceleration in y (numeric double)  
*averagefbodyaccstdz*: standard deviation of frequency signal of body acceleration in z (numeric double)  
*averagefbodyaccjerkmeanx*: mean of jerk frequency signal of body acceleration in x (numeric double)   
*averagefbodyaccjerkmeany*: mean of jerk frequency signal of body acceleration in y (numeric double)   
*averagefbodyaccjerkmeanz*: mean of jerk frequency signal of body acceleration in z (numeric double)   
*averagefbodyaccjerkstdx*: standard deviation of jerk frequency signal of body acceleration in x (numeric double)    
*averagefbodyaccjerkstdy*: standard deviation of jerk frequency signal of body acceleration in y (numeric double)  
*averagefbodyaccjerkstdz*: standard deviation of jerk frequency signal of body acceleration in z (numeric double)  
*averagefbodygyromeanx*: mean of frequency signal of body angular velocity in x (numeric double)   
*averagefbodygyromeany*: mean of frequency signal of body angular velocity in y (numeric double)     
*averagefbodygyromeanz*: mean of frequency signal of body angular velocity in z (numeric double)     
*averagefbodygyrostdx*: standard deviation of frequency signal of body angular velocity in x (numeric double)  
*averagefbodygyrostdy*: standard deviation of frequency signal of body angular velocity in y (numeric double)  
*averagefbodygyrostdz*: standard deviation of frequency signal of body angular velocity in z (numeric double)  
*averagefbodyaccmagmean*: mean of frequency signal of body acceleration magnitude (numeric double)  
*averagefbodyaccmagstd*: standard deviation of time signal of body acceleration magnitude (numeric double)  
*averagefbodybodyaccjerkmagmean*: mean of frequency signal of jerk body acceleration magnitude (numeric double)  
*averagefbodybodyaccjerkmagstd*: standard deviation of frequency signal of jerk body acceleration magnitude (numeric double)  
*averagefbodybodygyromagmean*: mean of frequency signal of body angular velocity magnitude (numeric double)  
*averagefbodybodygyromagstd*: standard deviation of frequency signal of body angular velocity magnitude (numeric double)  
*averagefbodybodygyrojerkmagmean*: mean of frequency signal of body jerk angular velocity magnitude (numeric double)   
*averagefbodybodygyrojerkmagstd*: standard deviation of frequency signal of body jerk angular velocity magnitude (numeric double)

     
        