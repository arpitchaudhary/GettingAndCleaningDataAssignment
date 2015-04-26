#This script does all that is asked in the project and created the required dataset.

##This script takes as input the dataset provided for the project. This script assumes that
# the dataset is kept along with the script.

##It needs to access the following files in the dataset:
      # train/subject_train.txt
      # train/X_train.txt
      # train/y_train.txt
      # test/subject_test.txt
      # test/X_test.txt
      # test/y_test.txt
      # activity_labels.txt
      # features.txt

##Following are the output files from the script:
      # dataset1.txt
      # dataset2.txt


#Including dplyr package as it is required in the script.
library(dplyr)

#reading data from train dataset and then merging them together using cbind() to add subject
# and activity labels to the dataset present in train/X_train.txt
subject_train<-read.csv("train/subject_train.txt", header=FALSE)
x_train<-read.table("train/X_train.txt")
y_train<-read.csv("train/y_train.txt", header=FALSE)
#Renaming the variable names to a sensible name.
subject_train<-rename(subject_train, subject=V1)
y_train<-rename(y_train, label=V1)
train<-cbind(subject_train, y_train, x_train)

#reading data from test dataset and then merging them together using cbind() to add subject
# and activity labels to the dataset present in test/X_test.txt
subject_test<-read.csv("test/subject_test.txt", header=FALSE)
x_test<-read.table("test/X_test.txt")
y_test<-read.csv("test/y_test.txt", header=FALSE)
#Renaming the variable names to a sensible name.
subject_test<-rename(subject_test, subject=V1)
y_test<-rename(y_test, label=V1)
test<-cbind(subject_test, y_test, x_test)

##Combining the data from train and test dataset into a single data frame using rbind() to make
# a single large dataset containing both datasets.
data<-rbind(train,test)

##Reading activity labels file so as to change the label data from y_train/y_test to reaadable factor
# which describes the activity
activity<-read.table("activity_labels.txt")

##Reading data from activity file and applying it as label to factor variable to describe the activity.
activity$V2<-as.character(activity$V2)
data$label<-factor(data$label, labels = activity$V2)
data<-rename(data, activity=label)

##Reading data from feature file and using it to name the columns used in the dataset.
feature<-read.csv("features.txt", header=FALSE, sep=" ")
feature$V2<-as.character(feature$V2)
colNames<-c("subject","activity",feature$V2)
colnames(data)<-colNames

##Extracting only required variables and discarding the other variables.
requiredCols<-c(grep("mean",colnames(data)),grep("std",colnames(data)))
requiredCols<-c(1,2,requiredCols)
data<-data[, requiredCols]

##Improving the names of the variables in the data frame.
names(data)<-sub("\\(\\)","", names(data))
names(data)<-sub("BodyBody","Body", names(data))
names(data)<-sub("^f","freq.", names(data))
names(data)<-sub("^t","time.", names(data))
names(data)<-make.names(names(data))

##Writing data to a file. this file would now contain data that is the result of step 4 for the project.
write.table(data,"dataset1.txt",row.names=FALSE)

##Creating new dataset that is asked in the step 5 of the project description.
newData<-group_by(data, activity,subject)
newData<-summarise_each(newData,funs(mean))

##Writing the final dataset to a file.
write.table(newData,"dataset2.txt",row.names=FALSE)