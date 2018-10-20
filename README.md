**This document explains the steps I’ve followed to clean and tidy the data.**

1.  I’ve loaded the data for the test and train groups as follows

    1.  Accelerometer data from x_test.txt and x_train.txt

    2.  Activities for each group from y_test.txt and y_train.txt

    3.  Subjects for each group from subject_test.txt and subject_train.txt

2.  I’ve aggregated the data for each group, where each group had the following
    structure

    1.  Activity

    2.  Subject

    3.  561 columns of data

3.  I’ve combined both groups into one big data frame with 10299 Obs. And 563
    variables

4.  Renamed the first two variables to reflect their content, and those are
    ActivityName and Subject

5.  Renamed the 561 variables to reflect the feature they represent , which I
    read from the features data.

6.  I’ve extracted the columns with standard deviation and mean measurement

7.  I’ve grouped this data set by the ActivityName and the Subject.

8.  Applied an aggregate function on the grouped set to create the mean value
    for each variable for each activity for each subject.

9.  The final data set’s name is “FinalSet”

To Run the script and get the intended results, please make sure the
run_analysis.R file is inside the data folder, please refer to the paths used in
the script to infer where this file should be
