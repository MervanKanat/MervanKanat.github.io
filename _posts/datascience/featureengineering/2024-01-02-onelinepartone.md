---
title: "Python One-Liners for Efficient Data Science: Part 2"
categories:
        [Data Science,Feature Engineering]
tags:
  - Python
  - Exploratory Data Analysis
  - Data Analysis Techniques
image:
 
  path: /assets/images/mostcommenblack.png

---



## Introduction

In the fast-paced world of data science, efficiency is key. Python one-liners offer a compact and powerful way to perform common data manipulation and analysis tasks. Here, we explore 10 essential one-liners that streamline the process of data exploration, cleaning, and analysis.

## One-liners Comprising 10 Methods

### 1. Create a DataFrame Copy
- **Python Code:** `df_copy = df.copy()`
- **Description:** Creates a copy of the DataFrame to preserve the original data.

### 2. Unique Values
- **Python Code:** `print(df['column'].unique())`
- **Description:** Finds and displays unique values in a specified column.

### 3. Conditional Selection
- **Python Code:** `print(df[df['column'] > value])`
- **Description:** Selects and displays rows based on a condition.

### 4. Data Visualization
- **Python Code:** `import matplotlib.pyplot as plt` followed by `plt.plot(x, y)`
- **Description:** Plots data on a graph.

### 5. Save Dataset
- **Python Code:** `df.to_csv('file.csv', index=False)`
- **Description:** Saves the DataFrame to a CSV file.

### 6. Merge DataFrames
- **Python Code:** `pd.merge(df1, df2, on='key')`
- **Description:** Merges two DataFrames based on a common column.

### 7. Sort by Values
- **Python Code:** `df.sort_values(by='column', ascending=False)`
- **Description:** Sorts the DataFrame in descending order based on the specified column.

### 8. Indexing and Selection
- **Python Code:** `print(df.loc[indices])`
- **Description:** Accesses a group of rows and columns by labels or a boolean array.

### 9. Memory Usage of DataFrame
- **Python Code:** `print(df.memory_usage())`
- **Description:** Displays the memory usage of each column in the DataFrame.
 Useful for managing large datasets and optimizing computation.

### 10. Correlation of DataFrame
- **Python Code:** `print(df.corr())`
- **Description:** Provides the correlation matrix of the DataFrame, a key tool in understanding relationships between numerical variables.

<!-- Custom styled horizontal line -->
<hr style="border: 2px solid #ccc; border-radius: 5px;"/>


  - [x] Learn 10 Methods
    + [x] Understand Methods with Descriptions
      * [x] Load the 'tips' Dataset from the Seaborn Library
        - [ ] Practice
## Practical Use Case with the Tips Dataset

```bash
import pandas as pd
import seaborn as sns
import numpy as np


# Load an example dataset 'tips' from seaborn
tips = sns.load_dataset("tips")

def explore_data(df):

    # Step 1: Sorting the DataFrame by 'total_bill' column and display the first 5 rows
    print("First 5 rows sorted by total_bill:")
    print(df.sort_values(by='total_bill').head())

    # Step 2: Displaying unique values in the 'day' column
    print("\nUnique values in 'day' column:")
    print(df['day'].unique())
    
    # Step 3: Filtering data for 'total_bill' greater than 10 and display
    print("\nRows with 'total_bill' > 10:")
    print(df[df['total_bill'] > 10])
    
    # Step 4: Creating a copy of the DataFrame and performing an inner join on 'time' column
    df_copy = df.copy()
    merged_df = pd.merge(df, df_copy, on='time')
    print("\nMerged DataFrame (self join on 'time'):")
    print(merged_df)
    
    # Step 5: Sorting the DataFrame by 'tip' column in descending order
    print("\nDataFrame sorted by 'tip' in descending order:")
    print(df.sort_values(by='tip', ascending=False))
    
    # Step 6: Selecting and displaying the first 5 rows
    print("\nFirst 5 rows of the DataFrame:")
    print(df.loc[0:4])
    
    # Step 7: Displaying memory usage of the DataFrame
    print("\nMemory usage of DataFrame:")
    print(df.memory_usage())
    
    # Step 8: Calculating and displaying the correlation matrix for numeric columns of the DataFrame
    numeric_df = df.select_dtypes(include=[np.number])
    print("\nCorrelation matrix of numeric-only columns:")
    print(numeric_df.corr())


# Call the function with the tips dataset
explore_data(tips)

```

