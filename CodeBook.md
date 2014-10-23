#Code Book
==========

<br>
This codebook describes the variables, the data, and any transformations or work 
that is performed to clean up the data.

The tidy dataset contains the average of each variable for each activity and each subject.  

**Following steps have been performed to create the tidy data set:**  
1. Merge the test and training data set to create one data set.  
2. Extract only measurements on the mean and standard deviation for each measurement.   
3. Apply descriptive names to activities from file activity_labels.txt  
4. Label the data set with descriptive variable names from file features.txt  
5. Create final data set with the average of each variable for each activity and each subject.    

<br>

**The tidy data set contains following variables:**

**activity_label**  
  Variable for each activity type:  
  WALKING  
  WALKING_UPSTAIRS  
  WALKING_DOWNSTAIRS  
  SITTING  
  STANDING  
  LAYING  


**subject**  
Variable to identify each of the 30 subjects going from 1 to 30.

  
Following variables contain the mean/average for each estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**tBodyAcc-XYZ**  
**tGravityAcc-XYZ**  
**tBodyAccJerk-XYZ**  
**tBodyGyro-XYZ**  
**tBodyGyroJerk-XYZ**  
**tBodyAccMag**  
**tGravityAccMag**  
**tBodyAccJerkMag**  
**tBodyGyroMag**  
**tBodyGyroJerkMag**  
**fBodyAcc-XYZ**  
**fBodyAccJerk-XYZ**  
**fBodyGyro-XYZ**  
**fBodyAccMag**   
**fBodyAccJerkMag**  
**fBodyGyroMag**  
**fBodyGyroJerkMag**  

The set of variables that were estimated from these signals are: 

**mean():** Mean value  
**std():** Standard deviation  

