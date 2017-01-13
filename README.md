# ProgrammingAssignment4
Programming Assignment 4: Getting and Cleaning Data Course Project

In course 3 we have learnt how to retrieve data raw and convert it to clean data, which can be used for data analysis. In order to demonstrate our newly acquired skills we wrote a script to clean the laboratory measurements of the accelerometer and gyroscope in a smartphone.

The raw data can be download here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


With a description here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


In this repository are given the script and mean tidy data set resulting from step 5 below:
* run_analysis.R
* mean.tidy.data.txt

The raw data should be unpacked in the same folder as the script is given. If you rename the folder of the experimental data, you need to change the path variable in the script:
* path <- "UCI HAR Dataset/"

The main steps of the script are the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.