---
title: "10 Python One-Liners for Efficient Data Science: Part 1"
categories:
  - Data Science
  - Feature Engineering
pin: true
tags:
  - Python
  - Exploratory Data Analysis
  - Data Analysis Techniques
---

![Recursive Application Illustration](/assets/images/mostcommen.png){: width="550" height="550"}




<!-- Custom styled horizontal line -->
<hr style="border: 2px solid #ccc; border-radius: 5px;"/>


  - [x] Learn 10 Methods
    + [x] Understand Methods with Descriptions
      * [x] Load the 'tips' Dataset from the Seaborn Library
        - [ ] Practice



## Practical Use Case with the Tips Dataset

```python
import pandas as pd
import seaborn as sns

# Load an example dataset
tips = sns.load_dataset("tips")

# Define the function to explore the dataset
def explore_data(df):
    
    # 1. Display the First 5 Rows
    print("First 5 rows:")
    print(df.head())
    
    # 2. Display Dataset Information
    print("\nDataset information:")
    print(df.info())

    # 3. Show Basic Statistics
    print("\nBasic statistical information:")
    print(df.describe())

    # 4. Column Value Counts
    print("\nColumn value frequencies:")
    print(df['day'].value_counts())

    # 5. Group and Calculate Mean
    print("\nGrouping and calculating the mean:")
    print(df.groupby('sex', observed=True)['tip'].mean())

    # 6. Remove Specific Columns
    print("\nRemoving specific columns:")
    df = df.drop(['total_bill'], axis=1)  # Example: remove 'total_bill' column
    print(df.head())

    # 7. Create Cross-tabulation
    print("\nCross-tabulation table:")
    print(pd.crosstab(index=df['day'], columns=df['time']))

    # 8. Find Duplicate Rows
    print("\nDuplicate rows:")
    print(df[df.duplicated()])
    
# Call the function with the tips dataset
explore_data(tips)
```