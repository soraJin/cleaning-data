cleaning-data
=============
# as the files are originally matlab files, transfer the form and read them in R by using packages R.matlab
# to get the mean and std related columns, use grep function to select those columns in both test and train data frames
# the next step is to combine them into one large data frame
# use the label names in feature txt to label the columns
# next, get the mean of each columns
# create an empte data fram in order to put each activities' labels and their corresponding mean values
