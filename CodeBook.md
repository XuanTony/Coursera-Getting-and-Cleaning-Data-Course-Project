## 1. Raw data
* `x_train` and `x_test` contain the various measurements collected from the experiments, 
 with dimensions of [7352,561] and [2947,561], respectively
* `y_train`and `y_test` identify the activities correspoding to each record,
 with dimensions of [7352,1] and [2947,1], respectively
* `subject_train`and `subject_test` identify the subject being tested with same dimensions as `y_train` and `y_test`

## 2. Merged data
* `x_data` bind the rows of train `x_train` and test `x_test` with dimensions [10299,561]
* `y_data` bind the rows of train `y_train` and test `y_test` with dimensions [10299,1]
* `subject_data` bind the rows of train `subject_train` and test `subject_test` with same dimensions as `y_data`

## 3. Subsetting `x_data`
* `features` reads in the names of the measurements, i.e., the column names of `x_data`
* `features_indices` and `features_names` store the indices and names of columns with mean() or std() in their names
* `x_data` is then subsetted using `features_indices` and with reduced dimensions [10299,66]

## 4. Renaming `y_data`
* `activities` reads in the activity_labels corresponding to each number in `y_data`
* `y_data` is then renamed by substituting the number with the corresponding activity_label

## 5. Put in the column names
* `x_data` ("features_names"), `y_data` ("activity") and `subject_data` ("subject")

## 6. Bind the columns of the three datasets and calculate the average
* `new_data` bind the columns in the order of (`subject_data`, `y_data`, `x_data`) with dimensions [10299,68]
* `output` calculates the average of each measurement for each activity and each subject with dimensions [180,68] (30 subjects and 6 activities, 30*6=180)
