#! /usr/bin/env RScript

# six activities (WALKING [1], WALKING_UPSTAIRS [2], WALKING_DOWNSTAIRS [3], SITTING [4], STANDING [5], LAYING [6])
#
#   For each record it is provided:
#   ======================================
#   - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
#   - Triaxial Angular velocity from the gyroscope. 
#   - A 561-feature vector with time and frequency domain variables. 
#   - Its activity label. 
#   - An identifier of the subject who carried out the experiment.
#
#   The dataset includes the following files:
#   =========================================
#   - 'README.txt'
#   - 'features_info.txt': Shows information about the variables used on the feature vector.
#   - 'features.txt': List of all features.
#   - 'activity_labels.txt': Links the class labels with their activity name.
#   - 'train/X_train.txt': Training set.
#   - 'train/y_train.txt': Training labels.
#   - 'test/X_test.txt': Test set.
#   - 'test/y_test.txt': Test labels.

library(stringr)
library(reshape2)

#setwd("~/Projects/scoyo/coursera/getdata-003/project")

## 1. Merges the training and the test sets to create one data set.

### load common data
# activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", sep=" ", col.names=c("activity_id", "name"))
features <- read.table("UCI HAR Dataset/features.txt", sep=" ", col.names=c("feature_id", "name"))
    
### load the test data set
# volunteers (1-30)
subjectsTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
# data set (561 variables)
xTest <- read.table("UCI HAR Dataset/test/x_test.txt")
# activities (1-6)
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")

### load the training data set
# volunteers (1-30)
subjectsTraining <- read.table("UCI HAR Dataset/train/subject_train.txt")
# data set (561 variables)
xTraining <- read.table("UCI HAR Dataset/train/x_train.txt")
# activities (1-6)
yTraining <- read.table("UCI HAR Dataset/train/y_train.txt")

# merge both traning sets, i.e. bind the rows of both data sets
mergedDataSet <- data.frame(subject=rbind(subjectsTest, subjectsTraining), activity=rbind(yTest, yTraining), rbind(xTest, xTraining))
# set the column names to the feature names
colnames(mergedDataSet) <- c("subject", "activity", as.character(features$name))

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# select all the measurements for mean and standard deviation, i.e. all the measurements named 
# <feature>-mean() or
# <feature>-mean()-X or
# <feature>-mean()-Y or
# <feature>-mean()-Z or
# <feature>-std() or
# <feature>-std()-X or
# <feature>-std()-Y or
# <feature>-std()-Z

selectedFeatures <- subset(as.character(features$name), !is.na(str_match(features$name, "-(mean|std)\\(\\)(-[XYZ])?$")[,1]))
# for each subject and activity select the requested measurements
selectedDataSet <- mergedDataSet[c("subject", "activity", selectedFeatures)]

## 3. Uses descriptive activity names to name the activities in the data set
selectedDataSet$activity = lapply(selectedDataSet$activity, function(id) { activityLabels[id, "name"] })

## 4. Appropriately labels the data set with descriptive activity names. 
# already DONE by setting the column names (?)
# replace "-" with "_", remove 'special' chars like "(", ")" and fix typo 'BodyBody'
colnames(selectedDataSet) <- str_replace_all(str_replace_all(str_replace_all(colnames(selectedDataSet), "\\-", "_"), "\\(\\)", ""), "BodyBody", "Body")
    
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
meltedDataSet <- melt(selectedDataSet, c("subject", "activity"))
tidyDataSet <- dcast(meltedDataSet, subject+activity~variable, mean)
print(tidyDataSet)
write.table(tidyDataSet, "tidy-dataset.txt")
