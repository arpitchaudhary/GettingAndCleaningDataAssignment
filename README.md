#Getting and Cleaning data
#####Author:Arpit Chaudhary

This Repository contains the script(run_analysis.R) that does all what is needed for the project.
The script takes the dataset provided and makes all the required processing required. no extra processing is required after/before the script.

The script requires to be placed inside the input dataset directory such that features.txt and activity_labels.txt are in the same folder as the script.
It also requires train/subject_train.txt, train/X_train.txt, train/y_train.txt, test/subject_test.txt, test/X_test.txt, test/y_test.txt.

Output of the script is provided in 2 files:
	*dataset1.txt
	*dataset2.txt
	
dataset1.txt provides output dataset as a result of processing done till step 4 of the project description.
dataset2.txt is the final output dataset that is also submitted as a result for peer review.

##To run the script:
*Set the working directory to where the script and the dataset is present.
*Run run_analysis.R.

NOTE: The output dataset submitted for review was an output of this script.