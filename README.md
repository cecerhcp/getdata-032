Cesar Cano de Oliveira course id: getdata-032
#Course Project for Getting and Cleaning Data - Coursera course

## The output dataset
- it is tidy
- it has a column named Activity for the activities described in activity_labels.txt
- it has a column named Subject for each one of the 30 subjects that helped collecting the data
- each record has mean and standard deviation of each variable listed in features.txt file for each Activity and Subject

## The script
To generate the output dataset from the raw data you have to execute the file run_analysis.R.
The script will then generate the output dataset in the file named tidy.txt
The script works as follows:
- it reads the train and the test data. train/*.txt and test/*.txt
- it binds the Activy and Subject column to the other 561 variables present on the X_train and X_test
- it binds the rows of both test and train data with those columns added
- then it removes all variables that do not contain "mean", "std" or "Mean" within their names
- then it melts the data (line 45)
- then it reshapes the data (line 46)
- and finally it writes to the tidy.txt file (line 47)

## The raw data
The raw data has lots of details, that are present in rawfeatures.txt, rawfeatures_info.txt, rawREADME.txt and activity_labels.
