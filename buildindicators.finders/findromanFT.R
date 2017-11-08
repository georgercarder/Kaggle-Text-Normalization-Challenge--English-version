#!/bin/Rscript

#build cache for cardinal letters ordinal plain

n<-nrow(tst)

load("cachecardF")
load("cachelettersF")
load("cacheordF")
load("cacheplainF")

tst$rommaybeFT<-rep("",n)

#i=1
#while(i<=n){

#    if(tst$token_id[i]==0){
 #   if(grepl("^[IVXLCDM]{2,}$",trn$before[i])){
  #      source("findromanFT.cond.R")
    tst$rommaybeFT[tst$token_id==0&grepl("^[IVXLCDM]{2,}$",tst$before)&tst$before %in% ROMANNUMERALS]=1
   # }
    #}    
#print(i)
#i=i+1
#}



source("findromanF2T.R")
