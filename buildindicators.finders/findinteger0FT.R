#!/bin/Rscript

#build cache for integers, "CARDINAL"  "DATE"      "DIGIT"     "DECIMAL"   "TELEPHONE"


n<-nrow(tst)

load("cachecardint0F")
load("cachedateint0F")
load("cachedigitint0F")
load("cachedecimalint0F")
load("cachetelephoneint0F")

intmaybe0FT<-rep("",n)
tst$intmaybe0FT<-intmaybe0FT

#i=1
#while(i<=n){

#    if(tst$token_id[i]==0){

tst$intmaybe0FT[tst$token_id==0&grepl("^[0-9]+$",tst$before)&grepl("^0[0-9]+$",tst$before)]=1
#    if(grepl("^[0-9]+$",tst$before[i])){
#        source("findinteger0FT.step.R")
#    }
#    }
#print(i)
#i=i+1
#}



source("findinteger02FT.R")
