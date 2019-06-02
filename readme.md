---
title: "ReadMe"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

The script "run_analysis.R" first reads in and filters through the features_info.txt file to identify the measurements labeled "mean" or "std" (86 out of the original 561). It then processes the measurement variable names to make them more readable, and writes the filtered set of features (labeled "filt_features") into a CSV file for later reference.

The script then reads in and combines the Subject and X, Y data for the training and test data sets. After putting the Subject and Y data side-by-side, it then uses the filtered set of measurements to extract the relevant X data columns and add them to the combined data set (labeled "combined_all"). The activity numbers are replaced with actual Activity Names (from the file activity_labels.txt), and the processed measurement variable names are used to name the X columns of the combined data set.

From here, two data sets labeled "tidy_wide" and "tidy_narrow" are created. In the first, each row is a unique combination of subject and activity and all corresponding measurements that are labeled mean or std. In the second, each row is a unique combination of subject, activity, and measurement.

The combined data set and the two subsequent data sets are written to CSV files for reference.