#!/bin/Rscript


##TESTING: A script converting numeric representation of DIGITS to a text representation. 

#given n as a character

# parse n=a.b to get a and b separately
#find out if we reduce fractions. assuming not we continue
#n<-gsub("^\\.","0\\.",n)
if(grepl("^[0-9]",n)){
a<-as.double(gsub("\\..*","",n))
b<-as.double(gsub(".*\\.","",n))

n<-a
source("numberwords.R")

n<-b
source("digitwords.R")
}
if(grepl("^\\.",n)){
worda<-""
b<-as.double(gsub(".*\\.","",n))
n<-b
source("digitwords.R")
}

wordec<-stringi::stri_join(worda," point ",wordb)
wordec<-gsub("^ +| +$","",gsub("  +"," ",wordec))




print(wordec)
