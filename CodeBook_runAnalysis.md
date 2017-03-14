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
  subject Activity_Label tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X
1       1        WALKING         0.2656969       -0.01829817        -0.1078457            0.7448674
  tGravityAcc-mean()-Y tGravityAcc-mean()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y
1          -0.08255626           0.07233987            0.07709305            0.01659084
  tBodyAccJerk-mean()-Z tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
1          -0.009107587        -0.02087641        -0.08807227         0.08626417
  tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z tBodyAccMag-mean()
1            -0.09711202            -0.04171648             -0.0471394         -0.4536329
  tGravityAccMag-mean() tBodyAccJerkMag-mean() tBodyGyroMag-mean() tBodyGyroJerkMag-mean()
1            -0.4536329             -0.5454316          -0.4754048              -0.6395174
  fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y
1        -0.5318952        -0.4064354        -0.5964112            -0.5473489            -0.5073436
  fBodyAccJerk-mean()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z fBodyAccMag-mean()
1            -0.6953051         -0.6232192         -0.5053094         -0.5535291         -0.4784485
  fBodyBodyAccJerkMag-mean() fBodyBodyGyroMag-mean() fBodyBodyGyroJerkMag-mean() tBodyAcc-std()-X
1                 -0.4990758              -0.5350028                  -0.6459707       -0.5457953
  tBodyAcc-std()-Y tBodyAcc-std()-Z tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
1       -0.3677162       -0.5026457          -0.9598594          -0.9511506          -0.9258176
  tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z tBodyGyro-std()-X tBodyGyro-std()-Y
1           -0.5247219           -0.4704124           -0.7173223        -0.6865557        -0.4509798
  tBodyGyro-std()-Z tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
1        -0.5974961            -0.6378127            -0.6344722             -0.664592
  tBodyAccMag-std() tGravityAccMag-std() tBodyAccJerkMag-std() tBodyGyroMag-std()
1        -0.4970964           -0.4970964            -0.5159222         -0.4998396
  tBodyGyroJerkMag-std() fBodyAcc-std()-X fBodyAcc-std()-Y fBodyAcc-std()-Z fBodyAccJerk-std()-X
1             -0.6520508       -0.5530606       -0.3901509       -0.4985831           -0.5439798
  fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z
1           -0.4662517           -0.7378619        -0.7082634        -0.4298258        -0.6504762
  fBodyAccMag-std() fBodyBodyAccJerkMag-std() fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-std()
1        -0.5897102                -0.5418231             -0.5665767                 -0.6858113
