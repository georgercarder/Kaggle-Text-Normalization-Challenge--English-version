#!/bin/Rscript

load("USAUK")
n<-nrow(tst)
m<-nrow(USAUK)

N<-nrow(tst[tst$Classs=="PLAINBRITISH",])

i=1
while(i<=N){

   
           WORD<-USAUK[USAUK[,1]==tst$lowerbefore[tst$Classs=="PLAINBRITISH"][i],2][1]
       
    if(!grepl("^[A-Z]",tst$before[tst$Classs=="PLAINBRITISH"][i])){
           tst$after[tst$Classs=="PLAINBRITISH"][i]<-WORD
    }

##check for capitalization
    if(grepl("^[A-Z][a-z]",tst$before[tst$Classs=="PLAINBRITISH"][i])){
        tst$after[tst$Classs=="PLAINBRITISH"][i]<-stringi::stri_join(toupper(substr(WORD,1,1)),substr(WORD,2,nchar(WORD)))
    }

       # &!(tst$before %in% USAUK[,2])
  
print(i)
i=i+1
}

