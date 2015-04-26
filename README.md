# Getting-CleaningData-Project
This repository contains R code that accomplishes the tasks given in the "Getting and Cleaning Data Course Project"

Getting and Cleaning Data Course Project - original course assignment:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following. Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Good luck!

Source: https://class.coursera.org/getdata-006/human_grading/index
R script run_analysis.R abstract:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	Source: https://class.coursera.org/getdata-006/human_grading/index
	R script run_analysis.R details:

Preparation

Function: DownloadData.set(url)

Check if folder "data" exists in working directory, or create it. Download and extract the zip file containing the dataset FUCI HAR Dataset.zip into folder "data"

1. Loading and Merging the test sets

Loaded all the test and training files.Then followed the following steps to load the data and name the variables as per the features.txt
	Merging x-data of the test and train
	Renaming the columns as per labels given in the features.txt
	Merging the subject data of the test and train&& Merging Activity data of test&train
	Merging both subject and activity data and labelling the columns as Subject and Activity
	Merging all the data with the labelling as per features.txt	

2. Variable Selection

In this only data of mean() and Std() were extracted.#Please note that data of meanfreq() was not considered.
grep was used to extraxt the columns.

3. Use Descriptive activity names 
Activity names was assigned as per Activity lables using as.character function


4. Label the data set with descriptive variable names
The labelling was done in Step-1. 
Altered the variable names with the use of gsub() function. For better readability and the author choose to make following replacements (following the Rguide):

substitute "-" with "."
remove "()"
convert upper to lower case


5. Creating the tidy data set

Used dplyr to create the tidy data set.

Completion

Write global DF tidy_df into the file tidydata.txt using capture.output function.

