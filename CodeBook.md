## R Code description / steps:
1. As mentioned in the README.md file, this R Code requires that the raw data has been downloaded and extracted to a sub-directory in your R working directory called "/smartphone_project". Also the code is optimized for a Windows PC, so the initial read.table commmands may require minor adjustments, e.g. from read.table("smartphone_project/train/X_train.txt") to read.table("./smartphone_project/train/X_train.txt")
2. The first step in the code (lines 8 - 35) loads the following files into separate R data frames:
  - train/X_train.txt (data file containing measurements for the train or control subjects/people)
  - test/X_test.txt (data file containing measurements for the test or... test subjects/people)
  - train/y_train.txt (data file containing the activity codes, integers from 1 - 6, corresponding with the # of rows in X_train.txt)
  - test/y_test.txt (data file containing the activity codes, integers from 1 - 6, corresponding with the # of rows in X_test.txt)
  - train/subject_train.txt (data file containing the subject codes, integers from 1 - 30, corresponding with the # of rows in X_train.txt)
  - test/subject_test.txt (data file containing the subject codes, integers from 1 - 30, corresponding with the # of rows in X_test.txt)
3. The next step (lines 38 - 42) adds columns from the subject_ and y_ data frames to the corresponding x_ data frames (binds activity and subject to the measurement data). This step and the next make use of the dyplr R package "bind_rows" and "bind_cols" functions
4. Line 46 then combines all rows of the test and train data frames into a single data frame, with all measurement data & activity/subject codes
5. Rows 50 - 56 designate which columns contain the meaurement data for mean and standard deviation, and then subsets the data frame from step 4 into a new data frame (same # of rows, but now with only 68 columns, 66 for measurements and 1 each for activity and subject code)
6. Rows 61 - 137 rename a) the activity code from an integer (1:6) to descriptive names based on the mapping in the file "activity_labels.txt", and b) each of the measurement column headers based on the mapping from "features.txt"
7. The final step (rows 144 - 150) summarizes the avg values of the mean and std measurements by activity and subject. It does this by means of the reshape2 R package, utilizing the melt() and dcast() functions. In order to create a character vector of measurements to include as the 'measure.vars' argument, row 148 subsets the data frame from step 6 by col names (1:66), whcih correspond with the measurement values. 

*** the final output of this code is an R data frame "meanData" consisting of 180 observations (6 activities X 30 subjects) and 67 variables(66 measurement means and 1 "index" column of unique activity_subject combinations)

## Variable descriptions
1. Activity labels: self-evident, e.g. WALKING, WALKING_UPSTAIRS, etc.
2. Subject codes: integers from 1 - 30, divided approximately as 70% train group, and 30% test group, broken out as follows:
  Train subject #s: 1,3,5,6,7,8,11,14,15,16,17,19,21,22,23,25,26,27,28,29,30 (21 total or 70%)
  Test subject #s: 2,4,9,10,12,13,18,20,24 (9 total or 30%)


