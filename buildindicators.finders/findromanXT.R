#!/bin/Rscript

#build cache for cardinal letters ordinal plain

n<-nrow(tst)

load("cachecardX")
load("cachelettersX")
load("cacheordX")
load("cacheplainX")

rommaybeXT<-rep("",n)
tst$rommaybeXT<-rommaybeXT

i=1
while(i<=n){

    if(grepl("^[VXLCDM]$",tst$before[i])){
        source("findromanXT.cond.R")
    }
#print(i)
i=i+1
}

source("findroman2XT.R")
