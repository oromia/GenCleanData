## 1. Merges the training and the test sets to create one data set.
#load training data
training.x <- read.table("UCI HAR Dataset/train/X_train.txt")
training.y <- read.table("UCI HAR Dataset/train/y_train.txt")
training.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
#load test data
test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Merge
merged.x <- rbind(training.x, test.x)
merged.y <- rbind(training.y, test.y)
merged.subject <- rbind(training.subject, test.subject)
# merge all data set
merged_dataset <- list(x=merged.x, y=merged.y, subject=merged.subject)
#############################################################################################


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("data/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
merged.x <- merged.x[, indices_of_good_features]
names(merged.x) <- features[indices_of_good_features, 2]
names(merged.x) <- gsub("\\(|\\)", "", names(merged.x))
names(merged.x) <- tolower(names(merged.x))
############################################################################################


## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("data/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
merged.y[,1] = activities[merged.y[,1], 2]
names(merged.y) <- "activity"
############################################################################################


## 4. Appropriately labels the data set with descriptive activity names. 
names(merged.subject) <- "subject"
cleaned <- cbind(merged.subject, merged.y, merged.x)
write.table(cleaned, "merged_data.txt")
############################################################################################


## 5. Creates a second, independent tidy data set with the average of each variable for 
##    each activity and each subject. 
uniqueSubjects = unique(merged.subject)[,1]
numSubjects = length(unique(merged.subject)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "merged_tidy_data.txt")
############################################################################################









