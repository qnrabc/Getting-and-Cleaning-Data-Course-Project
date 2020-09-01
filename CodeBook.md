# Code book

### Data transformations

In what follows we describe transformations performed by **run_analysis.R** to obtain the tidy dataset from the original dataset.

- Load the original data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
- Merge the training and the test sets to create one data set. The data for measurements, activities and subjects is stored in variables respectively *x*, *y* and *s*.
- Load activity labels and feature names into variables *activity_labels* and *features*.
- Extract only the measurements on the mean and standard deviation for each measurement. Do it by searching for the pattern *std|mean* in *feature*
- Merge data frames *s*, *y* and *x* (using cbind function) and set appropriate column names (described in the **Data fields** section below).
- Create a second data set *tidy* with the average of each measurement for each activity and each subject. In order to do so first melt the data by id = c("subject", "activity") then dcast on subject + activity ~ variable.
- Write the dataset to the **tidy.txt** file.

## Data fields

Below we sumarise the data fields in the file **tidy.txt** which is produced as an output of **run_analysis.R**. The first two columns of the dataset contain identifiers. The remaining columns contain measurements. 

### Identifiers

- subject - contains the id of a subject
- activity - contains the name of an activity performed by the subject. Can contain one of the following values:
  + WALKING
  + WALKING_UPSTAIRS
  + WALKING_DOWNSTAIRS
  + SITTING
  + STANDING
  + LAYING

### Measurements

The following measurements are available

- "tBodyAccMean-X"
- "tBodyAccMean-Y"
- "tBodyAccMean-Z"
- "tBodyAccStd-X"
- "tBodyAccStd-Y"
- "tBodyAccStd-Z"
- "tGravityAccMean-X"
- "tGravityAccMean-Y"
- "tGravityAccMean-Z"
- "tGravityAccStd-X"
- "tGravityAccStd-Y"
- "tGravityAccStd-Z"
- "tBodyAccJerkMean-X"
- "tBodyAccJerkMean-Y"
- "tBodyAccJerkMean-Z"
- "tBodyAccJerkStd-X"
- "tBodyAccJerkStd-Y"
- "tBodyAccJerkStd-Z"
- "tBodyGyroMean-X"
- "tBodyGyroMean-Y"
- "tBodyGyroMean-Z"
- "tBodyGyroStd-X"
- "tBodyGyroStd-Y"
- "tBodyGyroStd-Z"
- "tBodyGyroJerkMean-X"
- "tBodyGyroJerkMean-Y"
- "tBodyGyroJerkMean-Z"
- "tBodyGyroJerkStd-X"
- "tBodyGyroJerkStd-Y"
- "tBodyGyroJerkStd-Z"
- "tBodyAccMagMean"
- "tBodyAccMagStd"
- "tGravityAccMagMean"
- "tGravityAccMagStd"
- "tBodyAccJerkMagMean"
- "tBodyAccJerkMagStd"
- "tBodyGyroMagMean"
- "tBodyGyroMagStd"
- "tBodyGyroJerkMagMean"
- "tBodyGyroJerkMagStd"
- "fBodyAccMean-X"
- "fBodyAccMean-Y"
- "fBodyAccMean-Z"
- "fBodyAccStd-X"
- "fBodyAccStd-Y"
- "fBodyAccStd-Z"
- "fBodyAccMeanFreq-X"
- "fBodyAccMeanFreq-Y"
- "fBodyAccMeanFreq-Z"
- "fBodyAccJerkMean-X"
- "fBodyAccJerkMean-Y"
- "fBodyAccJerkMean-Z"
- "fBodyAccJerkStd-X"
- "fBodyAccJerkStd-Y"
- "fBodyAccJerkStd-Z"
- "fBodyAccJerkMeanFreq-X"
- "fBodyAccJerkMeanFreq-Y"
- "fBodyAccJerkMeanFreq-Z"
- "fBodyGyroMean-X"
- "fBodyGyroMean-Y"
- "fBodyGyroMean-Z"
- "fBodyGyroStd-X"
- "fBodyGyroStd-Y"
- "fBodyGyroStd-Z"
- "fBodyGyroMeanFreq-X"
- "fBodyGyroMeanFreq-Y"
- "fBodyGyroMeanFreq-Z"
- "fBodyAccMagMean"
- "fBodyAccMagStd"
- "fBodyAccMagMeanFreq"
- "fBodyBodyAccJerkMagMean"
- "fBodyBodyAccJerkMagStd"
- "fBodyBodyAccJerkMagMeanFreq"
- "fBodyBodyGyroMagMean"
- "fBodyBodyGyroMagStd"
- "fBodyBodyGyroMagMeanFreq"
- "fBodyBodyGyroJerkMagMean"
- "fBodyBodyGyroJerkMagStd"
- "fBodyBodyGyroJerkMagMeanFreq"
