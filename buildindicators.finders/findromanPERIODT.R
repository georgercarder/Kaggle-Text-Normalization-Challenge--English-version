#!/bin/Rscript

#build cache for cardinal letters ordinal plain

n<-nrow(tst)

load("cachecardPER")
load("cachelettersPER")
load("cacheordPER")
load("cacheplainPER")

rommaybePERT<-rep("",n)
tst$rommaybePERT<-rommaybePERT

#i=1
#while(i<=n){

 #   if(tst$Classs[i]==""){ 
tst$rommaybePERT[(gsub("\\.","",tst$before) %in% ROMANNUMERALS)&grepl("^[A-Z]\\.$",tst$before)]=1
    #    source("findromanPERT.cond.R")
  #  }
   # }
#print(i)
#i=i+1
#}

source("findromanPER2T.R")
