
# Getting-Cleaning-Data-Project
Course Project

## Project Description
This project is an exercise in acquiring and cleaning data. 
The project uses data from the UCI Machine Learning Repository: Human Activity Recognition and Smart Phone Data site: [Description here.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

## Project Files

### Data Processing Script: run_analysis.R
The R script `run_analysis.R` reads the data files and combines them into one full data file.  Important variable values are renamed from numbers to meaningful names. The full set of variables is reduced to a subset that involve means and standard deviations. 

### Tidy Data Output: tidyDataset.txt
The data is then grouped by subject and activity, and summarized by each variable's mean. The end result is a tidy data set. The tidy data set is written to the file **tidy_dataset.txt**.

### Data Processing Description and Variable Names: CodeBook.md
The file `Code Book.md` describes the processing steps and variables used in `run_analysis.md`.

It consists of the average (mean) value of each variable for each subject and activity pair.


