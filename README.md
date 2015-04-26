#Getting and Cleaning data
#####Author:Arpit Chaudhary

This Repository contains the script(run_analysis.R) that does all what is needed for the project.
The script takes the dataset provided and makes all the required processing required. no extra processing is required after/before the script.

run_analysis.R reads the dataset provided. It combines the data set for both train and test set to form a large dataset. It also combines the labels and subject data into the same large dataset.
It then reads features.txt so as to name the variables of the dataset. It then extracts all the variables that have mean/std in the string as asked by the project description.
It then also creates another dataset as asked in the last step. It calculates mean for each variable grouped by activities and subject. This final output is then written to testdata2.txt.
More info about what the script does can be found as comments in the script. The comments make it very clear as what steps are being taken to process the dataset. Please refer to comments if you need more information.

The script requires to be placed inside the input dataset directory such that features.txt and activity_labels.txt are in the same folder as the script.
It also requires train/subject_train.txt, train/X_train.txt, train/y_train.txt, test/subject_test.txt, test/X_test.txt, test/y_test.txt.

Output of the script is provided in 2 files:

* dataset1.txt
* dataset2.txt
	
dataset1.txt provides output dataset as a result of processing done till step 4 of the project description.
dataset2.txt is the final output dataset that is also submitted as a result for peer review.

##To run the script:
* Set the working directory to where the script and the dataset is present.
* Run run_analysis.R.

NOTE: The output dataset submitted for review was an output of this script.
