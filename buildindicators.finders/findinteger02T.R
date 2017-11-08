#!/bin/Rscript

n<-nrow(tst)
intoption0T<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n),rep(0,n))
intguess0T<-rep("",n)

intmaybe0<-rep("",nrow(trn))
trn$intmaybe0[grepl("^0[0-9]+$",trn$before)&grepl("^[0-9]+$",trn$before)]=1
d<-nrow(trn[trn$intmaybe0==1,])
c<-nrow(trn[trn$intmaybe0==1&trn$class=="CARDINAL",])
dt<-nrow(trn[trn$intmaybe0==1&trn$class=="DATE",])
dg<-nrow(trn[trn$intmaybe0==1&trn$class=="DIGIT",])
dc<-nrow(trn[trn$intmaybe0==1&trn$class=="DECIMAL",])
te<-nrow(trn[trn$intmaybe0==1&trn$class=="TELEPHONE",])



intprobs0<-c(c/d,dt/d,dg/d,dc/d,te/d)
ints0<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")

i=1

while(i<=n){
   if(tst$intmaybe0T[i]==1){
     
        source("findintguess0T.R")
     
   }
print(i)
i=i+1
}

tst$intguess0T<-intguess0T
save(intguess0T,file="intguess0T")
rm(intguess0T)

