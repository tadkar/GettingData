GettingData
===========

Getting and Sharing Data Course week 3 assignment

* This script assumes that all the data is unzipped and stored in the current working directory.

* This also assumes that the requirement is for all variables with mean or std in their name

* The file loads all the data sets into the respectively named variables and then joins using rbind

* The required columns are then automatically extracted from the features.txt file. It was assumed that any variable with mean or std in the name was required

* Lines 35-41 replace the numeric activity labels with the descriptions given in activity.txt

* Lines 43-44 melt the data and reshape it (summarising by the mean) to give the data required in step 5.
