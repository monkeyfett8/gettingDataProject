# Data CodeBook
The averagedDataTable.txt file shows a reduced set of data showing all participants data averaged per subject and activity.  Each row is an averaged set of observations for one subject doing one activity.  For example, subject one (1) is WALKING_UP_STAIRS.

The fullDataTable.txt is the unaverages source data for averagedDataTable.txt if required.  Each observation in the averaged data set is the average of 79 individual data observations from the full data table.  

## run_analysis.R process
* Step 1: The script determines if data alreaday exists and if not, downloads the data from the source.
* Step 2: The script loads the labels for the various activities from a text file activity_labels.txt
* Step 3: The variable header names are read from features.txt.
* Step 4: The training data is pulled for the subject numbers, raw data, and the activity state at each observation
* Step 5: The variable header labels (from step 2) are applied to the dataset previously from step 4.
* Step 6: The activity type is converted from a number code to the text name of the activity.
* Step 7: The 3 sets of data from the subject, activity type, and raw data are combined into a single table.
* Step 8: The process of step 4 through 7 is repeated for the test data which follows the same format.
* Step 9: The test and training data are combined together into a single table.
* Step 10: Since we are only interested in mean and standard deviations of each variable, all other variables are removed by column with associated numerical data.
* Step 11: The data labels are then cleaned to allow R to import and export the data set effectively and help the data be read easier by a human.
* Step 12: The table is then writen out in raw form.  This is not required, but may be helpful to some users.
* Step 13: The table is averaged by each subject and activity. That is, for each of the 30 subjects, the various readings (79 each) for each sactivity type are averaged.  This leaves only 6 data points for each subject, one for each activity type.
* Step 14: This averaged data table is then saved to the user to operate as needed.

## Dataset Variable Setup
Variables are shown in order for dataset as columns listed at the end of this document. Each row is a single subject and activity. Data is separated by time and frequency categories, denoted by preceeding letters "t" and "f" respectively. Following this category is the measurment type, for example GravityAcc The third part of the notation, separated by an underscore "_" is the data preprocessor that was applied, either mean (_mean) or standard deviation (_std). Finally some data is shown for an axis X,Y,orZ as denoted by the final letter following a second underscore.  Not all variables use an axis and the axis is omitted.

### Data variable data detail
Time domain data (prefix "t") - captured at 50Hz rate filtered at 20 Hz corner frequency to remove noise.

Frequency domain data (prefix "f") - is time domain data filtered with a butterworth filter with a corner frequency of 0.3 Hz.

Acceleration and Jerk signals are calculated using Euclidean norms. (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)

Fast Fourier Transform (FFT) was applied to signals. (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag)

Variables are further simplified with two methods, mean (denoted _mean) and standard deviation (_std) for each raw signal.

_X,_Y,_Z denotes the axis of the measurment.

### Activity Types
There are 6 activity types under the activityType variable: 
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### All Variable headers in order
subjectNumber             
activityType              
* tBodyAcc_mean_X           
* tBodyAcc_mean_Y          
* tBodyAcc_mean_Z           
* tBodyAcc_std_X            
* tBodyAcc_std_Y            
* tBodyAcc_std_Z           
* tGravityAcc_mean_X        
* tGravityAcc_mean_Y        
* tGravityAcc_mean_Z        
* tGravityAcc_std_X        
* tGravityAcc_std_Y         
* tGravityAcc_std_Z         
* tBodyAccJerk_mean_X       
* tBodyAccJerk_mean_Y      
* tBodyAccJerk_mean_Z       
* tBodyAccJerk_std_X        
* tBodyAccJerk_std_Y        
* tBodyAccJerk_std_Z       
* tBodyGyro_mean_X          
* tBodyGyro_mean_Y          
* tBodyGyro_mean_Z          
* tBodyGyro_std_X          
* tBodyGyro_std_Y          
* tBodyGyro_std_Z          
* tBodyGyroJerk_mean_X     
* tBodyGyroJerk_mean_Y     
* tBodyGyroJerk_mean_Z     
* tBodyGyroJerk_std_X     
* tBodyGyroJerk_std_Y       
* tBodyGyroJerk_std_Z      
* tBodyAccMag_mean         
* tBodyAccMag_std          
* tGravityAccMag_mean       
* tGravityAccMag_std       
* tBodyAccJerkMag_mean      
* tBodyAccJerkMag_std       
* tBodyGyroMag_mean         
* tBodyGyroMag_std         
* tBodyGyroJerkMag_mean     
* tBodyGyroJerkMag_std      
* fBodyAcc_mean_X           
* fBodyAcc_mean_Y          
* fBodyAcc_mean_Z           
* fBodyAcc_std_X            
* fBodyAcc_std_Y            
* fBodyAcc_std_Z           
* fBodyAccJerk_mean_X       
* fBodyAccJerk_mean_Y       
* fBodyAccJerk_mean_Z       
* fBodyAccJerk_std_X       
* fBodyAccJerk_std_Y        
* fBodyAccJerk_std_Z        
* fBodyGyro_mean_X          
* fBodyGyro_mean_Y         
* fBodyGyro_mean_Z          
* BodyGyro_std_X           
* fBodyGyro_std_Y           
* fBodyGyro_std_Z          
* fBodyAccMag_mean          
* fBodyAccMag_std           
* fBodyBodyAccJerkMag_mean  
* fBodyBodyAccJerkMag_std  
* fBodyBodyGyroMag_mean     
* fBodyBodyGyroMag_std      
* fBodyBodyGyroJerkMag_mean
* fBodyBodyGyroJerkMag_std 