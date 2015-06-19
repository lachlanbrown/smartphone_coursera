
## Getting Cleaning Data Project Assignment
## 1. You should create one R script called run_analysis.R that does the following. 
## 2. Merges the training and the test sets to create one data set.

## load the x_ files into R:

x_train <- read.table("smartphone_project/train/X_train.txt",
                      colClasses = "numeric",
                      nrows = 7352) ## specifying column classes and # of rows to read speeds this considerably
x_test <- read.table("smartphone_project/test/X_test.txt",
                      colClasses = "numeric",
                      nrows = 2947) ## specifying column classes and # of rows to read speeds this considerably

## load the y_ files into R:

y_train <- read.table("smartphone_project/train/y_train.txt",
                      col.names = "activity_code",
                      colClasses = "numeric",
                      nrows = 7352) 
y_test <- read.table("smartphone_project/test/y_test.txt",
                     col.names = "activity_code",
                     colClasses = "numeric",
                     nrows = 2947) 

## load the subject_ files into R:

subject_train <- read.table("smartphone_project/train/subject_train.txt",
                      col.names = "subject_code",
                      colClasses = "numeric",
                      nrows = 7352) 
subject_test <- read.table("smartphone_project/test/subject_test.txt",
                    col.names = "subject_code",
                     colClasses = "numeric",
                     nrows = 2947) 

## add subject and activity rows to test and train data sets using dplyr functions
library(dplyr)
train_activity = bind_cols(x_train, y_train) ## adds activity code column to X data sets
test_activity = bind_cols(x_test, y_test)
train_full = bind_cols(train_activity, subject_train) ## adds subject code column to X (+activity) data sets
test_full = bind_cols(test_activity, subject_test)

## merge train_full and test_full

all_full = bind_rows(train_full, test_full) ## this works b/c train_full and test_full have identical # & names of columns

## 3. Extracts only the measurements on the mean and standard deviation for each measurement. 

colsToKeep <- c(1:6,41:46,81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228,  240, 241, 253, 254, 266:271,  345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543, 562, 563)

## above vector represents row #s in the file features.txt, including only those variables with 'mean' or 'std'
## after the variable name, e.g. tBodyAcc-mean()-X or tBodyAcc-std()-X, but not other variations like meanFreq 
## e.g. fBodyAcc-meanFreq()-X, or any of the derived 'angle' variables, e.g. angle(tBodyAccMean,gravity)

mean_std_extract <- all_full[, colsToKeep]
## creates new smaller data frame with only above-described mean and std variables

## 4. Uses descriptive activity names to name the activities in the data set

mean_std_extract$activity_code <- as.character(mean_std_extract$activity_code)
mean_std_extract$activity_code[mean_std_extract$activity_code == "1"] <- "WALKING"
mean_std_extract$activity_code[mean_std_extract$activity_code == "2"] <- "WALKING_UPSTAIRS"
mean_std_extract$activity_code[mean_std_extract$activity_code == "3"] <- "WALKING_DOWNSTAIRS"
mean_std_extract$activity_code[mean_std_extract$activity_code == "4"] <- "SITTING"
mean_std_extract$activity_code[mean_std_extract$activity_code == "5"] <- "STANDING"
mean_std_extract$activity_code[mean_std_extract$activity_code == "6"] <- "LAYING"
## renames activity names from integer code to character in same column 'activity_code'

## 5. Appropriately labels the data set with descriptive variable names. 

