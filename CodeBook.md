CodeBook
===========

Summary
-----------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The activity values contained in the y_train and y_test data sets were recoded to their descriptive labels using the lookup table in activity_labels.txt

<pre>
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
</pre>

Script Variables
-----------------
* meanCols - indices of the columns that contain mean in the name
* stdCols - indices of the columns that contain std in the name
* dataCols - concatenation of the above two, used to extract the required features
* mergedX, mergedY, mergedSubject - merged datasets using rbind. The dats contains no missing or overlapping values
* data - contains the tidy output data
* out - contains data for the mean of each measured variable broken down by subject and activity


Output format
-------------

The script exports tidydata.txt and tidydatasummary.txt. 

tidydata.txt contains a list of measurements of the 79 variables with mean or std in their name followed by a final 2 columns of subject ID and activity. For example the first 6 lines of the last 4 columns in the file are.

<pre>
fBodyBodyGyroJerkMag-std() fBodyBodyGyroJerkMag-meanFreq() Subject Activity
1                 -0.9906975                     -0.07432303       1 STANDING
2                 -0.9963995                      0.15807454       1 STANDING
3                 -0.9951274                      0.41450281       1 STANDING
4                 -0.9952369                      0.40457253       1 STANDING
5                 -0.9954648                      0.08775301       1 STANDING
6                 -0.9952387                      0.01995331       1 STANDING
</pre>

The first column is the id of the subject providing the data, the second is the activity being performed. The remaining columns contain the average of each measurement for the combination of subject ID and activity.

<pre>
   Subject           Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1       1             LAYING         0.2215982      -0.040513953        -0.1132036
2       1            SITTING         0.2612376      -0.001308288        -0.1045442
3       1           STANDING         0.2789176      -0.016137590        -0.1106018
4       1            WALKING         0.2773308      -0.017383819        -0.1111481
5       1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662
6       1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020
</pre>

For example, the 0.2215982 in the first line of the output is the mean of tBodyAcc-mean()-X when subject 1 is laying down.

References
-------------
 * [1] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

