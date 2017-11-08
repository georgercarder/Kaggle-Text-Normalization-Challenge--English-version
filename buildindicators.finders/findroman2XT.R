#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])


n<-nrow(tst)
romanoptionXT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessXT<-rep("",n)

#521/4167 cardinal
#38/4167 letters
#213/4167 ordinal
#3395/4167 plain

d<-nrow(trn[trn$rommaybeX==1,])
c<-nrow(trn[trn$rommaybeX==1&trn$class=="CARDINAL",])
l<-nrow(trn[trn$rommaybeX==1&trn$class=="LETTERS",])
o<-nrow(trn[trn$rommaybeX==1&trn$class=="ORDINAL",])
p<-nrow(trn[trn$rommaybeX==1&trn$class=="PLAIN",])

romprobsX<-c(c/d,l/d,o/d,p/d)
roms<-c("CARDINAL","LETTERS","ORDINAL","PLAIN")

i=1

while(i<=n){
   if(tst$rommaybeXT[i]==1){
     
        source("findromanguessXT.R")
     
   }
#print(i)
i=i+1
}

tst$romanguessXT<-romanguessXT

