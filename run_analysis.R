## FROM COURSE WEBSITE
## You should create one R script called run_analysis.R that does the following:
##      1. Merges the training and the test sets to create one data set.
##      2. Extracts only the measurements on the mean and standard deviation for each measurement.
##      3. Uses descriptive activity names to name the activities in the data set
##      4. Appropriately labels the data set with descriptive variable names.
##      5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("C:/Users/SAR/Documents/Getting and Cleaning Data/Course Project/")
library(reshape)
library(reshape2)
library(dplyr)

## Get activity labels to substitute in once
## training and test sets have been combined
act_labels <- read.table("./activity_labels.txt")

## which features to pull in?
## only those with MEAN or STD in them
features <- read.table("./features.txt", stringsAsFactors = FALSE)
filt_features <- filter(features, grepl("mean", V2, ignore.case = TRUE) == TRUE | grepl("std", V2, ignore.case = TRUE)== TRUE)

## note - these will serve as better column labels than V1, V2, etc.
## but read as they are, they are still not intuitive to the user

## first get the training set
## read in the subjects and the X, Y data

subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
x_train <- read.table("./train/x_train.txt")

## now same deal for test data
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
x_test <- read.table("./test/x_test.txt")

## combine the two datasets
subject_all <- rbind(subject_train, subject_test)
y_all <- rbind(y_train, y_test)
x_all <- rbind(x_train, x_test)

## put Subject and Y together
combined_all_orig <- cbind(subject_all, y_all)

## now suck out the right measurements
## assume observations are arranged correctly
## to line up with subject and activity
## indices are provided by the features.txt file

for (i in filt_features$V1)
{
  new_col <- paste0("V", i)
  combined_all_orig <- cbind(combined_all_orig, x_all[[new_col]])

}

## Let's work on cleaning up the names of the filtered features
## Grab the second column

cleannames <- filt_features[,2]

## Now, a series of transformations to get these into better shape
cleannames <- gsub("BodyBody", "Body", cleannames)
cleannames <- gsub("[[:punct:]]", "", cleannames)

##cleannames <- gsub("-", "", cleannames)
##cleannames <- gsub(",", "", cleannames)

cleannames <- gsub("Jerk", ".Jerk", cleannames)
cleannames <- gsub("Freq", ".Freq", cleannames)

cleannames <- gsub("mag", ".mag", cleannames)
cleannames <- gsub("Mag", ".Mag", cleannames)

cleannames <- gsub("mean", ".mean", cleannames)
cleannames <- gsub("Mean", ".Mean", cleannames)
cleannames <- gsub("gravity", ".gravity", cleannames)
cleannames <- gsub("Gravity", ".Gravity", cleannames)


cleannames <- gsub("std", ".std", cleannames)
cleannames <- gsub("Body", ".Body", cleannames)
cleannames <- gsub("Gyro", ".Gyro", cleannames)
cleannames <- gsub("Acc", ".Acc", cleannames)
cleannames <- gsub("X", ".X", cleannames)
cleannames <- gsub("Y", ".Y", cleannames)
cleannames <- gsub("Z", ".Z", cleannames)

cleannames <- gsub("anglet", "angle.t", cleannames)
##cleannames <- gsub("t.", "time.", cleannames)
##cleannames <- gsub("f.", "fft.", cleannames)

## Attach the set of cleaned-up names as a
## third column to filt_features, and as a check
## send it out to a CSV file for viewing

filt_features <- cbind(filt_features, cleannames)
names(filt_features) <- c("MeasNum", "OrigName", "CleanName")
write.csv(filt_features, "./filt_features.csv")


## Now assign column names...
## Sort by subject and activity
## Put in the descriptive names

names(combined_all_orig) <- c("Subject", "ActNum", cleannames)

combined_all <- arrange(combined_all_orig, Subject, ActNum)
combined_all <- mutate(combined_all, Activity = act_labels[ActNum, 2])
numcols <- ncol(combined_all)

## When we bring in Activity as the 2nd column,
## ActNum will become the 3rd - but we don't want it!
combined_all <- combined_all[c(1, numcols, 4:numcols - 1)]

## before melting it, can we get the means?

tidy_wide <- combined_all %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))

## Now melt the data
tidy_narrow <- melt(tidy_wide, id = c("Subject", "Activity"), measure.vars = cleannames)
tidy_narrow <- arrange(tidy_narrow, Subject, Activity)
names(tidy_narrow)[3] <- "Measurement"

## Write both these data sets to files now...
write.csv(combined_all, "./combined_all.csv")
write.csv(tidy_wide, "./tidy_wide.csv")
write.csv(tidy_narrow, "./tidy_narrow.csv")
