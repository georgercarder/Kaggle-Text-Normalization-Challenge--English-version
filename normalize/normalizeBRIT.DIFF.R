#!/bin/Rscript

load("BRIT.DIFFtab")
n<-nrow(tst)
m<-nrow(BRIT.DIFFtab)

N<-nrow(tst[tst$Classs=="PLAINBRITDIFF",])

i=1
while(i<=N){

   
    
       WORD<-BRIT.DIFFtab[BRIT.DIFFtab[,1]==tst$lowerbefore[tst$Classs=="PLAINBRITDIFF"][i],2][1]
        if(!grepl("^[A-Z]",tst$before[tst$Classs=="PLAINBRITDIFF"][i])){
           tst$after[tst$Classs=="PLAINBRITDIFF"][i]<-WORD
        }
##check for capitalization
        if(grepl("^[A-Z][a-z]",tst$before[tst$Classs=="PLAINBRITDIFF"][i])){

        tst$after[tst$Classs=="PLAINBRITDIFF"][i]<-stringi::stri_join(toupper(substr(WORD,1,1)),substr(WORD,2,nchar(WORD)))
    }

       # &!(tst$before %in% USAUK[,2])
  
print(i)
i=i+1
}

