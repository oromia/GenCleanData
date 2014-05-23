Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and any transformations or work performed to clean up the data.  
* Data was obtained from:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* The run_analysis.R script performs the following:   
  1. Read X_train.txt, y_train.txt and subject_train.txt from source data store them as 'training.x', 'training.y' and
     'training.subject' variables.       
  2. Read X_test.txt, y_test.txt and subject_test.txt from source data and store them as 'test.x', 'test.y' and
     'test.subject' variables.       
  3. Merge training.x and training.x and save as 'merged.x'
  4. Merge training.y and training.y and save as 'merged.y'
  5. Merge training.subject and training.subject and save as 'merged.subject'
  6. Read 'features.txt' file from source data, save as 'features' and only extract the measurements on the mean and standard
     deviation. 
  7. Clean the column names of the subset by removing "()" and "-" symbols in names.
  8. Read 'activity_labels.txt' file from source data and save as 'activity' variable.
  9. Clean the activity names in 'activity' table by normalizing names. 
  10. Transform values of 'merged. data according to 'activity' data.
  11. Merge 'merged.x', 'merged.y' and 'merged.subject' by column to get a new merged data frame and save to file 
      'merged_data.txt'
  12. Generate an independent tidy data set with the average of each measurement for each activity and each subject. 
  13. Write the tidy data into file 'merged_tidy_data.txt'.
  
 
© Beya Adamu 2014 All Rights reserved.