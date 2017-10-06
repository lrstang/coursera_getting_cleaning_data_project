# Coursera Getting and Cleaning Data Course/Week 4 Project CodeBook

## Background

This CodeBook describes the processing of the run_analysis.R script and the data elements of the summarized file that it generates: Wk4Proj_DataSummary.txt.

Addition information about the project and script can be found in the repo README.md file.


## How the Data was Processed

The run_analysis.R script processes wearable Samsung phone sensor measurement data as follows:

1. Processes test and training participant activities data
2. Process test and training subject IDs
3. Merges activities and subjects, keep activity names
4. Adds test vs. training identifiers
5. Processes features to annotate measurement columns
6. Processes test and training measurement data
7. Adds subject and activity descriptions to respective measurement data
8. Combines test and training measurement data
9. Keeps only the mean and std deviation measurements
10. Normalizes variable names
11. Creates file with variable/column names for codebook.md
12. Groups data by activity and subject in preparation for summarization
13. Summarizes data - means of all measurements
14. Writes summarized data to disk

Throughout the script, unused objects are dropped as appropriate



## Data Table Columns

The Wk4Proj_DataSummary.txt file can be directly read into R using read.table : read.table("Wk4Proj_DataSummary.txt").

The read_results.R script can be run to read the summarized data and to apply the appropriate column names to the data frame as specified here.

The following is a list of time and FFT measurement columns in positional order.  The names have been modified slightly to improve readability and are intended to be self describing.

* **1-activitydesc** 
* **2-subjectid**
* **3-timesignal-bodyacceleration-x-direction-mean**
* **4-timesignal-bodyacceleration-y-direction-mean**
* **5-timesignal-bodyacceleration-z-direction-mean**
* **6-timesignal-bodyacceleration-x-direction-stddev**
* **7-timesignal-bodyacceleration-y-direction-stddev**
* **8-timesignal-bodyacceleration-z-direction-stddev**
* **9-timesignal-gravityacceleration-x-direction-mean**
* **10-timesignal-gravityacceleration-y-direction-mean**
* **11-timesignal-gravityacceleration-z-direction-mean**
* **12-timesignal-gravityacceleration-x-direction-stddev**
* **13-timesignal-gravityacceleration-y-direction-stddev**
* **14-timesignal-gravityacceleration-z-direction-stddev**
* **15-timesignal-bodyaccelerationjerk-x-direction-mean**
* **16-timesignal-bodyaccelerationjerk-y-direction-mean**
* **17-timesignal-bodyaccelerationjerk-z-direction-mean**
* **18-timesignal-bodyaccelerationjerk-x-direction-stddev**
* **19-timesignal-bodyaccelerationjerk-y-direction-stddev**
* **20-timesignal-bodyaccelerationjerk-z-direction-stddev**
* **21-timesignal-bodygyro-x-direction-mean**
* **22-timesignal-bodygyro-y-direction-mean**
* **23-timesignal-bodygyro-z-direction-mean**
* **24-timesignal-bodygyro-x-direction-stddev**
* **25-timesignal-bodygyro-y-direction-stddev**
* **26-timesignal-bodygyro-z-direction-stddev**
* **27-timesignal-bodygyrojerk-x-direction-mean**
* **28-timesignal-bodygyrojerk-y-direction-mean**
* **29-timesignal-bodygyrojerk-z-direction-mean**
* **30-timesignal-bodygyrojerk-x-direction-stddev**
* **31-timesignal-bodygyrojerk-y-direction-stddev**
* **32-timesignal-bodygyrojerk-z-direction-stddev**
* **33-timesignal-bodyaccelerationmagnitude-mean**
* **34-timesignal-bodyaccelerationmagnitude-stddev**
* **35-timesignal-gravityaccelerationmagnitude-mean**
* **36-timesignal-gravityaccelerationmagnitude-stddev**
* **37-timesignal-bodyaccelerationjerkmagnitude-mean**
* **38-timesignal-bodyaccelerationjerkmagnitude-stddev**
* **39-timesignal-bodygyromagnitude-mean**
* **40-timesignal-bodygyromagnitude-stddev**
* **41-timesignal-bodygyrojerkmagnitude-mean**
* **42-timesignal-bodygyrojerkmagnitude-stddev**
* **43-fft-bodyacceleration-x-direction-mean**
* **44-fft-bodyacceleration-y-direction-mean**
* **45-fft-bodyacceleration-z-direction-mean**
* **46-fft-bodyacceleration-x-direction-stddev**
* **47-fft-bodyacceleration-y-direction-stddev**
* **48-fft-bodyacceleration-z-direction-stddev**
* **49-fft-bodyacceleration-x-direction-meanfrequency**
* **50-fft-bodyacceleration-y-direction-meanfrequency**
* **51-fft-bodyacceleration-z-direction-meanfrequency**
* **52-fft-bodyaccelerationjerk-x-direction-mean**
* **53-fft-bodyaccelerationjerk-y-direction-mean**
* **54-fft-bodyaccelerationjerk-z-direction-mean**
* **55-fft-bodyaccelerationjerk-x-direction-stddev**
* **56-fft-bodyaccelerationjerk-y-direction-stddev**
* **57-fft-bodyaccelerationjerk-z-direction-stddev**
* **58-fft-bodyaccelerationjerk-x-direction-meanfrequency**
* **59-fft-bodyaccelerationjerk-y-direction-meanfrequency**
* **60-fft-bodyaccelerationjerk-z-direction-meanfrequency**
* **61-fft-bodygyro-x-direction-mean**
* **62-fft-bodygyro-y-direction-mean**
* **63-fft-bodygyro-z-direction-mean**
* **64-fft-bodygyro-x-direction-stddev**
* **65-fft-bodygyro-y-direction-stddev**
* **66-fft-bodygyro-z-direction-stddev**
* **67-fft-bodygyro-x-direction-meanfrequency**
* **68-fft-bodygyro-y-direction-meanfrequency**
* **69-fft-bodygyro-z-direction-meanfrequency**
* **70-fft-bodyaccelerationmagnitude-mean**
* **71-fft-bodyaccelerationmagnitude-stddev**
* **72-fft-bodyaccelerationmagnitude-meanfrequency**
* **73-fft-bodybodyaccelerationjerkmagnitude-mean**
* **74-fft-bodybodyaccelerationjerkmagnitude-stddev**
* **75-fft-bodybodyaccelerationjerkmagnitude-meanfrequency**
* **76-fft-bodybodygyromagnitude-mean**
* **77-fft-bodybodygyromagnitude-stddev**
* **78-fft-bodybodygyromagnitude-meanfrequency**
* **79-fft-bodybodygyrojerkmagnitude-mean**
* **80-fft-bodybodygyrojerkmagnitude-stddev**
* **81-fft-bodybodygyrojerkmagnitude-meanfrequency**
* **82-angle-timesignalbodyacceleration-gravity-mean**
* **83-angle-timesignalbodyaccelerationjerk-gravity-mean**
* **84-angle-timesignalbodygyro-gravity-mean**
* **85-angle-timesignalbodygyrojerk-gravity-mean**
* **86-angle-x-gravity-mean**
* **87-angle-y-gravity-mean**
* **88-angle-z-gravity-mean**