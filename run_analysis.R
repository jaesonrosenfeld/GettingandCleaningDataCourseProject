## The first section of code reads all of the .txt files in the "test" folder
## and combines them into a single data frame called test df

wd<-getwd()
setwd("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")
subjectstest<-read.table("subject_test.txt", sep="")
xtest<-read.table("X_test.txt", sep="")
ytest<-read.table("y_test.txt", sep="")
setwd("./Inertial Signals")
bodyaccxtest<-read.table("body_acc_x_test.txt", sep="")
bodyaccytest<-read.table("body_acc_y_test.txt", sep="")
bodyaccztest<-read.table("body_acc_z_test.txt", sep="")
bodygyroxtest<-read.table("body_gyro_x_test.txt", sep="")
bodygyroytest<-read.table("body_gyro_y_test.txt", sep="")
bodygyroztest<-read.table("body_gyro_z_test.txt", sep="")
totalaccxtest<-read.table("total_acc_x_test.txt", sep="")
totalaccytest<-read.table("total_acc_y_test.txt", sep="")
totalaccztest<-read.table("total_acc_z_test.txt", sep="")

## This line of code simply combines the means and standard deviations for of the 128 columns
## in each imported datatable and then combines these summarized stats into a dataframe.
## The 561 dimension measure from x_test.txt is left unsummarized in the final 561 columns
## of the dataframe.

testdf<-cbind(subjectstest,ytest,apply(bodyaccxtest,1,mean),apply(bodyaccytest,1,mean),apply(bodyaccztest,1,mean),apply(bodygyroxtest,1,mean),apply(bodygyroytest,1,mean),apply(bodygyroztest,1,mean),apply(totalaccxtest,1,mean),apply(totalaccytest,1,mean),apply(totalaccztest,1,mean),apply(bodyaccxtest,1,sd),apply(bodyaccytest,1,sd),apply(bodyaccztest,1,sd),apply(bodygyroxtest,1,sd),apply(bodygyroytest,1,sd),apply(bodygyroztest,1,sd),apply(totalaccxtest,1,sd),apply(totalaccytest,1,sd),apply(totalaccztest,1,sd), xtest)

colnames(testdf)<-c("Subject_Number","Activity","MEAN_BODY_ACCEL_X","MEAN_BODY_ACCEL_Y", "MEAN_BODY_ACCEL_Z","MEAN_BODY_GYRO_X","MEAN_BODY_GYRO_Y","MEAN_BODY_GYRO_Z","MEAN_TOT_ACCEL_X","MEAN_TOT_ACCEL_Y","MEAN_TOT_ACCEL_Z","SD_BODY_ACCEL_X","SD_BODY_ACCEL_Y", "SD_BODY_ACCEL_Z","SD_BODY_GYRO_X","SD_BODY_GYRO_Y","SD_BODY_GYRO_Z","SD_TOT_ACCEL_X","SD_TOT_ACCEL_Y","SD_TOT_ACCEL_Z",rep("Time and Freq",561))


## The next section of code reads all of the .txt files in the "train" folder
## and combines them into a single data frame called test dfsetwd(wd)

setwd("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train")
subjectstrain<-read.table("subject_train.txt", sep="")
xtrain<-read.table("X_train.txt", sep="")
ytrain<-read.table("y_train.txt", sep="")
setwd("./Inertial Signals")
bodyaccxtrain<-read.table("body_acc_x_train.txt", sep="")
bodyaccytrain<-read.table("body_acc_y_train.txt", sep="")
bodyaccztrain<-read.table("body_acc_z_train.txt", sep="")
bodygyroxtrain<-read.table("body_gyro_x_train.txt", sep="")
bodygyroytrain<-read.table("body_gyro_y_train.txt", sep="")
bodygyroztrain<-read.table("body_gyro_z_train.txt", sep="")
totalaccxtrain<-read.table("total_acc_x_train.txt", sep="")
totalaccytrain<-read.table("total_acc_y_train.txt", sep="")
totalaccztrain<-read.table("total_acc_z_train.txt", sep="")

## This line of code simply combines the means and standard deviations for of the 128 columns
## in each imported datatable and then combines these summarized stats into a dataframe.
## The 561 dimension measure from x_train.txt is left unsummarized in the final 561 columns
## of the dataframe.

