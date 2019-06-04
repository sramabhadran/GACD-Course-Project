# Getting and Cleaning Data Course Project - Sanjeev Ramabhadran

## Background and Objectives

The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for this project were collected by the accelerometers of the Samsung Galaxy S smartphone as part the [Human Activity Recognition Using SmartPhones]( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) effort. Companies involved in this effort such as Fitbit, Nike, and Jawbone Up are racing to develop advanced algorithms to attract new users.

Project objectives include collecting/working with/cleaning the data set, and using it to prepare a tidy data set that can be used for later analysis.

## The Data

Various measurements were taken for 30 unique users performing 6 different activities, namely:
- WALKING
- WALKING UPSTAIRS 
- WALKING DOWNSTAIRS 
- SITTING
- STANDING
- LAYING

## Overview of Script

The analysis is done through a single R script, "run_analysis.R", as follows:
- The script first reads in and filters through the "features_info.txt" file to identify the measurements labeled "mean" or "std" (86 out of the original 561). 
- It then processes the measurement variable names to make them more readable (e.g. removing punctuation and other characters and adding a period as a separatoe), and writes the filtered set of features (labeled "filt_features") into a CSV file for later reference.
- The script then reads in and combines the Subject and X, Y data for the training and test data sets.
- After putting the Subject and Y data side-by-side, it then uses the filtered set of measurements to extract the relevant X data columns and add them to the combined data set (labeled "combined_all").
- The activity numbers are replaced with actual Activity Names (from the file activity_labels.txt), and the processed measurement variable names are used to name the X columns of the combined data set.
- From here, two data sets labeled "tidy_wide" and "tidy_narrow" are created. In the first, each row is a unique combination of subject and activity and all corresponding measurements that are labeled mean or std. In the second, each row is a unique combination of subject, activity, and measurement.
- The combined data set and the two subsequent data sets are written to CSV files for reference.