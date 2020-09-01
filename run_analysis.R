library(reshape2)

##  Download the dataset and unzip it

dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("./data.zip") ) {
  download.file(dataURL, "./data.zip", method = "curl")
  unzip("./data.zip", exdir =)
}

##  Load test and train data and merge them

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
s <- rbind(subject_test, subject_train)

## Load activity labels and features

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[,2]
features <- read.table("./UCI HAR Dataset/features.txt")

## Take columns of x containing either std or mean patterns
id_selected_columns <- grep("std|mean", features[,2])
x <- x[,id_selected_columns]
## Merge all the data
data <- cbind(s, y, x)

## Relabel feature columns
colnames(data) <- c("subject", "activity", features[id_selected_columns,2])
## Remove ()
colnames(data) <- gsub("\\(\\)", "", colnames(data) )
## Replace -mean with Mean
colnames(data) <- gsub("-mean", "Mean", colnames(data) )
## Replace -std with Std
colnames(data) <- gsub("-std", "Std", colnames(data) )

## Set descriptive activity names
data$activity<-sapply(data$activity, function(x) activity_labels[x])

## Create a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

meltedData <- melt(data, id = c("subject", "activity") )
tidy <- dcast(meltedData, subject + activity ~ variable, mean)

write.table(tidy, file = "./tidy.txt", row.name=FALSE)