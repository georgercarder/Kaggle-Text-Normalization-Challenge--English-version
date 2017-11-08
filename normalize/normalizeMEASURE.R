#!/bin/Rscript

library(stringr)
print("fetching meastable")
meastable<-read.csv("meastable.csv",header=TRUE,sep=",")
meastable$measbefore<-as.character(meastable$measbefore)
meastable$measafter<-as.character(meastable$measafter)

##head(str_extract(tst$before[tst$Classs=="MEASURE"],"[,\\.0-9]+"),10)

A1<-str_extract(tst$before[tst$Classs=="MEASURE"&grepl("[0-9]",tst$before)],"[,\\.0-9]+")
A1<-gsub(",","",A1)

A2<-gsub("^ +| +$","",gsub("[,\\.0-9]","",gsub("m3","m³",gsub("km2","km²",tst$before[tst$Classs=="MEASURE"&grepl("[0-9]",tst$before)]))))

###
B<-gsub("^ +| +$","",gsub("[,\\.0-9]","",gsub("km2","km²",tst$before[tst$Classs=="MEASURE"&!grepl("[0-9]",tst$before)])))


N<-length(A1)
AAFT<-rep("",N)
i=1
while(i<=N){

    if(grepl("\\.",A1[i])){
        n<-A1[i]
        source("decimalwords.R")
        qty<-wordec
    }
    if(!grepl("\\.",A1[i])){
        n<-as.double(A1[i])
        source("numberwords.R")
        qty<-word
    }
    if(A2[i] %in% meastable$measbefore){
    ms<-meastable$measafter[A2[i]==meastable$measbefore]
    }
    if(!(A2[i] %in% meastable$measbefore)){
    ms<-tolower(A2[i])
    }
    AAFT[i]<-gsub(" +"," ",stringi::stri_join(qty," ",ms))
    AAFT[i]<-gsub("^ +| +$","",AAFT[i])
    

print(i)
i=i+1
}

N<-length(B)
BAFT<-rep("",N)
i=1
while(i<=N){

    if(B[i] %in% meastable$measbefore){
    ms<-meastable$measafter[B[i]==meastable$measbefore]
    }
    if(!(B[i] %in% meastable$measbefore)){
    ms<-tolower(B[i])
    }
    BAFT[i]<-gsub(" +"," ",ms)
    BAFT[i]<-gsub("^ +| +$","",BAFT[i])
    
print(i)
i=i+1
}

tst$after[tst$Classs=="MEASURE"&grepl("[0-9]",tst$before)]=AAFT
tst$after[tst$Classs=="MEASURE"&!grepl("[0-9]",tst$before)]=BAFT


