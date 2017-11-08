#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])


n<-nrow(tst)
romanoptionXFT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessXFT<-rep("",n)


d<-nrow(trn[trn$token_id==0&trn$rommaybeXF==1,])
c<-nrow(trn[trn$token_id==0&trn$rommaybeXF==1&trn$class=="CARDINAL",])
l<-nrow(trn[trn$token_id==0&trn$rommaybeXF==1&trn$class=="LETTERS",])
o<-nrow(trn[trn$token_id==0&trn$rommaybeXF==1&trn$class=="ORDINAL",])
p<-nrow(trn[trn$token_id==0&trn$rommaybeXF==1&trn$class=="PLAIN",])

romprobsXF<-c(c/d,l/d,o/d,p/d)
roms<-c("CARDINAL","LETTERS","ORDINAL","PLAIN")

i=1

while(i<=n){
   if(tst$rommaybeXFT[i]==1){
     
        source("findromanguessXFT.R")
     
   }
#print(i)
i=i+1
}

tst$romanguessXFT<-romanguessXFT
save(romanguessXFT,file="romanguessXFT")
rm(romanguessXFT)
