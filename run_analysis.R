#
# runanalysis.R
#
# This script processes wearable Samsung phone sensor measurement data
#
# 1. Processes test and training participant activities data
# 2. Process test and training subject IDs
# 3. Merges activities and subjects, keep activity names
# 4. Adds test vs. training identifiers
# 5. Processes features to annotate measurement columns
# 6. Processes test and training measurement data
# 7. Adds subject and activity descriptions to respective measurement data
# 8. Combines test and training measurement data
# 9. Keeps only the mean and std deviation measurements
# 10. Normalizes variable names
# 11. Creates file with variable/column names for codebook.md
# 12. Groups data by activity and subject in preparation for summarization
# 13. Summarizes data - means of all measurements
# 14. Writes summarized data to disk
#
# Throughout the script, unused objects are dropped as appropriate

# Load required packages
library(plyr)
library(dplyr)

# read training record activity codes
train_actcd<-read.csv("y_train.txt", header=FALSE,col.names = c("act_code"))

# read testing record activity codes
test_actcd<-read.csv("y_test.txt", header=FALSE, col.names = c("act_code"))

# read activity labels
act_labels<-read.fwf("activity_labels.txt", c(2,18),col.names=c("act_code","activitydesc"))

# join testing codes and labels
test_activities<-join(test_actcd, act_labels,type="inner")
# drop activity code column
test_activities<-test_activities[,"activitydesc",drop=FALSE]

# join training codes and labels
train_activities<-join(train_actcd, act_labels,type="inner")
# drop activity code column
train_activities<-train_activities[,"activitydesc",drop=FALSE]

# drop unneeded dataframes
rm(test_actcd)
rm(train_actcd)
rm(act_labels)

# read test subjects data
test_subjects<-read.csv("subject_test.txt",header=FALSE,col.names = "subjectid")

# bind test subjects and activities
testsubjectsactivities<-cbind(test_activities,test_subjects)

# add subject type (TE=Test, TR=Train)
subjecttype<-as.data.frame(rep("TE",nrow(testsubjectsactivities)))
colnames(subjecttype)<-"subjecttype"
testsubjectsactivities<-cbind(subjecttype,testsubjectsactivities)


# read test subjects data
training_subjects<-read.csv("subject_train.txt",header=FALSE,col.names = "subjectid")

# bind test subjects and activities
trainingsubjectsactivities<-cbind(train_activities,training_subjects)

# add subject type (TE=Test, TR=Train)
subjecttype<-as.data.frame(rep("TR",nrow(trainingsubjectsactivities)))
colnames(subjecttype)<-"subjecttype"
trainingsubjectsactivities<-cbind(subjecttype,trainingsubjectsactivities)

# drop unneeded tables
rm(test_activities)
rm(train_activities)
rm(test_subjects)
rm(training_subjects)

# process measurement files

# read dataset features (column names)
measNamesdf<-read.delim("features.txt", sep=" ",col.names=c("colNum","measurelabel"),header=FALSE)

# save Df column name as factor
measNames<-measNamesdf[,2]

# column length and count for measures data
measCols<-rep(16,561)

# read test data
testMeasdf<-read.fwf("X_test.txt",measCols)

# apply column names
colnames(testMeasdf)<-measNames

# add subjects and activities and type
testMeasAll<-cbind(testsubjectsactivities, testMeasdf)

# read training data
trainMeasdf<-read.fwf("X_train.txt",measCols)

# apply column names
colnames(trainMeasdf)<-measNames

# add subjects and activities and type
trainMeasAll<-cbind(trainingsubjectsactivities, trainMeasdf)

# concatenate  test and training dataframes 
combinedMeasures<-rbind(testMeasAll,trainMeasAll)

# keep only the mean and std deviation measures
finalMeasuresDF<-combinedMeasures[,grep("^s|^a|[Mm]ean|[Ss]td",colnames(combinedMeasures))]

# drop all unused objects
objs<-ls()
rm(list=objs[-grep("^f",objs)])
rm(objs)

# tidy/normalize variable names

tidynames<-tolower(names(finalMeasuresDF))
tidynames<-gsub("^t","timesignal-",tidynames)
tidynames<-gsub("^f","fft-",tidynames)
tidynames<-gsub("acc","acceleration",tidynames)
tidynames<-gsub("-mean\\(\\)-x","-x-direction-mean",tidynames)
tidynames<-gsub("-mean\\(\\)-y","-y-direction-mean",tidynames)
tidynames<-gsub("-mean\\(\\)-z","-z-direction-mean",tidynames)
tidynames<-gsub("-std\\(\\)-x","-x-direction-stddev",tidynames)
tidynames<-gsub("-std\\(\\)-y","-y-direction-stddev",tidynames)
tidynames<-gsub("-std\\(\\)-z","-z-direction-stddev",tidynames)
tidynames<-gsub("mag-mean\\(\\)","magnitude-mean",tidynames)
tidynames<-gsub("mag-std\\(\\)","magnitude-stddev",tidynames)
tidynames<-gsub("mag-mean","magnitude-mean",tidynames)
tidynames<-gsub("-meanfreq\\(\\)-x","-x-direction-meanfrequency",tidynames)
tidynames<-gsub("-meanfreq\\(\\)-y","-y-direction-meanfrequency",tidynames)
tidynames<-gsub("-meanfreq\\(\\)-z","-z-direction-meanfrequency",tidynames)
tidynames<-gsub("-meanfreq\\(\\)","-meanfrequency",tidynames)
tidynames<-gsub("angle\\(tb","angle-timesignalb",tidynames)
tidynames<-gsub("angle\\(","angle-",tidynames)
tidynames<-gsub("\\)$","",tidynames)
tidynames<-gsub("n\\),","n-",tidynames)
tidynames<-gsub("n,g","n-g",tidynames)
tidynames<-gsub("x,g","x-g",tidynames)
tidynames<-gsub("y,g","y-g",tidynames)
tidynames<-gsub("z,g","z-g",tidynames)
tidynames<-gsub("mean-gravity$","-gravity-mean",tidynames)
tidynames<-gsub("mean-gravitymean$","-gravity-mean",tidynames)
tidynames<-gsub("-gravitymean$","-gravity-mean",tidynames)
names(finalMeasuresDF)<-tidynames


# prepare data for summarization and output - remove subject type column from dataframe
drops<-c("subjecttype")
summaryReadyDF<-finalMeasuresDF[,!(names(finalMeasuresDF) %in% drops)]

# create file of names for use in MD codebook
tidynames<-as.data.frame(names(summaryReadyDF))
write.table(tidynames, file="tidycolnames4MD.txt", col.names=FALSE,quote=FALSE)

# drop unneeded table
rm(tidynames)

# create appropriate summary groupings
groupedDF<-group_by(summaryReadyDF,activitydesc,subjectid) 

# summarize all metrics - calculate mean only
finalSummaryMean<-summarize_all(groupedDF,funs(mean))

# write/save summarized data to file

write.table(finalSummaryMean,file="Wk4Proj_DataSummary.txt",col.names=FALSE,row.names=FALSE)

# Final cleanup

rm(summaryReadyDF)
rm(finalMeasuresDF)
rm(groupedDF)
rm(drops)
