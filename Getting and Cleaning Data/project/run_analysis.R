path <- "./datasource/"

# read in the column names for the data
col_names <- read.table(file=paste(path,"features.txt",sep=""),header=FALSE,col.names=c("id","label"))

### 1.Merges the training and the test sets to create one data set. ##############

# read in the test_set
dataset <- read.table(file=paste(path,"test/X_test.txt",sep=""),header=FALSE,col.names=col_names[,"label"])
subject <- read.table(file=paste(path,"test/subject_test.txt",sep=""),header=FALSE,col.names=c("subject_id"))
activity <- read.table(file=paste(path,"test/y_test.txt",sep=""),header=FALSE,col.names=c("activity_id"))
test_set <- cbind(subject,activity,dataset)

# read in the train datasets
dataset <- read.table(file=paste(path,"train/X_train.txt",sep=""),header=FALSE,col.names=col_names[,"label"])
subject <- read.table(file=paste(path,"train/subject_train.txt",sep=""),header=FALSE,col.names=c("subject_id"))
activity <- read.table(file=paste(path,"train/y_train.txt",sep=""),header=FALSE,col.names=c("activity_id"))
train_set <- cbind(subject,activity,dataset)

# merge the test and train datasets by row
complete_set <- rbind(test_set,train_set)

### 2.Extracts only the measurements on the mean and standard deviation for each measurement.  #############
regexp <- "(.*)+(mean)|(std)(.*)+"
col <- grepl(regexp,col_names[,"label"])
col <- c(TRUE,TRUE,col) # 1st column: subject_id; 2nd column: activity_id
selected_set <- complete_set[,col]

### 3.Uses descriptive activity names to name the activities in the data set. ################
### 4.Appropriately labels the data set with descriptive activity names. ###########
activity_labels <- read.table(file=paste(path,"activity_labels.txt",sep=""),header=FALSE,col.names=c("activity_id","activity_label"))
selected_set_labeled <- merge(x=selected_set,y=activity_labels,sort=FALSE)

### 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  #############

result <- aggregate(x=selected_set_labeled[,3:81],
                  by=list(subject_id=selected_set_labeled$subject_id,
                          activity=selected_set_labeled$activity_label),
                  FUN=mean)

### Finally: export the result data to txt file
write.table(result,file="./result.txt",sep=",",fileEncoding="UTF-8")




