---
title: "CodeBook"
author: "John Poplett"
date: "January 23, 2015"
output: html_document
---

# Study design
The data for the course project comes from the UCI machine learning repository and is self-contained in a zip file. The data in the zip file constitutes the raw data. The data is located here (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

# Code book

Information on the format of the column label naming conventions used by the raw data is provided in the document features_info.txt. The values of features are normalized on a scale of -1 to 1 and are
therefor "unitless".

The values in our dataset is derived from the raw data and is a subset thereof. It consists of those 79 values that represent the mean or standard deviation of samples taken in a sample window.

The values in the dataset derive from raw measurements taken from the accelerometer and gyroscope on a smart phone device (Samsung S2) and from synthetic values created from the raw measurements. For example, the accelerometer data is broken out into two measurements a measurement for acceleration and a separate measurement for gravity. These are represented respectively in the variable names as "body" and "gravity". Each measurement is labeled by subject and activity and each observation has a column each to identify the subject and the activity.

The activities are represented as a factor and have one of the following values:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Video recordings were made to label the data with the relevant activity.

The value names conform to a strict pattern that uses a consistent set of subnames so that it possible to decode the meaning of any measurement from its subnames.

For example, each measurement either belongs to the frequency or time domain and is prefixed accordingly with `time.domain` or `frequency.domain`. Each variable specifies its direction in "X","Y" "Z" coordinates or indicates a magnitude ("magnitude").

The Fourier signals are for 128 samples at 50 Hz.
