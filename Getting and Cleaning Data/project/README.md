README For 'run_analysis.R'
=============================
The following is the code structure for 'run_analysis.R', you can also find the same description inside the file.
-----------------------------

+ read in the column names for the data

1. Merges the training and the test sets to create one data set.
	+ read in the test datasets, and uses 'cbind' to merge them
	+ read in the train datasets, and uses 'cbind' to merge them
	+ use 'rbind' to merge the test and train datasets by row

2. Extracts only the measurements on the mean and standard deviation for each measurement.
	+ here i use regular expression to find the measurements with 'mean' or 'std' on its column name
	+ the 1st column: subject_id and 2nd column: activity_id
	
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names. 
	+ use 'merge' to combine the human readable Activity_Label
	
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

6. Finally: export the result data to txt file
