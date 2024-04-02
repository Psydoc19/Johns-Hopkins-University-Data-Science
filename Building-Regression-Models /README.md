# **Motor Trend MPG Analysis**

## **Introduction:**

This project analyzes a dataset of car specifications from Motor Trend magazine to explore the relationship between various variables and miles per gallon (MPG), a crucial metric in the automotive industry. The primary focus is on investigating whether there's a difference in MPG between cars with automatic and manual transmissions and quantifying this difference.

## **Data:**

The analysis utilizes the **`mtcars`** dataset, which provides comprehensive information about different car models. The key variables of interest are MPG and transmission type (automatic or manual).

## **Exploratory Data Analysis (EDA):**

The initial exploration involves visualizing the distribution of MPG across different transmission types using box plots. This helps in identifying any significant differences in MPG between automatic and manual transmission cars.

## **Model Fitting and Selection:**

Multiple linear regression models are fitted to the MPG data, initially including all available variables. The models are then refined by removing non-significant variables to ensure robustness. Coefficients are interpreted to understand the impact of each variable on MPG, with a particular focus on transmission type.

## **Statistical Significance:**

Statistical significance is assessed for each variable's coefficient using p-values. The overall model's significance is also evaluated to determine its ability to explain variance in MPG.

## **Model Fit:**

The goodness of fit for the regression model is examined using metrics such as R-squared and adjusted R-squared values, providing insights into the model's explanatory power.

## **Diagnostics:**

Diagnostic tests, including residual analysis and diagnostic plots, are conducted to validate the model's integrity and assess adherence to model assumptions.

## **Conclusions:**

Based on the analysis, conclusions are drawn regarding the impact of transmission type on MPG and the quantification of the MPG difference between automatic and manual transmissions. The findings provide insights into the relationship between transmission type and MPG, suggesting potential implications for fuel efficiency.
