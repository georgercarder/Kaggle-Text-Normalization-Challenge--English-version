# Kaggle-Text-Normalization-Challenge--English-version
Machine learning algorithm that normalizes text to be used as input to speech and language applications with 98.6% accuracy.

This project normalizes the text contained in the en_test.csv (see "data" below).

This project will be partitioned into the following classes: Data, indicators.finders, classification, normalization, and converters. To better organize the body of files, Data is in the Data folder, indicators.finders is in the indicators.finders folder etc.

All data stems from the initial training and testing data sets provided by the Kaggle website. Programs that engineer data from these initial sources will be consolidated and posted. For now the resulting "caches" will be provided for download. 
Download the initial data sets: 
wget https://www.kaggle.com/c/text-normalization-challenge-english-language/download/en_train.csv.zip 
wget https://www.kaggle.com/c/text-normalization-challenge-english-language/download/en_test.csv.zip

The indicators.finders are programs that engineer variables to detect certain "context" in sentences that indicate the class of sentence tokens.

Classification is consolidation of all scripts classifying sentence tokens. The process initially is quite systematic but becomes quite improvised towards the end in order to classify noisy tokens. A summary of the process is to check token for conditions, usually using a grep type function, then check against an indicator/finder, and also check if the token has yet been classified. It turns out that an order of operations is important to discern ambiguous tokens. For instance there is much ambiguity and overlap of conditions related to the DATE and TELEPHONE classes. To parse this overlap, order of classification had to be determined through trial and error to reduce misclassification.

Normalization is a collection of scripts that maps tokens to a configuration of characters determined by linuguistic, and contextual rules.

Converters is a collection of tools that the normalizers call to form their specific configurations of characters to arrive at a fully normalized text.

The process to normalize the text of en_test.csv goes as follows.
-We work in R.
-download en_train.csv and en_test.csv from the above links
-change the types of columns: class, before, and after to character using as.character().
-download the caches from the data folder
-run the indicators.finders contained in the indicators.finders folder
-run classifyTEST.R contained in the classify folder
-run normalize.R which calls other files in both the normalize and converters folder.

If all goes well, this produces a vector called "Classs" containing the normalization of the "before" vector of characters from en_test.csv.

