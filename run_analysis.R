# Peer graded assignment Week 4:
# Sandesh Pulijala
# load packages
library(dplyr)
library(reshape2)

###################################################################################################
#0. read different data files

path <- "UCI HAR Dataset/"
# read activity names and features
activity.list <- read.table(paste0(path,"activity_labels.txt"))
features.list <- read.table(paste0(path,"features.txt"))
# read labels
train.label <- read.table(paste0(path,"train/Y_train.txt"))
test.label <- read.table(paste0(path,"test/Y_test.txt"))
# read subjects
train.subject <- read.table(paste0(path,"train/subject_train.txt"))
test.subject <- read.table(paste0(path,"test/subject_test.txt"))
# read data
train <- read.table(paste0(path,"train/X_train.txt"))
test <- read.table(paste0(path,"test/X_test.txt"))

###################################################################################################
#1. Merges the training and the test sets to create one data set.

# merge data tables vertically
data <- rbind(train,test)
label <- rbind(train.label, test.label)
subject <- rbind(train.subject, test.subject)

###################################################################################################
#2. Extracts only the measurements on the mean and standard deviation for each measurement.

# select mean and standard deviation
meanstd <- grep("[Mm]ean|std",features.list$V2)
data <- select(data,meanstd)
features.list <- features.list[meanstd,]

###################################################################################################
#3. Uses descriptive activity names to name the activities in the data set

# convert labels to descriptive names of activity
label <- mutate(label,activity = "")
for (i in 1:6) {label$activity[which(label$V1 == i)] = as.character(activity.list$V2[i])}

###################################################################################################
#4. Appropriately labels the data set with descriptive variable names.

# rename variable names
colnames(data) <- as.character(features.list[[2]])

# add descriptive names of activity labels as first column to data set
data <- cbind(activity = label$activity, data)

# add subject id as column to data set
data <- cbind(subject = subject$V1, data)

###################################################################################################
#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

# reshape data set to tidy data
tidy.data <- melt(data,id = c("subject","activity"), measure.vars = as.character(features.list[[2]]))

# average for each subject and activity
mean.tidy.data <- dcast(tidy.data, subject + activity ~ variable, mean)

# write mean tidy data
write.table(mean.tidy.data,file="mean.tidy.data.txt",row.names=FALSE)


