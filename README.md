GettingData
===========

Getting and Sharing Data Course

The file loads all the data sets into the respectively named variables

The train and test data for X, Y and subject are then joined using rbind

The required columns are then automatically extracted from the features.txt file. It was assumed that any variable with mean or std in the name was required

Lines 35-41 replace the numeric activity labels with the descriptions given in activity.txt

Lines 43-44 melt the data and reshape it (summarising by the mean) to give the data required in step 5.
