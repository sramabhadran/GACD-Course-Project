# Course Project "Codebook"


## Background and Objectives

The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for this project were collected by the accelerometers of the Samsung Galaxy S smartphone as part the [Human Activity Recognition Using SmartPhones]( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) effort. Companies involved in this effort such as Fitbit, Nike, and Jawbone Up are racing to develop advanced algorithms to attract new users.

Project objectives include collecting/consolidating/cleaning the data set, and using it to prepare a tidy data set that can be used for later analysis.

## Overview of Data

| Field | Values | File Location(s) | Notes |
| ----- | ----- | ----- | ----- |
| Subject | 1 to 30 | subject_train.txt, subject_test.txt |  |
| Activity | 1 to 6 | y_train.txt, y_test.txt | In the processed data set, activity number should be replaced by corresponding activity name. |
| Activity Names | WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING | activity_labels.txt | In the processed data set, activity number should be replaced by corresponding activity name. |
| Measurement Type | tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, etc. (561 in total) | features.txt, features_info.txt | All 561 measurements are explained in detail in features_info.txt |
| Measurements (Normalized Values) | -1 to 1 | x_train.txt, x_test.txt | 561 total measurements for each subject-activity pair; ultimately only those labeled "mean" or "std" are relevant for this assignment. |

## Input Files

| FILE | DESCRIPTION | DATA SET DIMENSIONS |
| ------ | ------ | ----- |
| subject_train.txt | Contains the subject info for the training data set | 7352R x 1C |
| subject_test.txt | Contains the subject info for the test data set | 2947R x 1C |
| y_train.txt | Contains the activity info for the training data set | 7352R x 1C |
| y_test.txt | Contains the activity info for the training data set | 2947R x 1C |
| x_train.txt | Contains each subject-activity pair's measurements for the training data set | 7352R x 561C |
| x_test.txt | Contains each subject-activity pair's measurements for the training data set | 2947R x 561C |

## Overview of Script
The analysis is done through a single R script, "run_analysis.R", as follows:
- The script first reads in and filters through the "features.txt" file to identify the measurements labeled "mean" or "std" (86 out of the original 561). 
- It then processes the measurement variable names to make them more readable (e.g. removing punctuation and other characters and adding a period as a separator), and writes the filtered set of features (labeled "filt_features") into a CSV file for later reference.
- The script then reads in and combines the Subject and X, Y data for the training and test data sets.
- After putting the Subject and Y data side-by-side, it then uses the filtered set of measurements to extract the relevant X data columns and add them to the combined data set (labeled "combined_all").
- The activity numbers are replaced with actual Activity Names (from the file activity_labels.txt), and the processed measurement variable names are used to name the X columns of the combined data set.
- From here, two data sets labeled "tidy_wide" and "tidy_narrow" are created. In the first, each row is a unique combination of subject and activity and all corresponding measurements that are labeled mean or std. In the second, each row is a unique combination of subject, activity, and measurement.
- The combined data set and the two subsequent data sets are written to CSV files for reference.


## Output Files

| FILE | DESCRIPTION | DATA SET DIMENSIONS |
| ------ | ------ | ----- |
| filt_features.csv | Shows both original name and "cleaned-up" name for all measurements whose description contains "mean" or "std" | 86R x 3C|
| combined_all.csv | Contains all measurements labeled "mean" or "std" for all subject-activity pairs across consolidated training/test data sets. Note activity numbers have been replaced with descriptive names. | 10299R x 88C|
| tidy_wide.csv | Contains averages, for all 180 subject-activity pairs, of relevant measurements across consolidated training/test datasets  | 180R x 88C|
| tidy_narrow.csv | A further reduction of the wide data set with each of 30 x 6 x 86 rows representing a subject-activity-variable trio | 15480R x 4C|


## Tidy Data Set - Wide

Contained in the file tidy_wide.csv

| Column Position | Column Name | Description |
| ------ | ------ | ------ |
| 1 | Subject |  |
| 2 | Activity |  |
| 3-88 | Based on 86 relevant measurements | Text labels processed for better readability. Refer to features_info.txt for further detail on measurements |  

## Tidy Data Set - Narrow

Contained in the file tidy_narrow.csv

| Column Position | Column Name | Description |
| ------ | ------ | ------ |
| 1 | Subject | |
| 2 | Activity | |
| 3 | Measurement | Text labels processed for better readability. Refer to features_info.txt for further detail on measurements |
| 4 | Value | |







    