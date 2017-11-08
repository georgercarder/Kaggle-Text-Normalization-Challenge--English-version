#!/bin/Rscript

n<-nrow(tst)
load("verbat")
no_singlesT<-rep("",n)
verbmaybeT<-rep("",n)
tst$no_singlesT<-no_singlesT
tst$verbmaybeT<-verbmaybeT


tst$no_singlesT[!grepl("^[a-zA-Z0-9]$",tst$before)]=1

#i=1
#while(i<=n){
 #   if(tst$no_singles[i]==1){

        tst$verbmaybeT[tst$no_singlesT==1&tst$before %in% verbat]=1
  #      source("findverbatT.cond.R")
   # }
#print(i)
#i=i+1
#}
verbmaybeT<-tst$verbmaybeT
save(verbmaybeT,file="verbmaybeT")
rm(verbmaybeT)




