#!/bin/Rscript

SSS<-tst$before[tst$Classs=="DATE"&grepl("s$",tst$before)]

SSS<-gsub("[ 's]","",SSS)
tensers<-c(20,30,40,50,60,70,80,90)
N<-length(SSS)
SSSAFT<-rep("",N)
i=1
while(i<=N){
    year<-SSS[i]
    source("year.R")
    if(substr(year,nchar(year),nchar(year))==6){
    yr<-stringi::stri_join(yr,"es")
    }else if(substr(year,nchar(year)-1,nchar(year)) %in% tensers){
    yr<-stringi::stri_join(substr(yr,1,nchar(yr)-1),"ies")
    }else{
    yr<-stringi::stri_join(yr,"s")
    }
    SSSAFT[i]<-gsub("^ +| +$","",gsub(" +"," ",yr))
print(i)
i=i+1
}

tst$after[tst$Classs=="DATE"&grepl("s$",tst$before)]=SSSAFT
