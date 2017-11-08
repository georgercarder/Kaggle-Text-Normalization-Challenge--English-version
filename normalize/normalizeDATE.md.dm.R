#!/bin/Rscript

A<-gsub("^[ ,\\.]+|[ ,\\.]+$","",tst$before[tst$Classs=="DATE"&!grepl("[0-9]{4}",tst$before)&(tolower(gsub("[\\., 0-9]","",tst$before)) %in% month)])



N<-length(A)
AAFT<-rep("",N)
i=1
while(i<=N){
        if(grepl("^[0-9]",A[i])&grepl("[a-zA-Z]$",A[i])){
            d<-as.double(gsub("[-a-zA-Z]","",gsub(" .*","",A[i])))
            n<-d
            source("ordnumberwords.R")
            day<-word
            mon<-tolower(gsub("[ 0-9]","",A[i]))
            AAFT[i]<-gsub(" +"," ",stringi::stri_join("the ",day," of ",mon))
            AAFT[i]<-gsub("^ +| +$","",AAFT[i])
            
        }
        if(grepl("^[a-zA-Z]",A[i])&grepl("[0-9]$",A[i])){
            d<-as.double(gsub("[a-zA-Z]","",gsub(".* ","",A[i])))
            n<-d
            source("ordnumberwords.R")
            day<-word
            mon<-tolower(gsub("[ 0-9]","",A[i]))
            AAFT[i]<-gsub(" +"," ",stringi::stri_join(mon," ",day))
            AAFT[i]<-gsub("^ +| +$","",AAFT[i])
        }
i=i+1
}

tst$after[tst$Classs=="DATE"&!grepl("[0-9]{4}",tst$before)&(tolower(gsub("[\\., 0-9]","",tst$before)) %in% month)]=AAFT
##dont commit yet so that tst$after=="" doesnt get altered
