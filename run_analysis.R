
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 1.Merges the training and the test sets to create one data set.
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip",method="curl")
list.files("./data")

# unzip file

# filePath
filePath <- "./data/Dataset/UCI HAR Dataset"

# train
subject_train <- read.table(paste0(filePath,"/train/subject_train.txt"))
X_train <- read.table(paste0(filePath,"/train/X_train.txt"))
Y_train <- read.table(paste0(filePath,"/train/Y_train.txt"))

# test
subject_test <- read.table(paste0(filePath,"/test/subject_test.txt"))
X_test <- read.table(paste0(filePath,"/test/X_test.txt"))
Y_test <- read.table(paste0(filePath,"/test/Y_test.txt"))

subject_all <- rbind(subject_train,subject_test)
setnames(subject_all, "V1", "subject")

Y_All <- rbind(Y_test, Y_train)
setnames(Y_All, "V1","activityNbr")

X_All <- rbind(X_test, X_train)


dt <- data.table(cbind(subject_all,Y_All,X_All))
setkey(dt,subject,activityNbr)

str(subject_all)
# 'data.frame':	10299 obs. of  1 variable:
str(Y_All)
# 'data.frame':	10299 obs. of  1 variable:
str(X_All)
# 'data.frame':	10299 obs. of  561 variables:
str(dt)
# Classes 'data.table' and 'data.frame':	10299 obs. of  563 variables:


# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

features <- read.table(paste0(filePath,"/features.txt"))
setnames(features,names(features),c("featNbr","featName"))
data.table(features)
str(features)
# 'data.frame':	561 obs. of  2 variables:
# $ featNbr : int  1 2 3 4 5 6 7 8 9 10 ...
# $ featName: Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)"

mean <- features[grepl("mean\\(\\)",features$featName),]
std <- features[grepl("std\\(\\)",features$featName),]

features.m <- data.table(rbind(mean,std))
features.m$featCode <- features.m[,paste0("V",featNbr)]

str(features.m)
# Classes 'data.table' and 'data.frame':	66 obs. of  3 variables:

head(features.m)
# featNbr          featName featCode
# 1:          1    tBodyAcc-mean()-X          V1
# 2:          2    tBodyAcc-mean()-Y          V2
# 3:          3    tBodyAcc-mean()-Z          V3
# 4:         41 tGravityAcc-mean()-X         V41
# 5:         42 tGravityAcc-mean()-Y         V42
# 6:         43 tGravityAcc-mean()-Z         V43

dt <- subset(dt,select=c(key(dt),features.m$featCode))
str(dt)
# Classes 'data.table' and 'data.frame':	10299 obs. of  68 variables:


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 3.Uses descriptive activity names to name the activities in the data set
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

activity_labels <- read.table(paste0(filePath,"/activity_labels.txt"))
setnames(activity_labels,names(activity_labels),c("activityNbr","activityName"))

str(activity_labels)
# 'data.frame':	6 obs. of  2 variables:
# $ activityNbr : int  1 2 3 4 5 6
# $ activityName: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1

head(activity_labels)
# activityNbr       activityName
# 1           1            WALKING
# 2           2   WALKING_UPSTAIRS
# 3           3 WALKING_DOWNSTAIRS
# 4           4            SITTING
# 5           5           STANDING
# 6           6             LAYING

dt <- merge(dt, activity_labels, by="activityNbr", all.x=TRUE)
str(dt)
# Classes 'data.table' and 'data.frame':	10299 obs. of  69 variables:
   
dt.sample <- rbind(head(dt),tail(dt))


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 4.Appropriately labels the data set with descriptive variable names.
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# melt dt
setkey(dt, subject,activityNbr,activityName)
dt.melt <- data.table(melt(dt,key(dt),variable.name = "featCode"))

str(dt.melt)
# Classes 'data.table' and 'data.frame':	679734 obs. of  5 variables:

head(dt.melt)
# subject activityNbr activityName featCode     value
# 1:       1           1      WALKING       V1 0.2039624
# 2:       1           1      WALKING       V1 0.2493432
# 3:       1           1      WALKING       V1 0.3250505
# 4:       1           1      WALKING       V1 0.3088081
# 5:       1           1      WALKING       V1 0.2655992
# 6:       1           1      WALKING       V1 0.1874192


# features.labels
features.labels <- features.m

# FeatDomain
features.labels$Time <- ifelse(grepl("^t",features.labels$featName),1,0)
features.labels$Freq <- ifelse(grepl("^f",features.labels$featName),1,0)

# featInstrument
features.labels$Acc <- ifelse(grepl("Acc",features.labels$featName),1,0)
features.labels$Gyro <- ifelse(grepl("Gyro",features.labels$featName),1,0)

# featAcceleration
features.labels$BodyAcc <- ifelse(grepl("BodyAcc",features.labels$featName),1,0)
features.labels$GravityAcc <- ifelse(grepl("GravityAcc",features.labels$featName),1,0)

# featVariable
features.labels$mean <- ifelse(grepl("mean()",features.labels$featName),1,0)
features.labels$std <- ifelse(grepl("std()",features.labels$featName),1,0)

# featJerk
features.labels$Jerk <- ifelse(grepl("Jerk",features.labels$featName),1,0)

# featMagnitude
features.labels$Mag <- ifelse(grepl("Mag",features.labels$featName),1,0)

# featAxis
features.labels$X <- ifelse(grepl("-X",features.labels$featName),1,0)
features.labels$Y <- ifelse(grepl("-Y",features.labels$featName),1,0)
features.labels$Z <- ifelse(grepl("-Z",features.labels$featName),1,0)

str(features.labels)

# features.desc
library(sqldf)
features.desc <- 
   sqldf("
         select
            featNbr,
            featName,
            featCode,

            case when Time=1 then 'Time' 
                  when Freq=1 then 'Freq' end as featDomain,

            case when ACC=1 then 'Accelerometer' 
                  when Gyro=1 then 'Gyroscope' end as featInstrument,

            case when BodyAcc=1 then 'Body'
                  when GravityAcc=1 then 'Gravity' end as featAcceleration,

            case when mean=1 then 'Mean'
                  when std=1 then 'Std' end as featVariable,

            case when Jerk=1 then 'Jerk' end as featJerk,

            case when Mag=1 then 'Magnitude' end as featMagnitude,

            case when X=1 then 'X'
                  when Y=1 then 'Y'
                  when Z=1 then 'Z' end as featAxis

         from 'features.labels'
         ")
str(features.desc)
# 'data.frame':	66 obs. of  10 variables:

features.desc

# merge features description
dt.melt <- merge(dt.melt,features.desc, by="featCode", all.x=TRUE)
str(dt.melt)
# Classes 'data.table' and 'data.frame':	679734 obs. of  14 variables:

dt.melt.head <- head(dt.melt)



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 5.From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

str(dt.melt)

data.table(names(dt.melt))

setkey(dt.melt,subject,activityName,featDomain,featInstrument,featAcceleration,featVariable,featJerk,featMagnitude,featAxis)

dt.tidy <- dt.melt[,list(count=.N, avg=mean(value)),by=key(dt.melt)]
str(dt.tidy)
# Classes 'data.table' and 'data.frame':	11880 obs. of  11 variables:

dt.tidy.head <- rbind(head(dt.tidy),tail(dt.tidy))
dt.tidy.head

summary(dt.tidy)

# export tidy_dataset
write.table(dt.tidy,paste0(filePath,"/tidy_dataset.txt"),quote = FALSE, sep = "\t", row.names = FALSE)


