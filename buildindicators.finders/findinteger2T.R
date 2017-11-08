#!/bin/Rscript

n<-nrow(tst)
intoptionT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n),rep(0,n))
intguessT<-rep("",n)

intmaybe<-rep("",nrow(trn))
trn$intmaybe[grepl("^[0-9]+$",trn$before)&!grepl("^0",trn$before)]=1
d<-nrow(trn[trn$intmaybe==1,])
c<-nrow(trn[trn$intmaybe==1&trn$class=="CARDINAL",])
dt<-nrow(trn[trn$intmaybe==1&trn$class=="DATE",])
dg<-nrow(trn[trn$intmaybe==1&trn$class=="DIGIT",])
dc<-nrow(trn[trn$intmaybe==1&trn$class=="DECIMAL",])
te<-nrow(trn[trn$intmaybe==1&trn$class=="TELEPHONE",])


intprobs<-c(c/d,dt/d,dg/d,dc/d,te/d)
ints<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")

i=1

while(i<=n){
   if(tst$intmaybeT[i]==1){
     
        source("findintegerguessT.R")
     
   }
print(i)
i=i+1
}

tst$intguessT<-intguessT
save(intguessT,file="intguessT")
rm(intguessT)