traindf<-cbind(subjectstrain,ytrain,apply(bodyaccxtrain,1,mean),apply(bodyaccytrain,1,mean),apply(bodyaccztrain,1,mean),apply(bodygyroxtrain,1,mean),apply(bodygyroytrain,1,mean),apply(bodygyroztrain,1,mean),apply(totalaccxtrain,1,mean),apply(totalaccytrain,1,mean),apply(totalaccztrain,1,mean),apply(bodyaccxtrain,1,sd),apply(bodyaccytrain,1,sd),apply(bodyaccztrain,1,sd),apply(bodygyroxtrain,1,sd),apply(bodygyroytrain,1,sd),apply(bodygyroztrain,1,sd),apply(totalaccxtrain,1,sd),apply(totalaccytrain,1,sd),apply(totalaccztrain,1,sd),xtrain)

colnames(traindf)<-c("Subject_Number","Activity","MEAN_BODY_ACCEL_X","MEAN_BODY_ACCEL_Y", "MEAN_BODY_ACCEL_Z","MEAN_BODY_GYRO_X","MEAN_BODY_GYRO_Y","MEAN_BODY_GYRO_Z","MEAN_TOT_ACCEL_X","MEAN_TOT_ACCEL_Y","MEAN_TOT_ACCEL_Z","SD_BODY_ACCEL_X","SD_BODY_ACCEL_Y", "SD_BODY_ACCEL_Z","SD_BODY_GYRO_X","SD_BODY_GYRO_Y","SD_BODY_GYRO_Z","SD_TOT_ACCEL_X","SD_TOT_ACCEL_Y","SD_TOT_ACCEL_Z",rep("Time and Freq",561))

## The next line of code combines the two dataframes

finaldf<-rbind(testdf,traindf)

## The next lines of code replace the numerical codes for activities with descriptive names

finaldf$Activity<-sub(pattern=1, replacement="WALKING", finaldf$Activity)
finaldf$Activity<-sub(pattern=2, replacement="WALKING_UPSTAIRS", finaldf$Activity)
finaldf$Activity<-sub(pattern=3, replacement="WALKING_DOWNSTAIRS", finaldf$Activity)
finaldf$Activity<-sub(pattern=4, replacement="SITTING", finaldf$Activity)
finaldf$Activity<-sub(pattern=5, replacement="STANDING", finaldf$Activity)
finaldf$Activity<-sub(pattern=6, replacement="LAYING", finaldf$Activity)


## The next lines of code calculates the mean for each measurement for each subject
## and then combines them into a single data frame.

dfnew<-cbind(tapply(finaldf$MEAN_BODY_ACCEL_X,finaldf[,1:2],mean),rep("MEAN_BODY_ACCEL_X",30))
colnames(dfnew)[7]<-"MEASUREMENT"
dftemp<-cbind(tapply(finaldf$MEAN_BODY_ACCEL_Y,finaldf[,1:2],mean),rep("MEAN_BODY_ACCEL_Y",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_BODY_ACCEL_Z,finaldf[,1:2],mean),rep("MEAN_BODY_ACCEL_Z",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_BODY_GYRO_X,finaldf[,1:2],mean),rep("MEAN_BODY_GYRO_X",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_BODY_GYRO_Y,finaldf[,1:2],mean),rep("MEAN_BODY_GYRO_Y",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_BODY_GYRO_Z,finaldf[,1:2],mean),rep("MEAN_BODY_GYRO_Z",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_TOT_ACCEL_X,finaldf[,1:2],mean),rep("MEAN_TOT_ACCEL_X",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_TOT_ACCEL_Y,finaldf[,1:2],mean),rep("MEAN_TOTAL_ACCEL_Y",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
dftemp<-cbind(tapply(finaldf$MEAN_TOT_ACCEL_Z,finaldf[,1:2],mean),rep("MEAN_TOT_ACCEL_Z",30))
colnames(dftemp)[7]<-"MEASUREMENT"
dfnew<-rbind(dfnew,dftemp)
sub<-rep(1:30,9)
dfnew<-cbind(dfnew,sub)
colnames(dfnew)[8]<-"SUBJECT_NUMBER"
dfnew<-as.data.frame(dfnew)
dfnew$MEASUREMENT<-as.factor(dfnew$MEASUREMENT)
dfnew$SUBJECT_NUMBER<-as.factor(dfnew$SUBJECT_NUMBER)

setwd(wd)
write.table("Samsung_Summary_Data.txt",sep="",row.name=FALSE)