mean_std_extract = rename(mean_std_extract, Mean_BodyAccelerationSignal_X_time= V1)
mean_std_extract = rename(mean_std_extract, Mean_BodyAccelerationSignal_Y_time= V2)
mean_std_extract = rename(mean_std_extract, Mean_BodyAccelerationSignal_Z_time= V3)
mean_std_extract = rename(mean_std_extract, Std_BodyAccelerationSignal_X_time= V4)
mean_std_extract = rename(mean_std_extract, Std_BodyAccelerationSignal_Y_time= V5)
mean_std_extract = rename(mean_std_extract, Std_BodyAccelerationSignal_Z_time= V6)
mean_std_extract = rename(mean_std_extract, Mean_GravityAccelerationSignal_X_time= V41)
mean_std_extract = rename(mean_std_extract, Mean_GravityAccelerationSignal_Y_time= V42)
mean_std_extract = rename(mean_std_extract, Mean_GravityAccelerationSignal_Z_time= V43)
mean_std_extract = rename(mean_std_extract, Std_GravityAccelerationSignal_X_time= V44)
mean_std_extract = rename(mean_std_extract, Std_GravityAccelerationSignal_Y_time= V45)
mean_std_extract = rename(mean_std_extract, Std_GravityAccelerationSignal_Z_time= V46)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationAngularVelocity_X_time= V81)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationAngularVelocity_Y_time= V82)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationAngularVelocity_Z_time= V83)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationAngularVelocity_X_time= V84)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationAngularVelocity_Y_time= V85)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationAngularVelocity_Z_time= V86)
mean_std_extract = rename(mean_std_extract, Mean_BodyGyroscopeSignal_X_time= V121)
mean_std_extract = rename(mean_std_extract, Mean_BodyGyroscopeSignal_Y_time= V122)
mean_std_extract = rename(mean_std_extract, Mean_BodyGyroscopeSignal_Z_time= V123)
mean_std_extract = rename(mean_std_extract, Std_BodyGyroscopeSignal_X_time= V124)
mean_std_extract = rename(mean_std_extract, Std_BodyGyroscopeSignal_Y_time= V125)
mean_std_extract = rename(mean_std_extract, Std_BodyGyroscopeSignal_Z_time= V126)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationGyroAngularVelocity_X_time= V161)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationGyroAngularVelocity_Y_time= V162)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationGyroAngularVelocity_Z_time= V163)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationGyroAngularVelocity_X_time= V164)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationGyroAngularVelocity_Y_time= V165)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationGyroAngularVelocity_Z_time= V166)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofBodyAcceleration_time= V201)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofBodyAcceleration_time= V202)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofGravityAcceleration_time= V214)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofGravityAcceleration_time= V215)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofAccelerationJerkDerivation_time= V227)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofAccelerationJerkDerivation_time= V228)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofBodyGyroSignal_time= V240)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofBodyGyroSignal_time= V241)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofGyroJerkDerivation_time= V253)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofGyroJerkDerivation_time= V254)
mean_std_extract = rename(mean_std_extract, Mean_BodyAccelerationSignal_X_frequency= V266)
mean_std_extract = rename(mean_std_extract, Mean_BodyAccelerationSignal_Y_frequency= V267)
mean_std_extract = rename(mean_std_extract, Mean_BodyAccelerationSignal_Z_frequency= V268)
mean_std_extract = rename(mean_std_extract, Std_BodyAccelerationSignal_X_frequency= V269)
mean_std_extract = rename(mean_std_extract, Std_BodyAccelerationSignal_Y_frequency= V270)
mean_std_extract = rename(mean_std_extract, Std_BodyAccelerationSignal_Z_frequency= V271)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationAngularVelocity_X_frequency= V345)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationAngularVelocity_Y_frequency= V346)
mean_std_extract = rename(mean_std_extract, Mean_BodyLinearAccelerationAngularVelocity_Z_frequency= V347)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationAngularVelocity_X_frequency= V348)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationAngularVelocity_Y_frequency= V349)
mean_std_extract = rename(mean_std_extract, Std_BodyLinearAccelerationAngularVelocity_Z_frequency= V350)
mean_std_extract = rename(mean_std_extract, Mean_BodyGyroscopeSignal_X_frequency= V424)
mean_std_extract = rename(mean_std_extract, Mean_BodyGyroscopeSignal_Y_frequency= V425)
mean_std_extract = rename(mean_std_extract, Mean_BodyGyroscopeSignal_Z_frequency= V426)
mean_std_extract = rename(mean_std_extract, Std_BodyGyroscopeSignal_X_frequency= V427)
mean_std_extract = rename(mean_std_extract, Std_BodyGyroscopeSignal_Y_frequency= V428)
mean_std_extract = rename(mean_std_extract, Std_BodyGyroscopeSignal_Z_frequency= V429)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofBodyAcceleration_frequency= V503)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofBodyAcceleration_frequency= V504)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofAccelerationJerkDerivation_frequency= V516)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofAccelerationJerkDerivation_frequency= V517)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofBodyGyroSignal_frequency= V529)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofBodyGyroSignal_frequency= V530)
mean_std_extract = rename(mean_std_extract, Mean_MagnitudeofGyroJerkDerivation_frequency= V542)
mean_std_extract = rename(mean_std_extract, Std_MagnitudeofGyroJerkDerivation_frequency= V543)
## renames variable column names to include a) summary measurement, b)description, c) X,Y,Z if appliicable
## used Excel concatenate formula to generate above and saved file in case mods needed

## 6. From the data set in step 4, creates a second, independent tidy data set with the average 
##  of each variable for each activity and each subject.

mean_std_extract$activity_subject = paste(mean_std_extract$activity_code, mean_std_extract$subject_code, sep = "_" )
## concatenate activity and subject code into single column, result is 180 rows (6 activities X 30 subjects)

library(reshape2)
measure_vars = as.character(names(mean_std_extract[, 1:66]))
meanMelt = melt(mean_std_extract, id="activity_subject", measure.vars=measure_vars)
meanData = dcast(meanMelt, activity_subject ~ variable, mean) 

## this creates a wide data frame with the first column unique combinations of 
## subject & activity, and the subsequent 66 columns the average values of the variables
