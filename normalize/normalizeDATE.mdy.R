#!/bin/RScript

A<-tst$before[tst$after==""&grepl("[0-9]",tst$before)]

A<-gsub("/|\\.","-",A)

N<-length(A)
AAFT<-rep("",N)
i=1

while(i<=N){
    mm<-as.double(gsub("-.*","",A[i]))
    day<-gsub(".*[-]([^.]+)[-].*","\\1",A[i])
    n<-as.double(day)
    source("ordnumberwords.R")
    day<-word
    year<-gsub(".*-","",A[i])
    if(nchar(year)==4){
        source("year.R")
    }
    if(nchar(year)==2){
        n<-as.double(year)        
        if(n<=10){
            year<-as.character(year)
            year<-stringi::stri_join("20",year)
            n<-as.double(year)
            source("year.R")        
        }
        if(n>10){
            year<-as.character(year)
            year<-stringi::stri_join("19",year)
            n<-as.double(year)
            source("year.R")
        }
    }
    AAFT[i]<-stringi::stri_join(month[mm]," ",day," ",yr)
    AAFT[i]<-gsub(" +"," ",AAFT[i])
    AAFT[i]<-gsub("^ +| +$","",AAFT[i])

print(i)
i=i+1
}

tst$after[tst$after==""&grepl("[0-9]",tst$before)]=AAFT
