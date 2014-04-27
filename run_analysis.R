library(plyr)

X_test <- read.table("~/GettingAndCleaningData/X_test.txt", quote="\"",row.names=NULL)
X_train <- read.table("~/GettingAndCleaningData/X_train.txt", quote="\"",row.names=NULL)
y_test <- read.table("~/GettingAndCleaningData/y_test.txt", quote="\"",row.names=NULL)
y_train <- read.table("~/GettingAndCleaningData/y_train.txt", quote="\"",row.names=NULL)
subject_test <- read.table("~/GettingAndCleaningData/subject_test.txt", quote="\"",row.names=NULL)
subject_train <- read.table("~/GettingAndCleaningData/subject_train.txt", quote="\"",row.names=NULL)

names(y_test)<-"Activity"
names(y_train)<-"Activity"
names(subject_test)<-"Subject"
names(subject_train)<-"Subject"


mergedX=rbind(X_train,X_test)
mergedY=rbind(y_train,y_test)
mergedSubject=rbind(subject_train,subject_test)

mergedX$Subject<-mergedSubject
mergedX$Activity<-mergedY

features<-read.table("~/GettingAndCleaningData/features.txt", quote="\"")
features$V2<-as.character(features$V2)
meanCols<-grep("*mean*",features$V2)
stdCols<-grep("*std*",features$V2)

dataCols<-c(meanCols,stdCols)
dataCols<-sort(dataCols)

data<-mergedX[,dataCols]
names(data)<-features$V2[dataCols]
