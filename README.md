# Getting_cleaning_project
Repository created for the project Course: Getting_cleaning_project
The script called Run_analysis.r contains the code to construct the final tidy set named result.txt.
The script does what is required in the project through several steps:
  Step 1: Load the dplyr library
  Step 2: load all the interest files that must be included in your working directory
  Step 3: combines training and test set in only one file for all the interest files: data_set (train,test), activity_set (y_train,y_test) and who_set (subject_train,subject_text) with rbind function.
  Step 4: Assigns the column names to the main data set, data_set.
  Step 5: Extract only the columns with mean and standard deviation reference into its name, with function grep
  Step 6: Merge activity information, activity_set, into data_set with function cbind.
  Step 7: Merge ID subject to data_set with function cbind.
  Step 8: Group by Id_subject and activity the data_set to get the final file required with aggregate function. The final file is called Result and its extension is txt.
  Step 9: Translate number activity into its label
  Step 10: Export final file to txt in working directory
The variables of the Result file are:
1) Activity: The name of the activity
2) Id_subject: Id of the person who made the activity
3) The rest of variables are the mean of each measure by Activity and Id_subject-
