# TidyData
# Introduction

This is the README file that accompanies my run_analysis.R script for the Getting and Cleaning Data course on Coursera.

# Purpose

The purpose of the run_analysis.R script is to:

1. Download the UCI HAR Dataset
2. Read in the various sub-datasets
3. Merge the sub-datasets according to variable
4. Perform various operations and transformations on the data
5. Create a final transformed dataset with required values
6. Write the transformed dataset to a new file for submission

# Dataset Characteristics

The data provided is the UCI HAR Dataset. The dataset contains various measurement from 30 subjects performing various activities and the accompaning 3-dimensional movement data (speed, acceleration, etc.). This data was recorded from the accelerometers and gyroscopes from the subjects' smartphones.

# Dataset transformations
The datasets were split into two general parts, test and train. Each subset contained a portion of the subjects' data recordings. Within each subset, the data was further broken up into 3 datasets containing, individually, the subject's ID number, which activity was being performed, and the various measurements recorded by the subjects' smartphones.

The first transformation was to merge the datasets together - first within each general subset, then finally combining the subsets together. This was done in this order to maintain row integrity and keep the measurements correctly matched to the activity and the subject who performed it.

The next transformation was to extract all of the measurements' recorded means and standard deviations. Attention was paid to make sure that variable names containing either "mean" or "Mean" were extracted.

The next transformation was to replace the coded activity numbers with their corresponding text description. See the Codebook for further elaboration.

The final transformation was to calculate the average means and standard deviations for each activity by subject. Since each subject performed each of the 6 activities multiple times, we are left with one average mean or standard deviation per activity per subject for a total of 180 observations (30 subjects by 6 activities).

# Additional Information

The codebook contains a more detailed description of the variables used during this analysis.
