runanalysis <- function(){
     library(dplyr)
     
     for (i in c(1:2)) {
          nombre <- c("train","test")
          
          #reading full reading from accel and gyro
          headers <- read.table("./Dataset/features.txt", col.names = c("ID", "feature"))
          #columns that include mean() and std() in their header
          meanandsd <- grep("mean()|std()", headers$feature)
          
          datos <- read.table(paste0("./Dataset/", nombre[i], "/x_", nombre[i],".txt"), 
                         col.names = headers$feature)
          
               #reading activites, typetraining and subjects from TRAINING
          subject <- read.table(file = paste0("./Dataset/",nombre[i],"/subject_",nombre[i],".txt"), 
                         colClasses = numeric(), col.names = "subjectid")
          typetrain <- read.table(file = paste0("./Dataset/", nombre[i],"/y_", nombre[i], ".txt"), 
                         colClasses = numeric(), col.names = "typetrainID")
          activity <- read.table(file = "./Dataset/activity_labels.txt", stringsAsFactors = FALSE, 
                                  header = FALSE,col.names = c("typetrainID", "activity"))
          traindescription <- merge(activity, typetrain)
          

          assign(paste0("df",nombre[i]), mutate(datos, "dataset" = nombre[i], 
                         "activity" = as.character(traindescription$activity), 
                         "subject" = subject$subjectid), as.environment(.GlobalEnv))   
     }
     
     #add train to test
     tidydata <- dftest%>%
          rbind(dftrain)
          
     #keep only columns that matters to the assingment and added columns
     tidydata <<- tidydata[,c(562:564, meanandsd)]
}

