#!/bin/Rscript

##so far we take care of dates without [a-zA-z] 
library(lubridate)
month<-c("january","february","march","april","may","june","july","august","september","october","november","december")
##many cases to consider. 

YEAR<-tst$before[tst$Classs=="DATE"&grepl("^[0-9]{4}$",tst$before)]

UUU<-tst$before[!grepl("[a-zA-Z]",tst$before)&tst$Classs=="DATE"&!grepl("^[0-9]{4}$",tst$before)]
UUU<-gsub("/|\\.","-",UUU)
YMD<-UUU[nchar(gsub("-.*","",UUU))==4]##same see notes after dmy
YMD<-ymd(YMD) #now reads as ymd

DMY<-UUU[nchar(gsub(".*-","",UUU))==4]##same   after dmy
DMY<-dmy(DMY) #now reads as ymd

########################################################
MDy<-UUU[!grepl("[0-9]{4}",UUU)]

########################################################
N<-length(YEAR)
YEARAFT<-rep("",N)
i=1
while(i<=N){

    year<-YEAR[i]
    source("year.R")
    YEARAFT[i]<-yr
i=i+1
}
YEARAFT<-gsub(" +"," ",YEARAFT)
YEARAFT<-gsub("^ +| +$","",YEARAFT)
########################################################
#YMDymd the twenty fourth of november two thousand seven

N<-length(YMD)
YMDAFT<-rep("",N)
i=1
while(i<=N){
    year<-gsub("-.*","",YMD[i])   
    source("year.R")
    mm<-as.double(gsub(".*[-]([^.]+)[-].*","\\1",YMD[i]))
    if(mm==0){
        mm=1 #flawed..but prevented error message in month    
    }

    n<-as.double(gsub(".*-","",YMD[i]))
    source("ordnumberwords.R")

    day<-word

    YMDAFT[i]<-stringi::stri_join("the ",day," of ",month[mm]," ",yr)
i=i+1
}
YMDAFT<-gsub(" +"," ",YMDAFT)
YMDAFT<-gsub("^ +| +$","",YMDAFT)

################################
##DMYymd

N<-length(DMY)
DMYAFT<-rep("",N)
i=1
while(i<=N){
    if(grepl("[0-9]",DMY[i])){
    year<-gsub("-.*","",DMY[i])   
    source("year.R")
    mm<-as.double(gsub(".*[-]([^.]+)[-].*","\\1",DMY[i]))

    n<-as.double(gsub(".*-","",DMY[i]))
    source("ordnumberwords.R")
    day<-word

    DMYAFT[i]<-stringi::stri_join("the ",day," of ",month[mm]," ",yr)

    }
i=i+1
}
DMYAFT<-gsub(" +"," ",DMYAFT)
DMYAFT<-gsub("^ +| +$","",DMYAFT)
########################################
########################################
#MDy
N<-length(MDy)
MDyAFT<-rep("",N)
i=1
while(i<=N){
    mm<-as.double(gsub("-.*","",MDy[i]))
    if(mm==0){
        mm=1
    }   
    
    d<-as.double(gsub(".*[-]([^.]+)[-].*","\\1",MDy[i]))
    n<-d
    source("ordnumberwords.R")
    day<-word
    n<-as.double(gsub(".*-","",MDy[i]))
    if(!(n %in% 0:9)){
    source("numberwords.R")
    year<-word
    }
    if(n %in% 1:9){
    source("numberwords.R")
    year<-stringi::stri_join("o ",word)
    }
    if(n==0){
    year<-"two thousand"
    }

    MDyAFT[i]<-stringi::stri_join(month[mm]," ",day," ",year)
i=i+1
}
MDyAFT<-gsub(" +"," ",MDyAFT)
MDyAFT<-gsub("^ +| +$","",MDyAFT)
####################
tst$after[tst$Classs=="DATE"&grepl("^[0-9]{4}$",tst$before)]=YEARAFT
tst$after[!grepl("[a-zA-Z]",tst$before)&tst$Classs=="DATE"&!grepl("^[0-9]{4}$",tst$before)&nchar(gsub("-.*","",gsub("/|\\.","-",tst$before)))==4]=YMDAFT
tst$after[!grepl("[a-zA-Z]",tst$before)&tst$Classs=="DATE"&!grepl("^[0-9]{4}$",tst$before)&nchar(gsub(".*-","",gsub("/|\\.","-",tst$before)))==4]=DMYAFT
tst$after[!grepl("[a-zA-Z]",tst$before)&tst$Classs=="DATE"&!grepl("^[0-9]{4}$",tst$before)&!grepl("[0-9]",tst$before)]=MDyAFT












