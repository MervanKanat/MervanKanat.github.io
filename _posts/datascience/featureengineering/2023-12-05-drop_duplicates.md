---
title: "Understanding drop_duplicates in Pandas"
categories:
  [Data Science,Feature Engineering]
tags:
  - Python
  - Algorithms and Data Structures
  - Coding Tutorials

---

### Feature Engineering

Let's explore an example of feature engineering in Python using the pandas library. In this process, we'll start by creating a sample dataset and then proceed to remove duplicates to clean up our data.

 ```bash
import pandas as pd

# Create a sample dataset
data = pd.DataFrame({
    'ID': [1, 2, 2, 3, 4, 4, 4],
    'Value': ['A', 'B', 'B', 'C', 'D', 'D', 'D']
})

# Print the original data
print("Original Data:\n", data)

# Remove duplicates
data.drop_duplicates(keep="first", inplace=True)

# Print the data after removing duplicates
print("\nData After Removing Duplicates:\n", data)
```

In data science, cleaning and preparing data is crucial before any analysis or modeling. A common task is removing duplicate entries from a dataset. Pandas provides an efficient method for this: `drop_duplicates`.

Here's an example demonstrating how `drop_duplicates` works. We'll start with a dataset that includes some duplicate entries.

#### Original Data

| ID | Value |
|----|-------|
| 1  | A     |
| 2  | B     |
| 2  | B     |
| 3  | C     |
| 4  | D     |
| 4  | D     |
| 4  | D     |

After applying `drop_duplicates`, we get the following cleaned data:

#### Data After Removing Duplicates

| ID | Value |
|----|-------|
| 1  | A     |
| 2  | B     |
| 3  | C     |
| 4  | D     |