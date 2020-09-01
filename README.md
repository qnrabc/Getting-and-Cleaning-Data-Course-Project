# Getting and Cleaning Data, Course Project

This is the course project for the Getting and Cleaning Data Coursera course. The repo includes the following:

- **run_analysis.R** R script that cleans up the data. The script does the following:
  - Loads the original data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Relabels the dataset with descriptive variable names.
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  - Writes the dataset to the **tidy.txt** file.
- **CodeBook.md** a code book that describes the variables, the data, and transformations that **run_analysis.R** performed to clean up the data 
- **tidy.txt** The tidy dataset output by **run_analysis.R**
