#!/bin/Rscript

ORDBEFORE<-tst$before[tst$Classs=="ORDINAL"]
ORDBEFORER<-tst$before[tst$Classs=="ORDINAL"]


ORDBEFORE<-gsub("st|nd|rd|th|,|ª|º|'s","",ORDBEFORE)
ORDBEFORE<-gsub("\\.","",ORDBEFORE)

N<-length(ORDBEFORE)
##convert romans to indoarabic

ORDBEFOREROMAN<-ORDBEFORE[ORDBEFORE %in% ROMANNUMERALS]
NN<-length(ORDBEFOREROMAN)
i=1
while(i<=NN){

ORDBEFOREROMAN[i]=which(ROMANNUMERALS==ORDBEFOREROMAN[i])

print(i)
i=i+1
}
#return CARBEFORE

ORDBEFORE[ORDBEFORE %in% ROMANNUMERALS]=ORDBEFOREROMAN


ORDAFTER<-rep("",N)

i=1

while(i<=N){

        n<-as.double(ORDBEFORE[i])
        source("ordnumberwords.R")
        if(!grepl("[IVXDCLM]",ORDBEFORER[i])){        
        ORDAFTER[i]=word
        }
        if(grepl("[IVXDCLM]",ORDBEFORER[i])){
        ORDAFTER[i]=stringi::stri_join("the ",word)
        }
        ORDAFTER[i]<-gsub("^ +| +$","",gsub(" +"," ",ORDAFTER[i]))
print(i)
i=i+1
}

ORDAFTER<-gsub(" +$","",ORDAFTER)
ORDAFTER<-gsub("^ +","",ORDAFTER)

ORDAFTER<-gsub("  "," ",ORDAFTER)

tst$after[tst$Classs=="ORDINAL"]=ORDAFTER
