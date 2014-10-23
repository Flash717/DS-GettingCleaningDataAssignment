##
## Coursera Data Science Specialization
## Getting and Cleaning Data Assignment
## Created by Florian Knaus 9/19/14
##

rm(list=ls())
#setwd("%USERHOME%/Dropbox/eLearning/Data Science/3 Getting and Cleaning Data/Assignment")
setwd("c:/users/10131433/Dropbox/eLearning/Data Science/3 Getting and Cleaning Data/Assignment")

## 0 Download file, unzip content, and remove zip file (to save space)
zip_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
dest_zip <- 'getdata_assignment.zip'
download.file(url = zip_url, destfile = dest_zip)
unzip(dest_zip)
file.remove(dest_zip)


## 1 Merge the training and test sets to create one data set.

# read training data
train.x <- read.table(file = "UCI HAR Dataset//train//X_train.txt", header = FALSE, sep = "")
train.y <- read.table(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE)
train.subject <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train.combined <- cbind(train.x, train.y, train.subject)

# read test data
test.x <- read.table(file = "UCI HAR Dataset//test//X_test.txt", header = FALSE, sep = "")
test.y <- read.table(file = "UCI HAR Dataset/test//y_test.txt", header = FALSE)
test.subject <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test.combined <- cbind(test.x, test.y, test.subject)

# combine train and test data
data.combined <- rbind(train.combined, test.combined)


## 2 Extract only the measurements on the mean and standard deviation for each measurement

# read feature labels
feature_labels <- read.table(file = "UCI HAR Dataset//features.txt", header = FALSE, sep = " ")

# set names
names(data.combined) <- c(as.character(feature_labels$V2), 'activity_label', 'subject')

labels.mean <- as.character(feature_labels[grep("mean\\(", feature_labels$V2, perl=T),2])
labels.sd <- as.character(feature_labels[grep("std\\(", feature_labels$V2, perl=T),2])

data.reduced <- data.combined[,c(labels.mean, labels.sd, 'activity_label', 'subject')]


## 3 Use descriptive activity names to name the activities in the data set

# read activity labels
activity_labels <- read.table(file = "UCI HAR Dataset//activity_labels.txt", header = FALSE, sep = " ")

# set descriptive activity name
data.reduced$activity_label <- activity_labels[data.reduced$activity_label,]$V2

# 4 Appropriately label the data set with descriptive variable names
# done in step 2 - set names

# 5 From the data set in step 4, create a second, independent tidy data set
#   with the average of each variable for each activity and each subject.
library(plyr)

# create final dataset grouped by activity_label and subject with mean (average) for each column
data.final <- ddply(data.reduced, .(activity_label, subject), colwise(mean))

# save in text file for upload to Coursera
write.table(x = data.final, file = 'tidy_dataset.txt', row.names=FALSE)
