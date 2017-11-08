#!/bin/Rscript

#build cache for cardinal letters ordinal plain corresponding to "I"

n<-nrow(tst)

load("cachecardIF")
load("cachelettersIF")
load("cacheordIF")
load("cacheplainIF")

#i=1
#while(i<=n){

 #   if(tst$token_id[i]==0){
  #  if(tst$before[i]=="I"){
   #     source("findromanIFT.cond.R")        
    #}
    #}
#print(i)
#i=i+1
#}

source("findroman2IFT.R")
