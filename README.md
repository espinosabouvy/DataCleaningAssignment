---
title: "Clean and filter human activity recognition - Readme"
author: "Luis E. Bouvy"
email: espinosabouvy@gmail.com
date: "28 september 2016"
file: Readme.md
---
``

#General function of script
Download zip files from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

**The complete script for reading data uses a for loop to simplify the code
because for train and test uses the same files with different directories
and files with the same format**

##Reading and merging data
1. Get the headers using read table and using ID and FEATURE as colum names
     #reading full reading from accel and gyro
          headers <- read.table("./Dataset/features.txt", 
               col.names = c("ID", "feature"))
2. Getting from the feature header the columns that corresponds to data containing
mean and standar deviation informacion
     #columns that include mean() and std() in their header
          meanandsd <- grep("mean()|std()", headers$feature)
3. Reading subject, type of training ids and merge with the description
of the activities to have user friendly variable names to use
     #reading activites, typetraining and subjects from TRAINING
     subject <- read.table(file=paste0("./Dataset/",nombre[i],"/subject_",
          nombre[i],".txt"),colClasses = numeric(), col.names = "subjectid")
     typetrain <- read.table(file = paste0("./Dataset/", nombre[i],"/y_", 
          nombre[i], ".txt"), colClasses = numeric(), col.names = "typetrainID")
     activity <- read.table(file = "./Dataset/activity_labels.txt", 
          stringsAsFactors = FALSE, header = FALSE,col.names = c("typetrainID",
          "activity"))
     traindescription <- merge(activity, typetrain)
4. Using mutate we add the subject, type of training and activity name to 
the complete data
     assign(paste0("df",nombre[i]), mutate(datos, "dataset" = nombre[i], 
               "activity" = as.character(traindescription$activity), 
               "subject" = subject$subjectid), as.environment(.GlobalEnv))
               
##Merge train and test data, clean unused columns
1. Using rbind the train data were added to the test data
     tidydata <- dftest%>%rbind(dftrain)
2. Finally the unused columns where discarted, keeping the type of training
subject and activity description with the columns that include mean and sd
     tidydata <<- tidydata[,c(562:564, meanandsd)]
     
