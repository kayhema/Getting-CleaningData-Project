##Code for the Courseproject in Getting and cleaning data

#Loading all the tables from test and train folders
subject_test <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/test/subject_test.txt", quote="\"")
X_test <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/test/X_test.txt", quote="\"")
y_test <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/test/y_test.txt", quote="\"")
subject_train <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/train/subject_train.txt", quote="\"")
X_train <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/train/X_train.txt", quote="\"")
y_train <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/train/y_train.txt", quote="\"")
#Merging x-data of the test and train
data1<-rbind(X_test,X_train)
#Renaming the columns as per labels given in the features.txt
namecol <- read.table("C:/Users/prman_000/Desktop/RProg/GnC,Project/features.txt",sep="\n",header=FALSE)
names(data1)<-namecol$V1
#Merging the subject data of the test and train&& Merging Activity data of test&train
data2<-rbind(subject_test,subject_train)
data3<-rbind(y_test,y_train)
#Merging both subject and activity data and labelling the columns as Subject and Activity
data4<-cbind(data2,data3)
names(data4) <- c("Subject", "Activity")

#1.Merging all the data with the labelling as per features.txt
data <-cbind(data4,data1)

#2.Extracting the data with measurements on the mean and standard deviation 
#Extracted only data of mean() and Std(),
#Please note that data of meanfreq() was not considered
dataext<-data[,grep("mean\\(\\)|std\\(\\)", colnames(data))]
dataf<-cbind(data4,dataext)

#3.Applying Activity Labels to the extracted data
dataf$Activity <- as.character(data$Activity)
dataf$Activity [dataf$Activity  == "1"] <- "Walking"
dataf$Activity [dataf$Activity  == "2"] <- "WalkingUpStairs"
dataf$Activity [dataf$Activity  == "3"] <- "WalkingDownStairs"
dataf$Activity [dataf$Activity  == "4"] <- "Sitting"
dataf$Activity [dataf$Activity  == "5"] <- "Standing"
dataf$Activity [dataf$Activity  == "6"] <- "Laying"

#4.Appropriately labelling the data set with descriptive variable names
#labelling was done in step2, here variable names were edited
names(dataf)<-gsub("-", "", names(dataf))
names(dataf) <- gsub("\\(", "", names(dataf))
names(dataf) <- gsub("\\)", "", names(dataf))
names(dataf)<-tolower(names(dataf))

#5.Creating tidy data set with average of each variable for each activity and each subject.
tidy_df <- dataf %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

#Writing table to submit for project
#write.table(tidy_df, file="tidydata.txt",row.names=F)
#Since the write.table above is not showing tabular format, I am using Capture.output
capture.output(tidy_df, file="tidydata.txt")
