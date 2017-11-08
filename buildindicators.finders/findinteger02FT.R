#!/bin/Rscript

n<-nrow(tst)
intoption0FT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n),rep(0,n))
intguess0FT<-rep("",n)

intmaybe0F<-rep("",nrow(trn))
trn$intmaybe0F<-intmaybe0F
trn$intmaybe0F[trn$token_id==0&grepl("^[0-9]+$",trn$before)&grepl("^0[0-9]+$",trn$before)]=1
d<-nrow(trn[trn$intmaybe0F==1,])
c<-nrow(trn[trn$intmaybe0F==1&trn$class=="CARDINAL",])
dt<-nrow(trn[trn$intmaybe0F==1&trn$class=="DATE",])
dg<-nrow(trn[trn$intmaybe0F==1&trn$class=="DIGIT",])
dc<-nrow(trn[trn$intmaybe0F==1&trn$class=="DECIMAL",])
te<-nrow(trn[trn$intmaybe0F==1&trn$class=="TELEPHONE",])


intprobs0F<-c(c/d,dt/d,dg/d,dc/d,te/d)
ints0<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")

i=1

while(i<=n){
   if(tst$intmaybe0FT[i]==1){
     
        source("findintguess0FT.R")
     
   }
print(i)
i=i+1
}

tst$intguess0FT<-intguess0FT
save(intguess0FT,file="intguess0FT")
rm(intguess0FT)
