---
title: "codebook"
output: html_document
---

# Introduction

This codebook is used to describe the variables in the final dataset created in the run_analysis.R script for Coursera's Getting and Cleaning Data final project.

# Variables
* Subject_ID:
  + Description: Unique ID number assigned to one of 30 test subjects
  + Values: 1-30
  + Units: None

* Activity:
  + Description: Record of what each subject was doing for each observation
  + Values: Walking (1), Walking Upstairs (2), Walking Downstairs (3), Sitting (4), Standing (5), and Laying (6)
  + Units: None

* Columns 3 through 88
  + Description: Average of various means and standard deviations of positional, speed, and other motion measurements. Each subject performed each activity multiples times. There is an average value for each measurement per subject per activity for a total of 180 observations for each measurement corresponding to 30 subjects performing 6 different activities.
  + Values: All values normalized to be from -1 to 1; averages are bound by same conditions.
  + Units: Since values are normalized, all values are unitless.
  + Details: Dataset was grouped first by subject ID, then by activity. Summarise_each function was called to find the mean for each column, grouped by the groups as described so each subject has an average of the measurements for all 6 activities performed.

# Additional Information
For more detailed descriptions of the individual variables and their meanings, please see the features_info.txt file located in the UCI HAR Dataset folder.
