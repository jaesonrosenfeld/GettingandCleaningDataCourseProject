In order to use the run_analysis.R, please unzip the file "getdata-projectfiles-UCI HAR Dataset.zip" into the working directory that you are using in R. 

The original README.txt file for the project explains the raw source data - which is accelerometer data collected from 30 subjects carrying Samsung Galaxy smartphones.  The data we include here are simply means for each of the measures from the accelerometer for each of the 30 subjects for each main measure.

Then you may run the run_analysis.R, which proceeds in the following steps.

1. It reads all the .txt files in the test folder and compiles them into a single data frame called testdf.   It takes the mean and standard deviation for the 128 columns from each of the files and writes it to one column.  It then attaches the 561 values from x_test.txt as the last columns on this dataframe.

2. It then moves to the train folder and compiles all the test files into a single data frame called traindf.  It is constructed in the exact same manner as testdf.

3. It then combines these two data frames into one single dataframe.

4. Next the numerical categories for activity type are replaced with descriptive names.

5. Next the tapply function is used to calculate the mean for each activity for each participant for each of the measurement types (this excludes the 561 measurements as it was not clear these could be averaged).

++++++++++
LISCENSE
++++++++++

Liscense terms from the initial raw data set apply to the byproduct/summarized data included here.


