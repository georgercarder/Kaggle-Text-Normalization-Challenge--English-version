#!/bin/Rscript

#build cache for cardinal letters ordinal plain

n<-nrow(tst)

load("rommaybeXF")
trn$rommaybeXF<-rommaybeXF
load("cachecardXF")
load("cachelettersXF")
load("cacheordXF")
load("cacheplainXF")

rommaybeXFT<-rep("",n)
tst$rommaybeXFT<-rommaybeXFT

i=1
while(i<=n){

    if(tst$token_id[i]==0){
    if(grepl("^[VXLCDM]$",tst$before[i])){
        source("findromanXFT.cond.R")
    }
    }
#print(i)
i=i+1
}

source("findroman2XFT.R")
