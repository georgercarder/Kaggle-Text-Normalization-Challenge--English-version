#!/bin/Rscript

##minus
CARBEFORE<-tst$before[tst$Classs=="CARDINAL"]

CARBEFORE<-gsub("^-","P",CARBEFORE)
CARBEFORE<-gsub(":|,|-| ","",CARBEFORE)
CARBEFORE<-gsub("\\.","",CARBEFORE)
N<-length(CARBEFORE)
##convert romans to indoarabic

CARBEFOREROMAN<-CARBEFORE[CARBEFORE %in% ROMANNUMERALS]
NN<-length(CARBEFOREROMAN)
i=1
while(i<=NN){

CARBEFOREROMAN[i]=which(ROMANNUMERALS==CARBEFOREROMAN[i])

print(i)
i=i+1
}
#return CARBEFORE

CARBEFORE[CARBEFORE %in% ROMANNUMERALS]=CARBEFOREROMAN


CARAFTER<-rep("",N)

i=1

while(i<=N){
   if(!grepl("P",CARBEFORE[i])){
        n<-as.double(CARBEFORE[i])
        source("numberwords.R")
        CARAFTER[i]=word
    }
    if(grepl("P",CARBEFORE[i])){
        CARBEFORE[i]=gsub("P","",CARBEFORE[i])
        n<-as.double(CARBEFORE[i])
        source("numberwords.R")
        CARAFTER[i]=stringi::stri_join("minus ",word)
    }
print(i)
i=i+1
}

CARAFTER<-gsub(" +$","",CARAFTER)
CARAFTER<-gsub("^ +","",CARAFTER)

CARAFTER<-gsub("  "," ",CARAFTER)

tst$after[tst$Classs=="CARDINAL"]=CARAFTER
