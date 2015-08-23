##The purpose of this script is to demonstrate how to download, manipulate, and create
##clean and tidy datasets. For further explanation, please see the README.md file.

##Download UCI HAR Datset
fileURL <- 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "data/dataset.zip", method = "libcurl")

##Extract files from compressed folder
unzip("data/dataset.zip", exdir = "data/projectdata")

##Read individual datasets for later merging
subject_test <- read.table("data/projectdata/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("data/projectdata/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("data/projectdata/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("data/projectdata/UCI Har Dataset/train/subject_train.txt")
X_train <- read.table("data/projectdata/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("data/projectdata/UCI HAR Dataset/train/Y_train.txt")
features <- read.table("data/projectdata/UCI HAR Dataset/features.txt")
activitytypes <- read.table("data/projectdata/UCI HAR Dataset/activity_labels.txt")

##Load libraries to merge and organize datsets
library(plyr)
library(dplyr)

##Load measurement names
featurenames <- features[,2]

##Change column names to more descriptive variable names
colnames(subject_test) <- c("Subject_ID")
colnames(X_test) <- featurenames
colnames(Y_test) <- c("Activity")
colnames(subject_train) <- c("Subject_ID")
colnames(X_train) <- featurenames
colnames(Y_train) <- c("Activity")

##Bind datasets together by subgroup test and train
test <- cbind(subject_test,Y_test,X_test)
train <- cbind(subject_train,Y_train,X_train)

##Combine both testing and training datasets, fix duplicate column names, and order by Subject ID
finalset <- rbind(test,train)
valid_column_names <- make.names(names=names(finalset), unique=TRUE, allow_=TRUE)
names(finalset) <- valid_column_names
finalsetordered <- arrange(finalset,Subject_ID)

##Extract only mean and standard deviation measurements
meannum1 <- grep("mean",names(finalsetordered))
meannum2 <- grep("Mean",names(finalsetordered))
stdnum1 <- grep("std",names(finalsetordered))
stdnum2 <- grep("Std",names(finalsetordered))
meanset1 <- finalsetordered[,meannum1]
meanset2 <- finalsetordered[,meannum2]
stdset1 <- finalsetordered[,stdnum1]
stdset2 <- finalsetordered[,stdnum2]
idactivity <- finalsetordered[,1:2]

##Recreate final dataset
finalset2 <- cbind(idactivity,meanset1,meanset2,stdset1,stdset2)

##Count total number of rows
dimcount <- dim(finalset2)
total <- dimcount[1]

##Replace numerical values in Activity_ID column with corresponding text values
for(i in 1:total){
	if(finalset2[i,2]==1){
		finalset2[i,2] <- "Walking"
	}
	if(finalset2[i,2]==2){
		finalset2[i,2] <- "Walking Upstairs"
	}
	if(finalset2[i,2]==3){
		finalset2[i,2] <- "Walking Downstairs"
	}
	if(finalset2[i,2]==4){
		finalset2[i,2] <- "Sitting"
	}
	if(finalset2[i,2]==5){
		finalset2[i,2] <- "Standing"
	}
	if(finalset2[i,2]==6){
		finalset2[i,2] <- "Laying"
	}
}

##Group dataset by subject and activity and find average values for each subject by activity
groupedset <- group_by(finalset2,Subject_ID,Activity)
finalgroupedset <- summarise_each(groupedset,funs(mean))

##Write result to new tidy data set
write.table(finalgroupedset, file="data/tidydata.txt",row.name=FALSE)

