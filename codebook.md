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

* Activity:
  + Description: Record of what each subject was doing for each observation
  + Values: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying

* Columns 3 through 88
  + Description: Average of various means and standard deviations of positional, speed, and other motion measurements
  + Values: All values normalized to be from -1 to 1; averages are bound by same conditions.