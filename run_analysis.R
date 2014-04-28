##Load required libraries
library(plyr)
library(reshape2)

##Load each train and test data separately
X_test <- read.table("~/X_test.txt", quote="\"",row.names=NULL)
X_train <- read.table("~/X_train.txt", quote="\"",row.names=NULL)
y_test <- read.table("~/y_test.txt", quote="\"",row.names=NULL)
y_train <- read.table("~/y_train.txt", quote="\"",row.names=NULL)
subject_test <- read.table("~/subject_test.txt", quote="\"",row.names=NULL)
subject_train <- read.table("~/subject_train.txt", quote="\"",row.names=NULL)

names(y_test)<-"Activity"
names(y_train)<-"Activity"
names(subject_test)<-"Subject"
names(subject_train)<-"Subject"

##Merge the data sets, by adding the test data rows below the train data rows
mergedX=rbind(X_train,X_test)
mergedY=rbind(y_train,y_test)
mergedSubject=rbind(subject_train,subject_test)

##Coerce the subject and Activity data to be numeric and adjoin them to mergedX
##This seems to be the only way to avoid weird errors later on
##maybe try cbind()?
mergedX$Subject<-as.numeric(as.matrix(mergedSubject))
mergedX$Activity<-as.numeric(as.matrix(mergedY))

##Programmatically extract list of columns to pick from mergedX
##First load features
features<-read.table("~/GettingAndCleaningData/features.txt", quote="\"")
features$V2<-as.character(features$V2)
##Then look for any variable name containing mean or std
meanCols<-grep("*mean*",features$V2)
stdCols<-grep("*std*",features$V2)

##concatenate anything that matches 
dataCols<-c(meanCols,stdCols)
dataCols<-sort(dataCols)

##Columns 562,563 are the last added subject and activity columns
data<-mergedX[,c(dataCols,562,563)]
names(data)<-c(features$V2[dataCols],"Subject","Activity")

##Load Activity labels
activity_labels <- read.table("~/activity_labels.txt", quote="\"",row.names=NULL)

##Recode Activity data using the lookup table specified in the activity labels file
data$Activity<-sapply(data$Activity, function(x) activity_labels$V2[x])


##Reshape the data and summarise using the mean
datamelt<-melt(data,id=c("Activity","Subject"),measure.vars=names(data)[c(-80,-81)])
out<-dcast(datamelt,Subject+Activity~variable,mean)

##Output work to files
write.table(data, file="./tidydata.txt", sep="\t", row.names=FALSE)
write.table(out, file="./tidysummary.txt", sep="\t", row.names=FALSE)
