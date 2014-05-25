# Code Book
## Content
The data set is stored in a file called 'tidy.dataset.txt' and contains a table with the average values for <b>mean</b> and <b>standard deviations<b> for a set of experiments.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (<i>WALKING</i>, <i>WALKING_UPSTAIRS</i>, <i>WALKING_DOWNSTAIRS</i>, <i>SITTING</i>, <i>STANDING</i>, <i>LAYING</i>) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the 3.axial linear acceleration and 3.axial angular velocity at a constant rate of 50Hz were captured. The acceleration signal was then separated into body and gravity acceleration signals ('tbodyacc.xyz' and 'tgravityacc.xyz').

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals ('tbodyaccjerk.xyz' and tbodygyrojerk.xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc.xyz, fbodyaccjerk.xyz, fbodygyro.xyz, fbodyaccferkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

'.xyz' is used to denote 3-axial signals in the X, Y and Z directions.

## Variables
The data set contains rows for each subject and activity. The row values are the mean and standard deviations for the measurements described above. The variable names follow the following syntax:

    (t|f)(body|gravity)(acc|gyro)(jerk|mag|jerkmag)*.(std|mean)(.x|.y|.z)*

where 

* values separated by '|' are or-values
* expressions tagged with '*' makes them optional
* 't': used to denote time
* 'f': used to indicate frequency domain signals
* 'body': body acceleration
* 'gravity': gravity acceleration
* 'acc': values measured by a accelerometer
* 'gyro': values measured by a gyroscope
* 'jerk': Jerk signals
* 'mag': the magnitude calculated using the Euclidean norm
* 'jerkmag': the magnitude of the Jerk signla calculated using the Euclidean norm
* 'std' is a standard deviation
* 'mean' is the mean value
* '.x', ".y', '.z' is used to denote 3-axial signals in the X, Y and Z directions.

Note that the variable names contain dots (.) although this not recommended in the lectures. But I think one kind of a separator is needed to get readable names and dots are allowed by the Google coding guide lines, so...

This results in the following list of variables:

* "subject": the id of the volunteer (integer with range 1-30)
* "activity": the activity that was carried out (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
* "tbodyacc.mean.x" 
* "tbodyacc.mean.y" 
* "tbodyacc.mean.z" 
* "tbodyacc.std.x" 
* "tbodyacc.std.y" 
* "tbodyacc.std.z" 
* "tgravityacc.mean.x" 
* "tgravityacc.mean.y" 
* "tgravityacc.mean.z" 
* "tgravityacc.std.x" 
* "tgravityacc.std.y" 
* "tgravityacc.std.z" 
* "tbodyaccjerk.mean.x" 
* "tbodyaccjerk.mean.y" 
* "tbodyaccjerk.mean.z" 
* "tbodyaccjerk.std.x" 
* "tbodyaccjerk.std.y" 
* "tbodyaccjerk.std.z" 
* "tbodygyro.mean.x" 
* "tbodygyro.mean.y" 
* "tbodygyro.mean.z" 
* "tbodygyro.std.x" 
* "tbodygyro.std.y" 
* "tbodygyro.std.z" 
* "tbodygyrojerk.mean.x" 
* "tbodygyrojerk.mean.y" 
* "tbodygyrojerk.mean.z" 
* "tbodygyrojerk.std.x" 
* "tbodygyrojerk.std.y" 
* "tbodygyrojerk.std.z" 
* "tbodyaccmag.mean" 
* "tbodyaccmag.std" 
* "tgravityaccmag.mean" 
* "tgravityaccmag.std" 
* "tbodyaccjerkmag.mean" 
* "tbodyaccjerkmag.std" 
* "tbodygyromag.mean" 
* "tbodygyromag.std" 
* "tbodygyrojerkmag.mean" 
* "tbodygyrojerkmag.std" 
* "fbodyacc.mean.x" 
* "fbodyacc.mean.y" 
* "fbodyacc.mean.z" 
* "fbodyacc.std.x" 
* "fbodyacc.std.y" 
* "fbodyacc.std.z" 
* "fbodyaccjerk.mean.x" 
* "fbodyaccjerk.mean.y" 
* "fbodyaccjerk.mean.z" 
* "fbodyaccjerk.std.x" 
* "fbodyaccjerk.std.y" 
* "fbodyaccjerk.std.z" 
* "fbodygyro.mean.x" 
* "fbodygyro.mean.y" 
* "fbodygyro.mean.z" 
* "fbodygyro.std.x" 
* "fbodygyro.std.y" 
* "fbodygyro.std.z" 
* "fbodyaccmag.mean" 
* "fbodyaccmag.std" 
* "fbodyaccjerkmag.mean" 
* "fbodyaccjerkmag.std" 
* "fbodygyromag.mean" 
* "fbodygyromag.std" 
* "fbodygyrojerkmag.mean" 
* "fbodygyrojerkmag.std"
