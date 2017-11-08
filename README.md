# Kaggle-Text-Normalization-Challenge--English-version
Machine learning algorithm that normalizes text to be used as input to speech and language applications with 98.6% accuracy.

This project normalizes the text contained in the en_test.csv (see "data" below).

This project will be partitioned into the following classes: Data, indicators.finders.guesses, classification, normalization, and converters. To better organize the body of files, Data is in the data folder, indicators.finders.guesses is in the indicators.finders.guesses folder etc.

All data stems from the initial training and testing data sets provided by the Kaggle website. Programs that engineer data from these initial sources will be consolidated and posted. For now the resulting "caches" will be provided for download. 
Download the initial data sets: 

wget https://www.kaggle.com/c/text-normalization-challenge-english-language/download/en_train.csv.zip 

wget https://www.kaggle.com/c/text-normalization-challenge-english-language/download/en_test.csv.zip

The indicators.finders.guesses are programs that engineer variables to detect certain "context" in sentences that indicate the class of sentence tokens and make guesses of class based on that context.

Classification is consolidation of all scripts classifying sentence tokens. The process initially is quite systematic but becomes quite improvised towards the end in order to classify noisy tokens. A summary of the process is to check token for conditions, usually using a grep type function, then check against an indicator.finder.guesses, and also check if the token has yet been classified. It turns out that an order of operations is important to discern ambiguous tokens. For instance there is much ambiguity and overlap of conditions related to the DATE and TELEPHONE classes. To parse this overlap, order of classification had to be determined through trial and error to reduce misclassification.

Normalization is a collection of scripts that maps tokens to a configuration of characters determined by linuguistic, and contextual rules.

Converters is a collection of tools that the normalizers call to form their specific configurations of characters to arrive at a fully normalized text.

The process to normalize the text of en_test.csv goes as follows.

-We work in R.

-download en_train.csv and en_test.csv from the above links

-use read.csv to save en_train.csv and en_test.csv as variables "trn" and "tst" respectively

-change the types of columns: class, before, and after to character using as.character().

-download the "caches" and other data from the data folder

-run the indicators.finders.guesses contained in the indicators.finders.guesses folder

-run classifyTEST.MASTER.R contained in the classify folder. This produces the vector "Classs" whose entries are classifications of the corresponding "before" tokens.

-run normalize.R which calls other files in both the normalize and converters folder.

If all goes well, this produces a vector called "after" containing the normalization of the "before" vector of characters from en_test.csv.

On a Linux Intel Core2 Duo system running the classify and normalize sections takes about 1.5 hours.

The lengthy part of this operation is running the indicators.finders.guesses.

Revisions of this project will address efficiency as some of the indicators.finders.guesses have long computation time. Initially this project was designed to normalize by any means necessary without full consideration to efficiency. Stay tuned for optimal renditions of this project.

