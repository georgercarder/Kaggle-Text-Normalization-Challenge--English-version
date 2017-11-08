#!/bin/Rscript

#build cache for integers, "CARDINAL"  "DATE"      "DIGIT"     "DECIMAL"   "TELEPHONE"


n<-nrow(tst)

load("cachecardint")
load("cachedateint")
load("cachedigitint")
load("cachedecimalint")
load("cachetelephoneint")

intmaybeT<-rep("",n)
tst$intmaybeT<-intmaybeT

#i=1
#while(i<=n){

    tst$intmaybeT[!grepl("^0",tst$before)&grepl("^[0-9]+$",tst$before)]=1
 #       source("findintT.cond.R")
#    }
#print(i)
#i=i+1
#}
intmaybeT<-tst$intmaybeT
save(intmaybeT,file="intmaybeT")
rm(intmaybeT)




source("findinteger2T.R")
