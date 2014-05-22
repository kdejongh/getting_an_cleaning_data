# Code Book
## Goal
The R script called run_analysis.R does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Data
The original data set is found in the subdirectory named 'UCI HAR Dataset' or can be downloaded from 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
A complete description of the data set can be found 
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) or in the files:

* 'UCI HAR Dataset/README.txt'
* 'UCI HAR Dataset/features_info.txt'
* 'UCI HAR Dataset/features.txt'
* 'UCI HAR Dataset/activity_labels.txt'

## Workflow
### Load and merge data
First the script loads the common data, i.e.

* 'activityLabels': the list of activity labels ('UCI HAR Dataset/activity_labels.txt')
* 'features': the names of the measured variables ('UCI HAR Dataset/features.txt'). 

There are 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 561 variables.

Second the test and training data files are loaded and merged. Each set consists of 3 files that are found in the subdirectories 'test' and 'train':

* 'subject_test.txt'|'subject_train.txt': the ids (range 1-30) of the subjects (30 volunteers within an age bracket of 19-48 years)
* 'x_test.txt'|'x_train.txt': the data, i.e. the 561 measurements for each subject and activity
* 'y_test.txt'|'y_train.txt': the ids for the activities that were measured (range 1-6)

Each file has 2947 observations.

The merge is done by appending the rows of the subjects, measurements and activities for test and training data and creating a new data frame with the results, e.g.:

    mergedDataSet <- data.frame(subject=rbind(subjectsTest, subjectsTraining), 
                                activity=rbind(yTest, yTraining), 
                                rbind(xTest, xTraining))
    
The column names of the data frame are set to the feature names loaded from 'UCI HAR Dataset/features.txt'.

    colnames(mergedDataSet) <- c("subject", "activity", as.character(features$name))

### Extract and clean relevant data
Once the data is loaded and merged, the values for the mean and standard deviation measurements need to be extracted. 
The feature names follow a naming convention, so the requested fearures can be recognized by the following name syntax:

* [feature]-mean() or
* [feature]-mean()-X or
* [feature]-mean()-Y or
* [feature]-mean()-Z or
* [feature]-std() or
* [feature]-std()-X or
* [feature]-std()-Y or
* [feature]-std()-Z

A regular expression is used to find the requested features and a subset of the merged data set containing the requested features is created:

    selectedFeatures <- subset(as.character(features$name), 
                               !is.na(str_match(features$name, "-(mean|std)\\(\\)(-[XYZ])?$")[,1]))
    selectedDataSet <- mergedDataSet[c("subject", "activity", selectedFeatures)]

The column names of that subset are prettier versions of the original feature names, i.e.:

* "()" is" removed
* '-' is replaced by '_'
* "BodyBody"" is replaced by "Body"

Finally the activity values are replaced by their label name, retrieved from the loaded activity labels, the id is used as row index in order to retrieve the corresponding label name:

    selectedDataSet["activity"] = lapply(selectedDataSet["activity"], 
                                         function(id) { activityLabels[id, "name"] })

### Reshape data
The data set containing the measurements for mean and standard deviation is melted and casted to retrieve the everage value. 
The ids are the subject and activity, all the other measurements are the variables. The melted data set is then casted for subject and activity using 'mean' as aggregation function:

    dcast(meltedDataSet, subject+activity~variable, mean)

### Save data
Finally the tidy data set is written as a table to a file called 'tidy-dataset.txt'. To load it back in R, simply use:

    read.table("tidy-dataset.txt")

