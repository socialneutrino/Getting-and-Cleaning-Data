CodeBook.md

This code book explains:
1. How the data was processed
2. Lists the variable names and what they are

1. How the data was processed:

First of all the test data was read from the file "X_test.txt"
"subject_test.txt" and the activities in "y_test.txt" were connected as columns to the data frame
by using cbind() function

Next the training data was read from the file "X_train.txt"
"subject_train.txt" and the activities in "y_train.txt" were connected as columns to the data frame
by using cbind() function

These two data frames were then merged using rbind()

Then the feature names were read from file and the numbers and spaces cut from each line and placed in a character vector
These were added as column names to the main data set using colnames(), but with the column names "Subject" and "Activity" added

The data set was subsetted. Only columns with variables names that had "mean" or "std" as part of their
character string were selected.

After this "activity_labels.txt" was read in and merged with the above  data set to create activity desriptions of subjects

unnecessary punctuation was then removed from feature variable names

Use dplyr package to group data frame by Subject and ActivityDescription
Use summarise_each function from dplyr package to create means
Create "Tidy Data" set of each combination of Subject and Activity Description. Write to file.

2. Lists the variable names and what they are:

"Subject" - Each number identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
"ActivityDescription" - one of the six activities performed by subject

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

These were then found using the mean to create a new dataset of the ones below:

"tBodyAccmeanX"
"tBodyAccmeanY"
"tBodyAccmeanZ"
"tBodyAccstdX"
"tBodyAccstdY"
"tBodyAccstdZ"
"tBodyAccJerkmeanX"
"tBodyAccJerkmeanY"
"tBodyAccJerkmeanZ"
"tBodyAccJerkstdX"
"tBodyAccJerkstdY"
"tBodyAccJerkstdZ"
"tBodyGyromeanX"
"tBodyGyromeanY"
"tBodyGyromeanZ"
"tBodyGyrostdX"
"tBodyGyrostdY"
"tBodyGyrostdZ"
"tBodyGyroJerkmeanX"
"tBodyGyroJerkmeanY"
"tBodyGyroJerkmeanZ"
"tBodyGyroJerkstdX"
"tBodyGyroJerkstdY"
"tBodyGyroJerkstdZ"
"tBodyAccMagmean"
"tBodyAccMagstd"
"tBodyAccJerkMagmean"
"tBodyAccJerkMagstd"
"tBodyGyroMagmean"
"tBodyGyroMagstd"
"tBodyGyroJerkMagmean"
"tBodyGyroJerkMagstd"
"tGravityAccmeanX"
"tGravityAccmeanY"
"tGravityAccmeanZ"
"tGravityAccstdX"
"tGravityAccstdY"
"tGravityAccstdZ"
"tGravityAccMagmean"
"tGravityAccMagstd"
"fBodyAccmeanX"
"fBodyAccmeanY"
"fBodyAccmeanZ"
"fBodyAccstdX"
"fBodyAccstdY"
"fBodyAccstdZ"
"fBodyAccJerkmeanX"
"fBodyAccJerkmeanY"
"fBodyAccJerkmeanZ"
"fBodyAccJerkstdX"
"fBodyAccJerkstdY"
"fBodyAccJerkstdZ"
"fBodyGyromeanX"
"fBodyGyromeanY"
"fBodyGyromeanZ"
"fBodyGyrostdX" 
"fBodyGyrostdY"
"fBodyGyrostdZ"
"fBodyAccMagmean"
"fBodyAccMagstd"
"fBodyBodyAccJerkMagmean"
"fBodyBodyAccJerkMagstd" 
"fBodyBodyGyroMagmean" 
"fBodyBodyGyroMagstd" 
"fBodyBodyGyroJerkMagmean"
"fBodyBodyGyroJerkMagstd"
