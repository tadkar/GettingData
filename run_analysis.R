library(plyr)
library(reshape2)

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


mergedX=rbind(X_train,X_test)
mergedY=rbind(y_train,y_test)
mergedSubject=rbind(subject_train,subject_test)

mergedX$Subject<-as.numeric(as.matrix(mergedSubject))
mergedX$Activity<-as.numeric(as.matrix(mergedY))

features<-read.table("~/GettingAndCleaningData/features.txt", quote="\"")
features$V2<-as.character(features$V2)
meanCols<-grep("*mean*",features$V2)
stdCols<-grep("*std*",features$V2)

dataCols<-c(meanCols,stdCols)
dataCols<-sort(dataCols)

data<-mergedX[,c(dataCols,562,563)]
names(data)<-c(features$V2[dataCols],"Subject","Activity")

data$Activity[data$Activity==1]<-""
data$Activity[data$Activity==2]<-"Walking"
data$Activity[data$Activity==3]<-"Walking_Upstairs"
data$Activity[data$Activity==4]<-"Walking_Downstairs"
data$Activity[data$Activity==5]<-"Sitting"
data$Activity[data$Activity==6]<-"Standing"
data$Activity[data$Activity==""]<-"Laying"

datamelt<-melt(data,id=c("Activity","Subject"),measure.vars=names(data)[c(-80,-81)])
out<-dcast(datamelt,Subject+Activity~variable,mean)
