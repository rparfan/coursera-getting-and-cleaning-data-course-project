Getting and Cleaning Data: Course Project
=========================================

This repository contains all artifacts required by [Getting and Cleaning Data](https://www.coursera.org/course/getdata), specifically, the class that ran from 11/02/2015 - 11/28/2015.

As required by the project, the following files are added in this repository:
- **README.md** - This file itself.
- **CodeBook.md** - Describes the variables, the data, and transformations or work performed to clean up the data.
- **run_analysis.R** - R script that generates `tidyData.txt`. Detailed information about the variables used and transformations performed in the script are outlined in `CodeBook.md`.
- **tidyData.txt** - The tidied output data set. The file is created in the same directory where `run_analysis.R` is.

## Generating `tidyData.txt`
* Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it to a directory. 
* Download or copy `run_analysis.R` to the resulting directory structure below.   
 
 ```
    ├── UCI HAR Dataset
    │   ├── test
    │   ├── train
    │   ├── activity_labels.txt
    │   ├── features.txt
    │   ├── features_info.txt
    │   └── README.txt
    └── run_analysis.R
```

* Set R's working directory to where `run_analysis.R` is in.
* Execute `source('./run_analysis.R')`
