hopkins-getdata-courseproject
=============================

Course Project for the Getting Data class from the John Hopkins Coursera class

This code is used to analyze the Samsung Galaxy S and wearable data supplied in class.
Information is here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data is here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run-analysis.R is used to merge the test and training data into a single tidy dataset. Other subsets or analysis of the data is pulled via the five questions in the project. The code base is divided into five sections, each corresponding to the question in class. Each section is divided with the following marker:

#----------------------------------------------------------        

In Part 1, we merge the test and training data into a single data set. This is done by first going to the directory for the test data set, and extracting the three related txt files into R using the read.table command three times. We now have three different data frames.

Next we go to the directory for the training data set, and similarly extract the three related text files into R using read.table. These three tables, combined with the previous three, result in six separate dataframes. 

Then we utilize cbind to combine the first three sets of dataframes into a single table.
We can do the same for the second three sets of dataframes. Both data frames should now have 563 columns.
Finally we utilize rbind on these two dataframes, leading to the test and training data to be in one table. We can then export this data using write.csv, which is attached to the homework page as the first tidy data set.

#----------------------------------------------------------        
In Part 2, we utilize grepl to identify the activity names that contain the strings "mean" and "std". We store these column numbers corresponding to measurement names containing these strings in an "index" vector. This is done by looping through each measurement name.

I then add 1 to each value in the "index" vector, so that the index vector correctly corresponds to the "data" matrix. These were off by one because the first value of the "data" matrix contained the user's ID, while the measurements columns started with the second column in the "data" matrix.

I can then call all rows from data, and only those columns corresponding to the "index" vector, in order to obtain a subset of the data matrix that contains mean and std measurements. Note that the first column is still the ID, and the last column is still the activity index.

Note: I have read that the grep command does work with vectors, in which case a loop would have been unncecessary. Unfortunately I coudl not get that to work.

#----------------------------------------------------------        
In Part 3, I would have utilized the gsub function to remove '-' and parentheses, substituting these with the underline string "_". Unfortunately, I could not work with the features$V2 set; I believe I lack and understanding of how levels and factors work in R. Each time I attempted to add column names to the data set, I was left with numbers for the names, rather than text.

#----------------------------------------------------------        
In Part 4, I would have added the formatted labels from Part 3 to the column names of the data matrix. However, I was unsuccessful with my work in Part 3.

#----------------------------------------------------------        
In Part 5, I have utilized the apply function to apply a mean function to each of the columns in the data matrix. Note that the last column contains the average of activity indices, which may not make sense. I would probably just remove this column in real life.
