#!/bin/Rscript

DECBEFORE<-tst$before[tst$Classs=="DECIMAL"]


DECBEFORE<-gsub(" +|,","",DECBEFORE)
#DECBEFORE<-gsub("^\\.","0\\.",DECBEFORE)


N<-length(DECBEFORE)

DECAFTER<-rep("",N)

i=1

numDECBEFORE<-gsub("[a-zA-Z]","",DECBEFORE)
letDECBEFORE<-gsub("[0-9]|\\.","",DECBEFORE)

while(i<=N){

        n<-numDECBEFORE[i]
        if(grepl("\\.",DECBEFORE[i])){
            
            source("decimalwords.R")
            DECAFTER[i]=stringi::stri_join(wordec," ",tolower(letDECBEFORE[i]))
        }
        if(!grepl("\\.",DECBEFORE[i])){
            n<-as.double(n)            
            source("numberwords.R")
            DECAFTER[i]=stringi::stri_join(word," ",tolower(letDECBEFORE[i]))
        }  
print(i)
i=i+1
}

DECAFTER<-gsub(" +$","",DECAFTER)
DECAFTER<-gsub("^ +","",DECAFTER)

DECAFTER<-gsub(" {2,}"," ",DECAFTER)

tst$after[tst$Classs=="DECIMAL"]=DECAFTER
