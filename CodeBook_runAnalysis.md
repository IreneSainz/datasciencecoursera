# Code Book

This document describes, in more detail the code inside `run_analysis.R`.

The script first sets the working directory as we can see direction given is the root from you home working directory to the main folder of the downloaded data
"UCI HAR Dataset"

If you have installed data.table and reshape2 libraries, lines 5 and 6 aren't needed.

We read all text files that are needed for our analysis which type of activities have been monitored with the accelerometers:

> activityLabels
*  V1                 V2

*1  1            WALKING

*2  2   WALKING_UPSTAIRS

*3  3 WALKING_DOWNSTAIRS

*4  4            SITTING

*5  5           STANDING

*6  6             LAYING

Which functions have been monitored, like the ones we are interested in for this analysis (mean and deviation) in variable "features"
Values of the measures are described in xtext,xtrain,ytest and ytrain.
Also we read to which subject belongs the given measures.
We extract those columns that refer to the functions,in which we are interested to evaluate in the analysis
After that we must have a neat data set so we can apply the mean to the variables aggregated by activity and subject
When we aggregate by activity and subject we calculate the mean of the variables in the aggregation and then write the table to a txt file.

> head(dcastdata,1)

*  subject Activity_Label tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X
* 1       1        WALKING         0.2656969       -0.01829817        -0.1078457            0.7448674
 
