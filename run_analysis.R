
# Loading Libraries ==============================================

library(plyr)
library(dplyr)
#================================================================================================================================

rm(list = ls())
# Loading data into variables ====================================

features <- read.table("features.txt",colClasses = "character")
activityLabels <- read.table("activity_labels.txt")


testData <- read.table("test/X_test.txt")
testActivities <- read.table("test/y_test.txt")
testSubjects <- read.table("test/subject_test.txt")

trainData <- read.table("train/X_train.txt")
trainActivites <- read.table("train/y_train.txt")
trainSubjects <- read.table("train/subject_train.txt")

testAggregate <- cbind(testSubjects,testActivities,testData)

trainAggregate <- cbind(trainSubjects,trainActivites,trainData)

all <- rbind(testAggregate,trainAggregate)

colnames(activityLabels)[1] = "Activity"
colnames(activityLabels)[2] = "ActivityName"

colnames(all)[1] = "Subject"
colnames(all)[2] = "Activity"

all <- join(activityLabels,all,by="Activity")

all <- all[, !(names(all) %in% c("Activity"))]

colnames(all)[3:563] <- features[,2]

meanColumns <- grep("mean",colnames(all))
stdColumns <- grep("std",colnames(all))

allT <- all[,combine(1,2,meanColumns,stdColumns)] 

grouped <- group_by(allT,allT$ActivityName,allT$Subject)

FinalSet <- aggregate(grouped[,3:81],by = list(grouped$ActivityName,grouped$Subject), FUN = mean)
colnames(FinalSet)[1] <- "Activity"
colnames(FinalSet)[2] <- "Subject"

# End - Loading data into variables ==============================



# Checking the loading is successful =============================


FileUploadingchecks <- function(){
  testSubjectsCount <- length(unique(testSubjects[,1]))
  
  trainSubjectsCount <- length(unique(trainSubjects[,1]))
  
  uniqueActivitiesCount <- length(unique(all$ActivityName))
  uniqueSubjectsCount <- length(unique(all$Subject))
  
  if(testSubjectsCount != 9)
    stop(c("The test data should only be related to 9 subjects, but ",testSubjectsCount, " were found"))
  
  if(trainSubjectsCount != 21)
    stop(c("The training data should only be related to 21 subjects, but ",trainSubjectsCount, " were found"))
  
  if(uniqueActivitiesCount != 6)
    stop(c("There should be only 6 activities but ",uniqueActivitiesCount, " found"))
  
  if(uniqueSubjectsCount != 30)
    stop(c("There should be only 30 participants but ",uniqueSubjectsCount, " found"))
}

#End - Checking the loading ... ==================================



FileUploadingchecks()



