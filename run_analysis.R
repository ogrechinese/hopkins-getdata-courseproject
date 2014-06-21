# This is run_analysis.R
# Course project for the Getting Data class in John Hopkins courses 
# for Data Science Specialization on Coursera


# 1. Merges the training and the test sets to create one data set.
# Set working directory for the test data
        setwd("/Users/danielt/Dropbox/R/hopkins/getdata/courseproject/UCI HAR Dataset/test")
# Use read.table to bring in data from each table
        subject_test <- read.table("subject_test.txt")
        x_test <- read.table("X_test.txt")
        y_test <- read.table("y_test.txt")

# Set working directory for the training data
        setwd("/Users/danielt/Dropbox/R/hopkins/getdata/courseproject/UCI HAR Dataset/train")
# Use read.table to bring in data from each table
        subject_train <- read.table("subject_train.txt")
        x_train <- read.table("X_train.txt")
        y_train <- read.table("y_train.txt")

# Use cbind to combine the columns for the test and training data.
# Then use rbind to combine the rows of the test and training data.
# The final matrix should be a 10299 x 563        
        data1 <- cbind(subject_test, x_test, y_test)
        data2 <- cbind(subject_train, x_train, y_train)
        data <- rbind (data1, data2)
        data
        

        # 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
# First pull in the feature names.
        setwd("/Users/danielt/Dropbox/R/hopkins/getdata/courseproject/UCI HAR Dataset/")
# Now pull in the features file
        features <- read.table("features.txt")
# Create a loop to loop through each value
# index will store the index of features that contain a mean or s.d.
        index = integer(0)        
        for (i in 1:nrow(features)){
                temp = grepl("mean",features[i, 2]) + grepl("std", features[i, 2])
                if (temp > 0) {
                        # Add the current row number of i to the index        
                        index = c(index,i)
                }
        }
        # increase the index by 1, to match the data matrix
        index = index + 1
        
# Pull the appropriate columns
        data2 <- data[, index]
        
# 3. Uses descriptive activity names to name the activities in the data set
    #    features2 = features$V2
    #    for (j in nrow(features2)){
    #            features2[j] <- gsub("-","_", features2[j])
    #            features2[j] <- gsub("(","_", features2[j])
    #            features2[j] <- gsub(")","_", features2[j])
    #    }

# 4. Appropriately labels the data set with descriptive variable names. 
    #    features2 = factor(c("id", features2, "activity"))

# 5. Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 
# Use the apply function to do this. Argument is 2 for column.
        data3 = apply(data, 2, mean)