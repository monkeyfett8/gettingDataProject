rm(list=ls())
library(plyr)

###### Download raw data ######
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# if (!file.exists("data")){
	# dir.create("data")
# }

if (!file.exists("./UCI HAR Dataset")){
	if (!file.exists("UCI_HAR_Dataset.zip")){
		print("Downloading data")
		download.file(fileURL, "UCI_HAR_Dataset.zip", method = "curl")
	}
	print("Unzipping Data")
	unzip("UCI_HAR_Dataset.zip", exdir=".")
}


###### Get and Build Data Tables ######

## read activity decoding labels table (for pt3)
labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt",sep="")
# ensure labels are in correct orders
labels <- labels[order(labels[,1],decreasing=F),]

## read variable names table (for pt4)
features <- read.table(file="./UCI HAR Dataset/features.txt",sep="")


## Read training data set ##
# open training data
xtrain <- read.table(file="./UCI HAR Dataset/train/X_train.txt",sep="")
names(xtrain) <- features[,2] # (for pt4)

# open subjects
subTrain <- read.table(file="./UCI HAR Dataset/train/subject_train.txt",sep="",col.names="subjectNumber")

# open table for activity levels
ytrain <- read.table(file="./UCI HAR Dataset/train/y_train.txt",sep="",col.names="activityCode")
#add decoded activity labels column
ytrain <- mutate(ytrain,activityType=factor(ytrain[,1],labels=labels[,2])) # (for pt3)

# combine x and y into one table
train <- cbind(subTrain,ytrain,xtrain)


## Read test dataset ##
# open test data
xtest <- read.table(file="./UCI HAR Dataset/test/X_test.txt",sep="")
names(xtest) <- features[,2] # (for pt4)

# open subjects
subTest <- read.table(file="./UCI HAR Dataset/test/subject_test.txt",sep="",col.names="subjectNumber")

# open table for activity levels
ytest <- read.table(file="./UCI HAR Dataset/test/y_test.txt",sep="",col.names="activityCode")
# add decoded activity labels column
ytest <- mutate(ytest,activityType=factor(ytest[,1],labels=labels[,2])) # (for pt3)

# combine x and y into one table
test <- cbind(subTest,ytest,xtest)


###### combine test and train data (for pt1) ######
dat <- rbind(train,test)
# remove unused tables
rm(list=c("xtrain","ytrain","train","subTrain","xtest","ytest","test","subTest"))

###### remove unneeded variables (for pt2) ######
# determine which columns are means or stds
# using only variables that end in mean() and std() only - i.e. not meanFrequency()
colsUse <- grepl("mean\\(\\)",features[,2])|grepl("std\\(\\)",features[,2]) #cols to use from X
colsUse <- c(T,F,T,colsUse) # add used column for subjectNo and for two columns from Y
# only use correct columns
dat <- dat[order(dat[,1],dat[,2]),colsUse]



###### Discriptive names for activities (for pt3) ######
# This is applied during creation of data tables and carried through to total dataset from there.
# Relevant calls are labeled "(for pt3)" in the code above.
# Primarily note the creation of the labels data
# labels are placed in ascending order within it's own table.
# Data is then fit to the factors in ascending order to match the data in activity_labels.txt

###### Discriptive column labels (for pt4) ######
# This is applied during creation of data tables and carried through to total dataset from there.
# relevant calls are labeled "(for pt4)" in the code above.
# unneeded variable names are removed with the unneeded data.
#
# vaiable names from features.txt are used as there is not sufficient knowledge to decode the variable names further.  Only some changes to remove bad character usage is done.
# Each variable used in this set is differentiated by an unknown first letter "t" or "f"
# The metric being measured follows this first letter.  This ends at a "_".
# Third, the data handling used is shown, either mean or standard deviation, mean or std respectively
# Finally, the axis on which the data is measured, X,Y,Z or none.
#
# Attemptin to reduce these data sets further may reduce usability for those who know what the various metrics mean.
# As somone who does not know this kind of data I prefer to leave it rather than risk removing important information.
# To preserve the presumanbly intended use, variable names have been left as those in features.txt with only R formatting fixes.
names(dat) <- gsub("\\(\\)","",names(dat))
names(dat) <- gsub("-","_",names(dat))

# write full table to separate file (averaged file to be saved later)
write.table(dat, file="totalDataTable.txt",sep=" ",row.names=F)
write.csv(dat,file="totalDataTable.csv",row.names=F)

###### Average per subject and activity (for pt5) ######
# get table of averages by 
averagedDat <- aggregate(dat[3:dim(dat)[2]],by=dat[1:2],mean)
averagedDat <- averagedDat[order(averagedDat[,1],averagedDat[,2]),]
write.table(averagedDat, file="averagedDataTable.txt",sep=" ",row.names=F)
write.csv(averagedDat,file="averagedDataTable.csv",row.names=F)


