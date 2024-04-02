# Practical Machine Learning Project Summary

## Background

The project utilizes data from wearable devices such as Jawbone Up, Nike FuelBand, and Fitbit to predict the manner in which individuals perform barbell lifts using accelerometers on various body parts.

## Goal

The objective is to predict the "classe" variable, indicating the manner of exercise, using other variables. The report details the model building process, cross-validation techniques, expected out-of-sample error, and rationale behind modeling choices.

## Data

Training and test data are provided from accelerometers on participants' bodies.

## Analysis

1.  **Data Preparation:** The data is preprocessed to remove irrelevant columns (timestamps, windowing info) and split into training and testing sets.
2.  **Feature Selection:** Near-zero variance variables and columns with NA values are identified and removed to streamline the dataset.
3.  **Model Training:** Random forest and gradient boosting models are trained using 5-fold cross-validation. Model performance metrics such as accuracy and kappa statistics are evaluated for model selection.

## Conclusion

Both random forest and gradient boosting models demonstrate high accuracy in predicting exercise classes. The random forest model is chosen for predictions due to slightly higher accuracy. Overall, the project highlights the effectiveness of machine learning techniques in analyzing wearable device data for exercise classification.
