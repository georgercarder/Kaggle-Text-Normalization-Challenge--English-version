#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])


n<-nrow(tst)
romanoptionIFT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessIFT<-rep("",n)


d<-nrow(trn[trn$token_id==0&trn$before=="I",])
c<-nrow(trn[trn$token_id==0&trn$before=="I"&trn$class=="CARDINAL",])
l<-nrow(trn[trn$token_id==0&trn$before=="I"&trn$class=="LETTERS",])
o<-nrow(trn[trn$token_id==0&trn$before=="I"&trn$class=="ORDINAL",])
p<-nrow(trn[trn$token_id==0&trn$before=="I"&trn$class=="PLAIN",])

rommaybeIFT<-rep("",n)
tst$rommaybeIFT<-rommaybeIFT
romprobsIF<-c(c/d,l/d,o/d,p/d)
roms<-c("CARDINAL","LETTERS","ORDINAL","PLAIN")

tst$romanguessIFT<-romanguessIFT
tst$romanguessIFT[tst$token_id==0&tst$before=="I"]="PLAIN"
tst$rommaybeIFT[tst$token_id==0&tst$before=="I"]=1
romanguessIFT<-tst$romanguessIFT
save(romanguessIFT,file="romanguessIFT")
rm(romanguessIFT)
tst$romanguessIFT<-NULL

print("initialized")



#i=1

#while(i<=n){
#   if(trn$rommaybeIF[i]==1){
#        romanguessIF[i]="PLAIN"
#        #source("findromanguessIF.R")
     
#   }
#print(i)
#i=i+1
#}

#trn$romanguessIF<-romanguessIF


