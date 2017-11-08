#!/bin/Rscript


A<-tst$before[tst$Classs=="DATE"&!grepl("-",tst$before)&!grepl("r.$",gsub("\\.","",tst$before))&grepl("[bcaBCA][cedCED]$",gsub("\\.","",tst$before))]
A<-gsub("[\\. ]","",A)


B<-tst$before[tst$Classs=="DATE"&grepl("-",tst$before)&!grepl("r.$",gsub("\\.","",tst$before))&grepl("[bcaBCA][cedCED]$",gsub("\\.","",tst$before))]

B<-gsub(" ","",B)

N<-length(A)
AAFT<-rep("",N)
i=1
while(i<=N){
    year<-gsub("[a-zA-Z]","",A[i])
    source("year.R")
    bbb<-gsub(""," ",tolower(gsub(".*[0-9]","",A[i])))
    AAFT[i]<-gsub("^ +| +$","",gsub(" +"," ",stringi::stri_join(yr," ",bbb)))
print(i)
i=i+1
}

N<-length(B)
BAFT<-rep("",N)
i=1
while(i<=N){
    year<-gsub("-.*","",B[i])
    source("year.R")
    yr1<-yr
    year<-gsub(".*-","",gsub("[a-zA-Z]","",B[i]))
    source("year.R")
    yr2<-yr
    bbb<-gsub(""," ",gsub("[-0-9]","",B[i]))
    BAFT[i]<-gsub("^ +| +$","",gsub(" +"," ",stringi::stri_join(yr1," to ",yr2," ",bbb)))
print(i)
i=i+1
}

tst$after[tst$Classs=="DATE"&!grepl("-",tst$before)&!grepl("r.$",gsub("\\.","",tst$before))&grepl("[bcaBCA][cedCED]$",gsub("\\.","",tst$before))]=AAFT
tst$after[tst$Classs=="DATE"&grepl("-",tst$before)&!grepl("r.$",gsub("\\.","",tst$before))&grepl("[bcaBCA][cedCED]$",gsub("\\.","",tst$before))]=BAFT
