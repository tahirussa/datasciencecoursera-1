## Introduction

This script for R language is used to transform the raw data set of human activity recognition collected by the accelerators in smartphones, which is provided by Jorge L. Reyes-Ortiz, etc. in UniversitÃ degli Studi di Genova, into a tidy set of data according to the requirements of the course project on [Coursera](http://www.coursera.org), [_Getting and Cleaning Data_](https://class.coursera.org/getdata-003/). You can get the detailed information and the data set [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Contents in Script

This script contains five functions represented as below:

1. Function _generate_. The main function, including one variable _input_, which should be _character_ and indicates the location of the raw data directory without slash at the end, e.g. _"UCI HAR Dataset"_. It will read the raw data set to process, and finally create a text file named _tidy_dataset.txt_ in the raw data directory, which contains the set of tidy data required.

2. Function _read_. This function needs two variables _input_ and _set_, both for _character_, and the first of which is the same with the function _generate_. The second one indicates which session of the data set should be read, e.g. _"test"_.

3. Function _extract_. This function needs one variable _rawdata_, which should be _data frame_. It will extract the specific measurements for each observation to create a new table.

4. Function _nameactivity_. This function needs two variables _rawdata_ and _input_, both of which have been described previously. It will replace the numbers which indicates the kinds of activities with the descriptive names.

5. Function _create_. This function needs one variable _rawdata_, which has been described previously. It will create another tidy data set with the average of each variable for each activity and each subject from the table extracted by the former four functions.

## Criteria for Variables Picked

The requirement of the course project is to extract only the measurements on the __mean__ and __standard deviation__ for each measurement. According to the information about the variables contained in _features_info.txt_, the strings _mean()_ and _std()_ represent the __mean__ and __standard deviation__ value estimated from the relative variables. So all the variables whose names contain these two strings are picked into the set of tidy data.

## Meanings for Each Variable

See _CodeBook.md_.

## How to Run This Script

If the path of the raw data directory is _UCI HAR Dataset_ under the working directory of R language, the script can be run directly, or the last section of the script should be modified.

- Input: UCI HAR Dataset

- Output: UCI HAR Dataset/tidy_dataset.txt
