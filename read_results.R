#
# read_results.R
#
# This script reads summarize phone sensor measurements and applies variable/column nice names
#

# read summarized measurement data
datasummaryDF <- read.table("Wk4Proj_DataSummary.txt")

# read dataset containing nice variable/column names
varNamesDF <- read.table("tidycolnames4MD.txt")

# apply nice column names to DF
colnames(datasummaryDF) <- varNamesDF[,2]

# describe summarized dataframe
str(datasummaryDF)
