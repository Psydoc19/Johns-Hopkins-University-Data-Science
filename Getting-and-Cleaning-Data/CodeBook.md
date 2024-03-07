# **Code Book**

This code book describes the variables, the data, and any transformations or work performed to clean up the data.

## **Data Source**

The dataset used for this project is the "Human Activity Recognition Using Smartphones" dataset from the UCI Machine Learning Repository. The dataset can be accessed at: [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## **Variables**

1.  **Subject**: An identifier for the subject who performed the activity. Integer values ranging from 1 to 30.

2.  **Activity**: The type of activity performed by the subject. Factor variable with six levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", and "LAYING".

3.  **Other Variables**: These variables represent the mean and standard deviation of various features collected from the smartphone accelerometer and gyroscope sensors during the subjects' activities. For example, "tBodyAcc-mean()-X" represents the mean value of the body acceleration signal in the X-direction.

## **Transformations**

1.  **Merge Training and Test Datasets**: The training and test datasets were merged to create one dataset.

2.  **Extract Relevant Features**: Only the measurements on the mean and standard deviation for each measurement were extracted from the dataset.

3.  **Descriptive Activity Names**: Descriptive activity names were used to label the activities in the dataset (e.g., "WALKING", "SITTING", etc.).

4.  **Label Variables**: Descriptive variable names were assigned to the dataset columns to improve readability and understanding.

5.  **Create Tidy Dataset**: A second, independent tidy dataset was created with the average of each variable for each activity and each subject.

## **Tidy Dataset**

The tidy dataset contains the average of each variable for each activity and each subject. Each row in the dataset represents a unique combination of subject and activity, and each column represents a variable with the average value for that combination.