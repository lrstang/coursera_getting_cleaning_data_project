# Coursera Getting and Cleaning Data Course/Week 4 Project Readme

## Background

Week 4 of this course includes a "tidy data" project exercise that encompasses the learnings acquired throughout the course.  The deliverables for the project are:

 * An R script to process Samsung phone test and training sensor data as described in the exercise instructions
 * Provide a Codebook markdown document that describes the script processes and the data elements in the resulting output
 * This document, a README markdown file that outlines the contents of this git repo
 * An output dataset that provides the data value means for the specified measurement variables.  This dataset is submitted via the Coursera website and not included in this repo
 
Files in the repo:
* README.md - this readme file
* Codebook.md - the codebook markdown deliverable described above
* run_analysis.R - the R script deliverable described above
* read_results.R - an R script to read the output generated by run_analysis.R

## Assumptions

The R script requires that the following files be located in your R working directory to successfully complete:
* y_train.txt (record activity IDs)
* X_test.txt (test subject measurements data)
* y_test.txt (record activity IDs)
* X_train.txt (training subject measurements data)
* activity_labels.txt (activity descriptions by ID)
* features.txt (raw measurement data variable names)
* subject_test.txt (test subject IDs)
* subject_train.txt (training subject IDs)
* run_analysis.R (R processing script)

The run_analysis.R script will generate the following output file in your R working directory:
* Wk4Proj_DataSummary.txt

The following code, from read_results.R, can be used to read Wk4Proj_DataSummary.txt

```R
$ <df_var> <- read.table("Wk4Proj_DataSummary.txt",header=TRUE)
```

## Resources

Project source data and documentation in a .zip format can be found here:

[Project Source Files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Detailed information related to source data collection can be found here:

[Device Measurement Data Collection Details](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Running the Script

* Place all files described in the Assumption section into a single directory
* Ensure the directory above your R working directory

### From the Command Line:

* Navigate to the directory/folder containing the files above

```R
$ Rscript run_analysis.R
```

### From RStudio

* Launch **RStudio**
* In the **Console window**, set the working directory using **setwd()** function
* Open the run_analysis.R script file
* Run the code by pressing the **Source** button located in upper right side of the script editor window
