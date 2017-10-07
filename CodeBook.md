# Coursera Getting and Cleaning Data Course/Week 4 Project CodeBook

## Background

This CodeBook describes run_analysis.R script processing and the data elements of the summarized file that it generates: Wk4Proj_DataSummary.txt.

Addition information about the project and script can be found in the repo README.md file.

Note, the plyr and dplyr packages must be installed prior to running the script.


## How the Data was Processed

The run_analysis.R script processes the project's wearable Samsung phone sensor measurement data as follows:

1. Create dataframes from y_test.txt and y_train.txt - these files contain the positional activity ID that is associated with a measurement record
2. Create a dataframe from activity_labels.txt - this file contains the verbose descriptions associated with an activity ID
3. Join the activity ID data to the activity label data to associate the respective activity description for each record
4. Create dataframes from subject_test.txt and subject_train.txt - these files contain the positional research subject ID associated with a measurement record
5. Bind the respective activity and subject dataframes for each distinct dataset (test, training)
6. Optionally create subject-type identifiers and add to the respective subject-activity dataframes (TE:Test, TR:Training)  
7. Create a vector from features.txt - this file contains the positional verbose column/variable labels for test and training measurement datasets
8. Create a dataframe from X_test.txt (test subject measurements) and apply the features vector to label the dataframe columns
9. Column bind the respective subject and activity dataframe from step 5 to the test measurement dataframe - this associates the subject and activity for each record
10. Create a dataframe from X_train.txt (training subject measurements) and apply the features vector to label the dataframe columns
11. Column bind the respective subject and activity dataframe from step 5 to the training measurement dataframe - this associates the subject and activity for each record
12. Concatenate the training and test dataframes using rbind()
13. Keep the mean and standard deviation measurements in the combined dataframe using grep pattern matching
14. Normalize and enhance the dataframe column/variable names using a series match and replace gsub() functions
15. Create a supplemental file with the final variable/column names to simplify CookBook creation
16. Group the combined data by activity and subject in preparation for summarization
17. Summarize the combined data using summarize_all() - calculate the mean of all measurements
18. Create a file of the summarized data using write.table(), specifying no row or column names

Throughout the script, unused objects are dropped as appropriate.


## Data Table Columns

The Wk4Proj_DataSummary.txt file can be directly read into R using read.table : read.table("Wk4Proj_DataSummary.txt").

The read_results.R script can be run to read the summarized data and apply the appropriate descriptive column names to the data frame as specified here.

The following is a list of time and FFT measurement columns in positional order.  The names have been modified slightly to improve readability and are intended to be self describing.

**1-> activitydesc**

>Potential Values:
> 
* WALKING
* WALKING\_UPSTAIRS
* WALKING\_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

**2-> subjectid**

> Potential Values:
> 
Numeric/Integer: Value ranging from 1-30

Remaining data items are averages of the mean or standard deviation of the measurement:

**3-> timesignal-bodyacceleration-x-direction-mean**

**4-> timesignal-bodyacceleration-y-direction-mean**

**5-> timesignal-bodyacceleration-z-direction-mean**

**6-> timesignal-bodyacceleration-x-direction-stddev**

**7-> timesignal-bodyacceleration-y-direction-stddev**

**8-> timesignal-bodyacceleration-z-direction-stddev**

**9-> timesignal-gravityacceleration-x-direction-mean**

**10-> timesignal-gravityacceleration-y-direction-mean**
     
**11-> timesignal-gravityacceleration-z-direction-mean**
     
**12-> timesignal-gravityacceleration-x-direction-stddev**
     
**13-> timesignal-gravityacceleration-y-direction-stddev**
     
**14-> timesignal-gravityacceleration-z-direction-stddev**
     
**15-> timesignal-bodyaccelerationjerk-x-direction-mean**
     
**16-> timesignal-bodyaccelerationjerk-y-direction-mean**
     
**17-> timesignal-bodyaccelerationjerk-z-direction-mean**
     
**18-> timesignal-bodyaccelerationjerk-x-direction-stddev**
     
**19-> timesignal-bodyaccelerationjerk-y-direction-stddev**
     
**20-> timesignal-bodyaccelerationjerk-z-direction-stddev**
     
**21-> timesignal-bodygyro-x-direction-mean**
     
**22-> timesignal-bodygyro-y-direction-mean**
     
**23-> timesignal-bodygyro-z-direction-mean**
     
**24-> timesignal-bodygyro-x-direction-stddev**
     
**25-> timesignal-bodygyro-y-direction-stddev**
     
