---
title: "Clean and filter human activity recognition"
author: "Luis E. Bouvy"
email: espinosabouvy@gmail.com
date: "28 september 2016"
file: CodeBook.md
---
``

## Getting Data

Data collected, formated and published by Jorge L. Reyes-Ortiz,
David Anguita, Alessandro Ghio, Luca Oneto from Genoa, Italy,
<www.smartlab.ws> found at:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

In the zip file, you can find the following data:
- activity labels.  Labels about the diferent activities recorded.
- features. All the variables included in the report
- features_info.  Explanation of variables included
- Readme. A file with all the explanation of the experiment, data and necessary 
information to work with the data
- test data. 
     - subject.  Id number of the subject that generated the data
     - X_test. Data collected and filtered from the experiment
     - Y_test. The kind of activity performed during the experiment
- train data. 
     - subject.  Id number of the subject that generated the data
     - X_train. Data collected and filtered from the experiment
     - Y_train. The kind of activity performed during the experiment
     
After downloading the data we can start cleaning and filtering for future tests.

## Reading, ordering and merging data

The order for reading data was:
- Get the name of the features that will become the columns of the data using the 
file **feature.txt**
- Get the name of all features that includes **mean and standar deviation** using
grep and operator for text search inside strings from **features.txt**
- Read test and train complete data from **x_test.txt and x_train.txt** using the 
feature file as header names
- Read subject file from **subject_train and subject_test** files
- Finally reading **y_train and x_train** we get the information about the subject
that generated the data, merging this files with the **activity_labels** we are now
able to know the name of the activity they realized.

**To simplify the code I used a for loop, changing the name of the file, from 
test to train because the data had the exact same format**

##Mergin train and test data
The test data that represents 30% of the data was added to the train information
to create a complete dataset with the information required. 
- Type of data (train/test)
- Descripction of the activity
- Subject id
- Data containing different means
- Data containing differnte standar deviations.

##CONCLUTIONS
The final data is clean because of the following reasons:
1. Data was merge to created a user friendly dataset
2. All columns represent a variable with user friendly names.  Some of them are
to similar, so it was important to be clear about the information that contains,
there is no way no know what belongs to what it variable names are not clear.
3. Data only contains information relevation to the objective of the assignment.
4. Factor variables are defined as factors and numeric as numeric, so the user
doesn't need to make convertions to data in order to generate relevant info.

**All comments and suggestions are welcome about unclear information of script,
and final dataset, the information downloaded belongs to their creators**
