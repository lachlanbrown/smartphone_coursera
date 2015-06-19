## ReadMe file for Lachlan Brown's project submission: Getting and Cleaning Data

### This repo includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': describes the variables, the data, and any transformations or work that was performed to clean up the data

- 'run_analysis.R': R code for this project

=========================================
The goal of this project is to download the raw data from disparate files from this research project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and use a single R script to combine and transform subsets of the data into a single "tidy data set"

Prior to running the above mentioned code, download the raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, and unzip into a new directory called "/smartphone_project/" that lives in your R/RStudio working directory. The code will handle all operations starting from reading the necessary files into R, through creating the specified tidy data set in your R global environment. It does NOT automatically export from R into another format (e.g. .txt). 

The final, tidy data set should only contain data for mean and standard deviation (std) measurements of data from the project, suummarized by research subject (person) and activity type (sitting, walking, etc.) More details on the variables & activities can be found in the code book.

