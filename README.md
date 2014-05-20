
# README
## Installation
To install the script to tidy the data, simply clone the GitHub repository 
[https://github.com/kdejongh/getting_an_cleaning_data](https://github.com/kdejongh/getting_an_cleaning_data).

## Execution
The script is called <i>run_analysis.R</i> and can be started from the command line, e.g.

    $ ./run_analysis.R

The project directory should be the working directory and the files of the original data set should be in a subdirectory named 'UCI HAR Dataset'.

A description of the data can be found in 'UCI HAR Dataset/README.txt' and 'UCI HAR Dataset/features_info.txt'

## Results
The tidy data set is written to a file named 'tidy-dataset.txt'.
It can be loaded back in R using

    > tidyData <- read.table("tidy-dataset.txt")