**26-> timesignal-bodygyro-z-direction-stddev**
     
**27-> timesignal-bodygyrojerk-x-direction-mean**
     
**28-> timesignal-bodygyrojerk-y-direction-mean**
     
**29-> timesignal-bodygyrojerk-z-direction-mean**
     
**30-> timesignal-bodygyrojerk-x-direction-stddev**
     
**31-> timesignal-bodygyrojerk-y-direction-stddev**
     
**32-> timesignal-bodygyrojerk-z-direction-stddev**
     
**33-> timesignal-bodyaccelerationmagnitude-mean**
     
**34-> timesignal-bodyaccelerationmagnitude-stddev**
     
**35-> timesignal-gravityaccelerationmagnitude-mean**
     
**36-> timesignal-gravityaccelerationmagnitude-stddev**
     
**37-> timesignal-bodyaccelerationjerkmagnitude-mean**
     
**38-> timesignal-bodyaccelerationjerkmagnitude-stddev**
     
**39-> timesignal-bodygyromagnitude-mean**
     
**40-> timesignal-bodygyromagnitude-stddev**
     
**41-> timesignal-bodygyrojerkmagnitude-mean**
     
**42-> timesignal-bodygyrojerkmagnitude-stddev**
     
**43-> fft-bodyacceleration-x-direction-mean**
     
**44-> fft-bodyacceleration-y-direction-mean**
     
**45-> fft-bodyacceleration-z-direction-mean**
     
**46-> fft-bodyacceleration-x-direction-stddev**
     
**47-> fft-bodyacceleration-y-direction-stddev**
     
**48-> fft-bodyacceleration-z-direction-stddev**
     
**49-> fft-bodyacceleration-x-direction-meanfrequency**
     
**50-> fft-bodyacceleration-y-direction-meanfrequency**
     
**51-> fft-bodyacceleration-z-direction-meanfrequency**
     
**52-> fft-bodyaccelerationjerk-x-direction-mean**
     
**53-> fft-bodyaccelerationjerk-y-direction-mean**
     
**54-> fft-bodyaccelerationjerk-z-direction-mean**
     
**55-> fft-bodyaccelerationjerk-x-direction-stddev**
     
**56-> fft-bodyaccelerationjerk-y-direction-stddev**
     
**57-> fft-bodyaccelerationjerk-z-direction-stddev**
     
**58-> fft-bodyaccelerationjerk-x-direction-meanfrequency**
     
**59-> fft-bodyaccelerationjerk-y-direction-meanfrequency**
     
**60-> fft-bodyaccelerationjerk-z-direction-meanfrequency**
     
**61-> fft-bodygyro-x-direction-mean**
     
**62-> fft-bodygyro-y-direction-mean**
     
**63-> fft-bodygyro-z-direction-mean**
     
**64-> fft-bodygyro-x-direction-stddev**
     
**65-> fft-bodygyro-y-direction-stddev**
     
**66-> fft-bodygyro-z-direction-stddev**
     
**67-> fft-bodygyro-x-direction-meanfrequency**
     
**68-> fft-bodygyro-y-direction-meanfrequency**
     
**69-> fft-bodygyro-z-direction-meanfrequency**
     
**70-> fft-bodyaccelerationmagnitude-mean**
     
**71-> fft-bodyaccelerationmagnitude-stddev**
     
**72-> fft-bodyaccelerationmagnitude-meanfrequency**
     
**73-> fft-bodybodyaccelerationjerkmagnitude-mean**
     
**74-> fft-bodybodyaccelerationjerkmagnitude-stddev**
     
**75-> fft-bodybodyaccelerationjerkmagnitude-meanfrequency**
     
**76-> fft-bodybodygyromagnitude-mean**
     
**77-> fft-bodybodygyromagnitude-stddev**
     
**78-> fft-bodybodygyromagnitude-meanfrequency**
     
**79-> fft-bodybodygyrojerkmagnitude-mean**
     
**80-> fft-bodybodygyrojerkmagnitude-stddev**
     
**81-> fft-bodybodygyrojerkmagnitude-meanfrequency**
     
**82-> angle-timesignalbodyacceleration-gravity-mean**
     
**83-> angle-timesignalbodyaccelerationjerk-gravity-mean**
     
**84-> angle-timesignalbodygyro-gravity-mean**
    
**85-> angle-timesignalbodygyrojerk-gravity-mean**
     
**86-> angle-x-gravity-mean**
     
**87-> angle-y-gravity-mean**
     
**88-> angle-z-gravity-mean**