# Getting and Cleaning Data
Course project for the Getting and Cleaning Data course in the John Hopkin's Data Science Specialization.

This project is an exercise in the course topic and provides students of the course
with practice in cleaning data. As stated on the course website,

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The project has a number of requirements for cleaning and tidying the data that comes from a UCI study on physical activities measured and tracked with the aid of smart phones carried by test subjects. These cleaning and tidying requirements include:

Creating a single R script, run_analysis.R, that performs the following:

* merges training and test sets from the UCI study
* extracts only the measurements for the mean and standard deviation of each measurement
* provides descriptive names for the activities studied in the study
* create an independent, tidy data set with the average of each variable for each activity and each subject

The run_Analysis.R script does not download the required data files. The steps required to retrieve the data and run the run_Analysis.R script are detailed below.

## Setup

The script presupposes the existence of the UCI test and training files in relative locations to the
script, i.e. the run_analysis.R script is executed in the base UCI directory which also contains the train and test folders. The UCI files can be unzipped directly into the repo location without collision.

Step-by-step directions are:

1. Clone the repo into a local subdirectory with the command `git clone https://github.com/John-Poplett/gettingandcleaningdata.git`
1. Change into the directory of the new repo (e.g. `cd gettingandcleaningdata`)
1. Download the dataset from this [location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (e.g. `curl https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip -o Dataset.zip`)
1. Unzip it into the current directory using a command of the form `unzip <path-to-dataset>/Dataset.zip` (e.g. `unzip ./Dataset.zip`)
    
# Execution

To run the script you can source it in R from your operating system shell as follows.

1. Change directories to the UCI base directory (e.g. `cd UCI\ HAR\ Dataset`)
1. Launch R.
1. Then, at the R command prompt, "source" the run_Analysis.R script (e.g. `source("../run_analysis.R")`).

Once the script is executed, it will produce the output file "tds.txt" with the contents of the
tidied data.

# Viewing the output
You can then view this file with the following command.

`View(read.table("tds.txt", header = TRUE))`

