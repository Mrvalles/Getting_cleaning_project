 
#Step 1: Load the dplyr library
library(dplyr)

#Step 2: load all the interest files that must be included in your working directory
train<-read.table("./X_train.txt",header=FALSE,sep="",dec=".")
test<-read.table("./X_test.txt",header=FALSE)             
train_act<-read.table("./y_train.txt",header=FALSE)
test_act<-read.table("./y_test.txt",header=FALSE)             
train_who<-read.table("./subject_train.txt",header=FALSE)
test_who<-read.table("./subject_test.txt",header=FALSE)
features<-read.table("./features.txt",header=FALSE)
features<-as.character(features[,2])
activity_labels<-read.table("./activity_labels.txt",header=FALSE)

#Step 3: combine training and test set in only one file for all the interest files: data, activities and people
data_set<-rbind(train,test)
activity_set<-rbind(train_act,test_act)
who_set<-rbind(train_who,test_who)

#Step 4: Assign the column names to the main data set
names(data_set)<-features

#Step 5: Extract only the columns with mean and standar deviation
mean_names<-grep("-mean()",features,fixed=TRUE)
std_names<-grep("-std()",features,fixed=TRUE)
columns<-c(mean_names,std_names)
data_set<-data_set[,columns]

#Step 6: Merge activity information
names(activity_set)<-"Activity"
data_set<-cbind(activity_set,data_set)
#Step 7: Merge ID subject to Data_set
names(who_set)<-"Id_subject"
data_set<-cbind(who_set,data_set)

#Step 8: Group by Id_subject and activity to get the final file required
result<-aggregate(data_set,list(data_set$Id_subject,data_set$Activity),mean)
result<-result[,3:70]

#Step 9: Translate number activity into text
result<-merge(result,activity_labels,by.x="Activity",by.y="V1")
result<-result[,c(69,2:68)]
names(result)<-c("activity",names(result)[2:68])

#Step 10: Export file to txt in working directory
write.table(result,file="./result.txt",row.names=FALSE)