library(plyr)

# Set working directory
srcRootDir <- "./UCI HAR Dataset"
SEP <- ""

# Step 1:  Merge the training and test sets to create one data set
xTrain <- read.table(paste(srcRootDir, "/train/X_train.txt", sep=SEP))
xTest <- read.table(paste(srcRootDir, "/test/X_test.txt", sep=SEP))
xData <- rbind(xTrain, xTest)

yTrain <- read.table(paste(srcRootDir, "/train/y_train.txt", sep=SEP))
yTest <- read.table(paste(srcRootDir, "/test/y_test.txt", sep=SEP))
yData <- rbind(yTrain, yTest)

subjectTrain <- read.table(paste(srcRootDir, "/train/subject_train.txt", sep=SEP))
subjectTest <- read.table(paste(srcRootDir, "/test/subject_test.txt", sep=SEP))
subjectData <- rbind(subjectTrain, subjectTest)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table(paste(srcRootDir, "/features.txt", sep=SEP))

# Get 'mean' or 'std' columns
meanStdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])
# Subset and update column names
xData <- xData[, meanStdFeatures]
names(xData) <- features[meanStdFeatures, 2]

# Step 3: Use descriptive activity names to name the activities in the data set
activities <- read.table(paste(srcRootDir, "/activity_labels.txt", sep=SEP))
yData[, 1] <- activities[yData[, 1], 2]
names(yData) <- "activity"

# Step 4: Appropriately label the data set with descriptive variable names
names(subjectData) <- "subject"
mergedData <- cbind(xData, yData, subjectData)

# Step 5: Create a second, independent tidy data set with the average
# of each variable for each activity and each subject
averagesData <- ddply(mergedData, .(subject, activity), function(dt) colMeans(dt[, 1:66]))
write.table(averagesData, "tidyData.txt", row.name=FALSE)
