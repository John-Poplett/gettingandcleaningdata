#
# This script is part of the course project for
# Getting and Cleaning Data, a course in John
# Hopkin's Data Science course series.
#
# The following instructions are repeated from the course project's web page:
#
# You should create one R script called run_analysis.R that does the following.
#
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
library(dplyr)

X.train <- read.table("train/X_train.txt")
subject.train <- read.table("train/subject_train.txt")
y.train <- read.table("train/y_train.txt")
X.test <- read.table("test/X_test.txt")
subject.test <- read.table("test/subject_test.txt")
y.test <- read.table("test/y_test.txt")

#
# The feature names are illegal. Use gsub to convert parens
# and hyphens into R-friendly "." delimiters. Use make.names
# to catch anything else, including especially duplicate
# column names. The gsub steps are non-essential. The output
# eliminates or minimizes repeated and trailing dots.
#
# See Google's R Style Guide on identifiers.
# https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers
#
# This partially fulfills the goal of "tidy" data.
#
features <- read.table("features.txt")[,2]
features <- make.names(features, unique = TRUE)
features <- gsub("\\.+", ".", features)
features <- gsub("\\.$", "", features)

#
# Use rbind to merge, the corresponding
# tables from the train and test directories.
#
# Add column names as we go along.
#
X.data <- rbind(X.train, X.test)
names(X.data) <- features
subject.data <- rbind(subject.train, subject.test)
names(subject.data) <- "subjects"
y.data <- rbind(y.train, y.test)
names(y.data) <- "activities"

#
# Create a single dataset with cbind. This completes
# step 1 in the instructions
#
dataset <- cbind(X.data, subject.data, y.data)

#
# Read the activity labels. Conveniently, R will interpret these as factors.
# Convert the activities column from numbers to factors. This completes
# step #3 in the instructions.
#
activities <- read.table("activity_labels.txt")[,2]
dataset[,"activities"] <- factor(dataset[,"activities"], label=activities)

#
# Now, shrink down columns to mean and std columns only
# with grep. This completes step #2.
#
# Helpful suggestion located here:
#
# http://stackoverflow.com/questions/25923392/r-dplyr-select-columns-based-on-string
#
dataset <- dataset[,grepl("std|mean|subjects|activities", colnames(dataset))]

#
# Upgrade names to names that comply to the aforementioned Google R Style guide.
#
# This completes part #4.
#
compliant.names <- names(dataset)
compliant.names <- gsub("tBody", "time.domain.body.", compliant.names)
compliant.names <- gsub("tGravity", "time.domain.gravity.", compliant.names)
compliant.names <- gsub("fBody", "frequency.domain.body.", compliant.names)
compliant.names <- gsub("Acc", "accelerometer", compliant.names)
compliant.names <- gsub("Gyro", "gyroscope", compliant.names)
compliant.names <- gsub("Jerk", ".jerk", compliant.names)
compliant.names <- gsub("Mag", ".magnitude", compliant.names)
compliant.names <- gsub("Freq", ".frequency", compliant.names)
compliant.names <- gsub("body.Bodyaccelerometer", "body.accelerometer", compliant.names)
compliant.names <- gsub("body.Bodygyroscope", "body.gyroscope", compliant.names)
names(dataset) <- compliant.names

#
# Finally, create an independent tidy data set by grouping by subjects and activities and
# computing the mean for each.
#
tds <- dataset %>% group_by(subjects, activities) %>% summarise_each(funs(mean))

write.table(tds, file = "tds.txt", row.names = FALSE)


