#setting working directory
setwd("./Coursera/quizCleaningData/UCI HAR Dataset")
#installing libraries
install.packages("data.table")
install.packages("reshape2")
library("data.table")
library("reshape2")

#READ TXT FILES
activityLabels <- read.table("activity_labels.txt") 
features <- read.table("features.txt") 
xtest <- read.table("test/X_test.txt") 
ytest <- read.table("test/Y_test.txt") 
xtrain <- read.table("train/X_train.txt") 
ytrain <- read.table("train/Y_train.txt") 
subjectTest <- read.table("test/subject_test.txt") 
subjectTrain <- read.table("train/subject_train.txt") 
# Calculated Functions.
mean <- features[grep("mean\\(\\)",as.character(features$V2)),]
std <- features[grep("std",as.character(features$V2)),]
extractedFun <- rbind(mean,std)

#change names of variables.
names(xtest)<-as.character(features$V2)
names(xtrain)<-as.character(features$V2)
names(subjectTest) <- c("subject")
names(subjectTrain) <- c("subject")

# @X
xtest <-xtest[,as.character(extractedFun$V2)]
xtrain <-xtrain[,as.character(extractedFun$V2)]

# @Y
ytest <-merge(ytest,activityLabels,by="V1",all=TRUE)
names(ytest) <- c("Activity_ID","Activity_Label")
ytrain <-merge(ytrain,activityLabels,by="V1",all=TRUE)
names(ytrain) <- c("Activity_ID","Activity_Label")

# @dataset
testSet <- cbind(subjectTest,ytest,xtest)
trainSet <- cbind(subjectTrain,ytrain,xtrain)
completeSet <- rbind(testSet,trainSet)

# melting table
idlabels <- c("subject", "Activity_ID", "Activity_Label")
datalabels <- setdiff(colnames(completeSet), idlabels)
meltdata <- melt(completeSet, id = idlabels, measure.vars = datalabels)

#dcasting table
avg <-function(x){mean(x,na.rm=TRUE)}
dcastdata <- dcast(meltdata,subject + Activity_Label ~ variable, avg)

# @write
write.table(dcastdata,file="../Tidy_Data_byIrene.txt",row.name=FALSE)
