download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              "projectdata.zip",method="curl")
unzip("projectdata.zip")
library(plyr)

# 1. Merge the training and test sets to create one data set

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("UCI HAR Dataset/features.txt")

#get columns with mean() or std() in their names, store the indices and names(for later labeling)
features_indices <- grep("-(mean|std)\\(\\)", features[, 2])
features_names <- grep("-(mean|std)\\(\\)", features[, 2], value = TRUE)

#subset the columns
x_data <- x_data[, features_indices]

# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]

# 4. Appropriately labels the data set with descriptive variable names. 

names(x_data) <- features_names
names(y_data) <- "activity"
names(subject_data) <- "subject"

# 5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

new_data <- cbind(subject_data, y_data, x_data)
output <- ddply(new_data, .(subject, activity), function(x) colMeans(x[, 3:68]))
write.table(output, "tidy_data.txt", row.name=FALSE)


