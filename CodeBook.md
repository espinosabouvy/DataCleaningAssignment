---
title: "Clean and filter human activity recognition"
author: "Luis E. Bouvy"
date: "28 september 2016"
output: html_document
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


