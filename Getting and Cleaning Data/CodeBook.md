## Variables

The tidy data set contains 68 variables, which are presented in the table as below.

| No. | Name of Variable            |
|-----|-----------------------------|
| 1   | subject                     |
| 2   | activity                    |
| 3   | tBodyAcc-mean()-X           |
| 4   | tBodyAcc-mean()-Y           |
| 5   | tBodyAcc-mean()-Z           |
| 6   | tBodyAcc-std()-X            |
| 7   | tBodyAcc-std()-Y            |
| 8   | tBodyAcc-std()-Z            |
| 9   | tGravityAcc-mean()-X        |
| 10  | tGravityAcc-mean()-Y        |
| 11  | tGravityAcc-mean()-Z        |
| 12  | tGravityAcc-std()-X         |
| 13  | tGravityAcc-std()-Y         |
| 14  | tGravityAcc-std()-Z         |
| 15  | tBodyAccJerk-mean()-X       |
| 16  | tBodyAccJerk-mean()-Y       |
| 17  | tBodyAccJerk-mean()-Z       |
| 18  | tBodyAccJerk-std()-X        |
| 19  | tBodyAccJerk-std()-Y        |
| 20  | tBodyAccJerk-std()-Z        |
| 21  | tBodyGyro-mean()-X          |
| 22  | tBodyGyro-mean()-Y          |
| 23  | tBodyGyro-mean()-Z          |
| 24  | tBodyGyro-std()-X           |
| 25  | tBodyGyro-std()-Y           |
| 26  | tBodyGyro-std()-Z           |
| 27  | tBodyGyroJerk-mean()-X      |
| 28  | tBodyGyroJerk-mean()-Y      |
| 29  | tBodyGyroJerk-mean()-Z      |
| 30  | tBodyGyroJerk-std()-X       |
| 31  | tBodyGyroJerk-std()-Y       |
| 32  | tBodyGyroJerk-std()-Z       |
| 33  | tBodyAccMag-mean()          |
| 34  | tBodyAccMag-std()           |
| 35  | tGravityAccMag-mean()       |
| 36  | tGravityAccMag-std()        |
| 37  | tBodyAccJerkMag-mean()      |
| 38  | tBodyAccJerkMag-std()       |
| 39  | tBodyGyroMag-mean()         |
| 40  | tBodyGyroMag-std()          |
| 41  | tBodyGyroJerkMag-mean()     |
| 42  | tBodyGyroJerkMag-std()      |
| 43  | fBodyAcc-mean()-X           |
| 44  | fBodyAcc-mean()-Y           |
| 45  | fBodyAcc-mean()-Z           |
| 46  | fBodyAcc-std()-X            |
| 47  | fBodyAcc-std()-Y            |
| 48  | fBodyAcc-std()-Z            |
| 49  | fBodyAccJerk-mean()-X       |
| 50  | fBodyAccJerk-mean()-Y       |
| 51  | fBodyAccJerk-mean()-Z       |
| 52  | fBodyAccJerk-std()-X        |
| 53  | fBodyAccJerk-std()-Y        |
| 54  | fBodyAccJerk-std()-Z        |
| 55  | fBodyGyro-mean()-X          |
| 56  | fBodyGyro-mean()-Y          |
| 57  | fBodyGyro-mean()-Z          |
| 58  | fBodyGyro-std()-X           |
| 59  | fBodyGyro-std()-Y           |
| 60  | fBodyGyro-std()-Z           |
| 61  | fBodyAccMag-mean()          |
| 62  | fBodyAccMag-std()           |
| 63  | fBodyBodyAccJerkMag-mean()  |
| 64  | fBodyBodyAccJerkMag-std()   |
| 65  | fBodyBodyGyroMag-mean()     |
| 66  | fBodyBodyGyroMag-std()      |
| 67  | fBodyBodyGyroJerkMag-mean() |
| 68  | fBodyBodyGyroJerkMag-std()  |

- Variable _subject_ indicates which subject this observation belongs to, from 1 to 30.

- Variable _activity_ indicates which activity produces this observation.

- Variable 3-68 indicates the data derived by the accelerator and gyroscope.

  - The prefix _t_ and _f_. _t_ stands for time domain signals. _f_ stands for frequency domain signals, calculated from corresponding time domain signals using the _Fast Fourier Transform (FFT)_.
  - _BodyAcc_ and _GravityAcc_ stand for the signals of the body and the gravity linear acceleration.
  - _BodyGyro_ stands for the signals of the signals of the body angular velocity.
  - _Jerk_ stands for the jerk data derived from the body linear acceleration and angular velocity.
  - _Mag_ stands for the data calculated using the _Euclidean norm_.
  - _mean()_ stands for mean value of the corresponding signals. _std()_ stands for standard deviation value of the corresponding signals.
  - The suffix _X_, _Y_, and _Z_ stand for 3-axial signals in the X, Y and Z directions.

## Data

The tidy data set contains 180 observations, 68 variables for each observation, which indicates the mean values of the signals and transforming data derived from the body accelerator, the gravity accelerator and the body gyroscope. Every observation represents one subject with one activity.

## Procedure

The tidy data set is created using the script _run_analysis.R_ of R language.

Reading the raw data files, two sets of the data _training_ and _test_ is combined into a large table. Then all the mean and stand deviation values are extracted to establish an independent table. Subsequently, the mean values of each variable are calculated for each subject and each activity. Finally, the result is put into a text file as the tidy data set.
