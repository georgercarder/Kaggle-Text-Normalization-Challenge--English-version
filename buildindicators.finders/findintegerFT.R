#!/bin/Rscript

#build cache for integers, "CARDINAL"  "DATE"      "DIGIT"     "DECIMAL"   "TELEPHONE"


n<-nrow(tst)

load("cachecardintF")
load("cachedateintF")
load("cachedigitintF")
load("cachedecimalintF")
load("cachetelephoneintF")

tst$intmaybeFT<-rep("",n)

#i=1
#while(i<=n){
 #   if(tst$token_id[i]==0){
    tst$intmaybeFT[grepl("^[0-9]+$",tst$before)]=1
  #      source("findintFT.cond.R")
   # }
    #}
#print(i)
#i=i+1
#}




source("findinteger2FT.R")
