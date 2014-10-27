The data file is called "Samsung Summary Data.txt" and includes 9 columns. Each column represents the mean for that Activity for the Measurement and Subject Number listed in that row

LAYING: Mean for this activity variable for the listed Subject Number and Activity.  Values are floats.

SITTING: Mean for this activity variable for the listed Subject Number and Activity.  Values are floats.

STANDING: Mean for this activity variable for the listed Subject Number and Activity.  Values are floats.

WALKING: Mean for this activity variable for the listed Subject Number and Activity.  Values are floats.

WALKING_DOWNSTAIRS: Mean for this activity variable for the listed Subject Number and Activity.  Values are floats.

WALKING_UPSTAIRS: Mean for this activity variable for the listed Subject Number and Activity.  Values are floats.

MEASUREMENT: The measurement type for which the means for the 6 activity variables is provided.  The nine measurement types are as follows:

- MEAN_BODY_ACCEL_X: The mean body acceleration in the X direction.  This mean is calculated across 128 observations/window as specified in the original documentation for this study (link included above).  The mean for each row in this data frame is the mean of the means of all observations for that subject while doing that activity.  The units for the initial measure are not listed in the original study documentation (perhaps meters per second squared)

- MEAN_BODY_ACCEL_Y: The mean body acceleration in the Y direction.  Calculated in the same way as MEAN_BODY_ACCEL_X. he units for the initial measure are not listed in the original study documentation (perhaps meters per second squared)

- MEAN_BODY_ACCEL_Z: The mean body acceleration in the Y direction. Calculated in the same way as MEAN_BODY_ACCEL_X. he units for the initial measure are not listed in the original study documentation (perhaps meters per second squared)

- MEAN_BODY_GYRO_X: the mean is calculated in the same way as MEAN_BODY_ACCEL_X.  Units are radians/second.

- MEAN_BODY_GYRO_Y: the mean is calculated in the same way as MEAN_BODY_ACCEL_X.  Units are radians/second.

- MEAN_BODY_GYRO_Z: the mean is calculated in the same way as MEAN_BODY_ACCEL_X.  Units are radians/second.

- MEAN_TOT_ACCEL_X: he mean is calculated in the same way as MEAN_BODY_ACCEL_X.  Units are radians/second.

- MEAN_TOT_ACCEL_Y: he mean is calculated in the same way as MEAN_BODY_ACCEL_X.  Units are radians/second.

- MEAN_TOT_ACCEL_Z: he mean is calculated in the same way as MEAN_BODY_ACCEL_X.  Units are radians/second.

SUBJECT_NUMBER: This is the subject number for whom the measures apply. There were 30 subjects in the study.