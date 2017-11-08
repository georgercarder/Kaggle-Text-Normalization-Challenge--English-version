#!/bin/Rscript

#build cache for cardinal letters ordinal plain

n<-nrow(tst)

load("cachecardbef")
load("cachelettersbef")
load("cacheordbef")
load("cacheplainbef")
rommaybeT<-rep("",n)
tst$rommaybeT<-rommaybeT

i=1
while(i<=n){

    if(grepl("^[IVXLCDM]{2,}$",tst$before[i])){
        source("findromanT.cond.R")
    }
print(i)
i=i+1
}

source("findroman2T.R")
rm(cachecardbef,cachelettersbef,cacheordbef,cacheplainbef)


