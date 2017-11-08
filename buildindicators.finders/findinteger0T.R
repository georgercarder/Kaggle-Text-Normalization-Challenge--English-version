#!/bin/Rscript

#build cache for integers, "CARDINAL"  "DATE"      "DIGIT"     "DECIMAL"   "TELEPHONE"


n<-nrow(tst)

load("cachecardint0")
load("cachedateint0")
load("cachedigitint0")
load("cachedecimalint0")
load("cachetelephoneint0")

intmaybe0T<-rep("",n)
tst$intmaybe0T<-intmaybe0T

#i=1
#while(i<=n){

 #   if(grepl("^[0-9]+$",tst$before)){
tst$intmaybe0T[grepl("^0[0-9]+$",tst$before)&grepl("^[0-9]+$",tst$before)]=1
  #      source("findinteger0T.step.R")
   # }
#print(i)
#i=i+1
#}


source("findinteger02T.R")
