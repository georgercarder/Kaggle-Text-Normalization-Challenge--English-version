#!/bin/Rscript

#build cache for cardinal letters ordinal plain corresponding to "I"

n<-nrow(tst)

load("cachecardI")
load("cachelettersI")
load("cacheordI")
load("cacheplainI")

#i=1
#while(i<=n){

 #   if(tst$before[i]=="I"){
  #      source("findromanIT.cond.R")        
   # }
#print(i)
#i=i+1
#}


source("findroman2IT.R")
