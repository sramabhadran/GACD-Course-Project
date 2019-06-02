---
title: "codebook.md"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Codebook for tidy_narrow data Set

SUBJECT
      1...30                  .Unique subject ID 

ACTIVITY
    Activity performed by each subject
      WALKING                 .All as shown
      WALKING_UPSTAIRS
      WALKING_DOWNSTAIRS
      SITTING
      STANDING
      LAYING

MEASUREMENT
    Type of measurement (time or frequency based from accelerometer or gyroscope)
      t.Body.Acc.mean.X       .All as shown
      t.Body.Acc.mean.Y
      t.Body.Acc.mean.Z
      t.Body.Acc.std.X
      t.Body.Acc.std.Y
      t.Body.Acc.std.Z
      t.Gravity.Acc.mean.X
      t.Gravity.Acc.mean.Y
      t.Gravity.Acc.mean.Z
      t.Gravity.Acc.std.X
      t.Gravity.Acc.std.Y
      t.Gravity.Acc.std.Z
      t.Body.Acc.Jerk.mean.X
      t.Body.Acc.Jerk.mean.Y
      t.Body.Acc.Jerk.mean.Z
      t.Body.Acc.Jerk.std.X
      t.Body.Acc.Jerk.std.Y
      t.Body.Acc.Jerk.std.Z
      t.Body.Gyro.mean.X
      t.Body.Gyro.mean.Y
      t.Body.Gyro.mean.Z
      t.Body.Gyro.std.X
      t.Body.Gyro.std.Y
      t.Body.Gyro.std.Z
      t.Body.Gyro.Jerk.mean.X
      t.Body.Gyro.Jerk.mean.Y
      t.Body.Gyro.Jerk.mean.Z
      t.Body.Gyro.Jerk.std.X
      t.Body.Gyro.Jerk.std.Y
      t.Body.Gyro.Jerk.std.Z
      t.Body.Acc.Mag.mean
      t.Body.Acc.Mag.std
      t.Gravity.Acc.Mag.mean
      t.Gravity.Acc.Mag.std
      t.Body.Acc.Jerk.Mag.mean
      t.Body.Acc.Jerk.Mag.std
      t.Body.Gyro.Mag.mean
      t.Body.Gyro.Mag.std
      t.Body.Gyro.Jerk.Mag.mean
      t.Body.Gyro.Jerk.Mag.std
      f.Body.Acc.mean.X
      f.Body.Acc.mean.Y
      f.Body.Acc.mean.Z
      f.Body.Acc.std.X
      f.Body.Acc.std.Y
      f.Body.Acc.std.Z
      f.Body.Acc.mean.Freq.X
      f.Body.Acc.mean.Freq.Y
      f.Body.Acc.mean.Freq.Z
      f.Body.Acc.Jerk.mean.X
      f.Body.Acc.Jerk.mean.Y
      f.Body.Acc.Jerk.mean.Z
      f.Body.Acc.Jerk.std.X
      f.Body.Acc.Jerk.std.Y
      f.Body.Acc.Jerk.std.Z
      f.Body.Acc.Jerk.mean.Freq.X
      f.Body.Acc.Jerk.mean.Freq.Y
      f.Body.Acc.Jerk.mean.Freq.Z
      f.Body.Gyro.mean.X
      f.Body.Gyro.mean.Y
      f.Body.Gyro.mean.Z
      f.Body.Gyro.std.X
      f.Body.Gyro.std.Y
      f.Body.Gyro.std.Z
      f.Body.Gyro.mean.Freq.X
      f.Body.Gyro.mean.Freq.Y
      f.Body.Gyro.mean.Freq.Z
      f.Body.Acc.Mag.mean
      f.Body.Acc.Mag.std
      f.Body.Acc.Mag.mean.Freq
      f.Body.Acc.Jerk.Mag.mean
      f.Body.Acc.Jerk.Mag.std
      f.Body.Acc.Jerk.Mag.mean.Freq
      f.Body.Gyro.Mag.mean
      f.Body.Gyro.Mag.std
      f.Body.Gyro.Mag.mean.Freq
      f.Body.Gyro.Jerk.Mag.mean
      f.Body.Gyro.Jerk.Mag.std
      f.Body.Gyro.Jerk.Mag.mean.Freq
      angle.t.Body.Acc.Mean.gravity
      angle.t.Body.Acc.Jerk.Mean.gravity.Mean
      angle.t.Body.Gyro.Mean.gravity.Mean
      angle.t.Body.Gyro.Jerk.Mean.gravity.Mean
      angle.X.gravity.Mean
      angle.Y.gravity.Mean
      angle.Z.gravity.Mean

VALUE
    Mean normalized value of indicated measurement
      Between -1 amd 1