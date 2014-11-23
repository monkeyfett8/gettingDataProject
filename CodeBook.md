# Data CodeBook
The averagedDataTable.txt file shows a reduced set of data showing all participants data averaged per subject and activity.  Each row is an averaged set of observations for one subject doing one activity.  For example, subject one (1) is WALKING_UP_STAIRS.

The fullDataTable.txt is the unaverages source data for averagedDataTable.txt if required.  Each observation in the averaged data set is the average of 79 individual data observations from the full data table.  

## Dataset Variable Columns
Variables are shown in order for dataset as columns listed at the end of this document.
Each row is a single subject and activity.
Data is separated by t and f categories, denoted by preceeding letters
Following this category is the measurment type, for example GravityAcc
The third part of the notation, separated by an underscore "_" is the data preprocessor that was applied, either mean (_mean) or standard deviation (_std).
Finally some data is shown for an axis X,Y,orZ as denoted by the final letter following a second underscore.  Not all variables use an axis and the axis is omitted.


subjectNumber             
activityType              
tBodyAcc_mean_X           
tBodyAcc_mean_Y          
tBodyAcc_mean_Z           
tBodyAcc_std_X            
tBodyAcc_std_Y            
tBodyAcc_std_Z           
tGravityAcc_mean_X        
tGravityAcc_mean_Y        
tGravityAcc_mean_Z        
tGravityAcc_std_X        
tGravityAcc_std_Y         
tGravityAcc_std_Z         
tBodyAccJerk_mean_X       
tBodyAccJerk_mean_Y      
tBodyAccJerk_mean_Z       
tBodyAccJerk_std_X        
tBodyAccJerk_std_Y        
tBodyAccJerk_std_Z       
tBodyGyro_mean_X          
tBodyGyro_mean_Y          
tBodyGyro_mean_Z          
tBodyGyro_std_X          
tBodyGyro_std_Y          
tBodyGyro_std_Z          
tBodyGyroJerk_mean_X     
tBodyGyroJerk_mean_Y     
tBodyGyroJerk_mean_Z     
tBodyGyroJerk_std_X     
tBodyGyroJerk_std_Y       
tBodyGyroJerk_std_Z      
tBodyAccMag_mean         
tBodyAccMag_std          
tGravityAccMag_mean       
tGravityAccMag_std       
tBodyAccJerkMag_mean      
tBodyAccJerkMag_std       
tBodyGyroMag_mean         
tBodyGyroMag_std         
tBodyGyroJerkMag_mean     
tBodyGyroJerkMag_std      
fBodyAcc_mean_X           
fBodyAcc_mean_Y          
fBodyAcc_mean_Z           
fBodyAcc_std_X            
fBodyAcc_std_Y            
fBodyAcc_std_Z           
fBodyAccJerk_mean_X       
fBodyAccJerk_mean_Y       
fBodyAccJerk_mean_Z       
fBodyAccJerk_std_X       
fBodyAccJerk_std_Y        
fBodyAccJerk_std_Z        
fBodyGyro_mean_X          
fBodyGyro_mean_Y         
fBodyGyro_mean_Z          
fBodyGyro_std_X           
fBodyGyro_std_Y           
fBodyGyro_std_Z          
fBodyAccMag_mean          
fBodyAccMag_std           
fBodyBodyAccJerkMag_mean  
fBodyBodyAccJerkMag_std  
fBodyBodyGyroMag_mean     
fBodyBodyGyroMag_std      
fBodyBodyGyroJerkMag_mean 
fBodyBodyGyroJerkMag_std 