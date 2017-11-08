#!/bin/Rscript

n<-nrow(tst)
intoptionFT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n),rep(0,n))
intguessFT<-rep("",n)

intmaybeF<-rep("",nrow(trn))
trn$intmaybeF[grepl("^[0-9]+$",trn$before)]=1
d<-nrow(trn[trn$intmaybeF==1,])
c<-nrow(trn[trn$intmaybeF==1&trn$class=="CARDINAL",])
dt<-nrow(trn[trn$intmaybeF==1&trn$class=="DATE",])
dg<-nrow(trn[trn$intmaybeF==1&trn$class=="DIGIT",])
dc<-nrow(trn[trn$intmaybeF==1&trn$class=="DECIMAL",])
te<-nrow(trn[trn$intmaybeF==1&trn$class=="TELEPHONE",])


intprobsF<-c(c/d,dt/d,dg/d,dc/d,te/d)
ints<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")

i=1

while(i<=n){
   if(tst$intmaybeFT[i]==1){
     
        source("findintegerguessFT.R")
     
   }
print(i)
i=i+1
}

tst$intguessFT<-intguessFT

save(intguessFT,file="intguessFT")
rm(intguessFT)
