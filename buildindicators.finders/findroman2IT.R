#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])


n<-nrow(trn)
romanoptionI<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessI<-rep("",n)

#521/4167 cardinal
#38/4167 letters
#213/4167 ordinal
#3395/4167 plain
d<-nrow(trn[trn$before=="I",])
c<-nrow(trn[trn$before=="I"&trn$class=="CARDINAL",])
l<-nrow(trn[trn$before=="I"&trn$class=="LETTERS",])
o<-nrow(trn[trn$before=="I"&trn$class=="ORDINAL",])
p<-nrow(trn[trn$before=="I"&trn$class=="PLAIN",])

rommaybeIT<-rep("",n)
tst$rommaybeIT<-rommaybeIT
romprobsI<-c(c/d,l/d,o/d,p/d)
roms<-c("CARDINAL","LETTERS","ORDINAL","PLAIN")

tst$rommaybeIT[tst$before=="I"]=1
print("initialized")


i=1

while(i<=n){
   if(tst$rommaybeIT[i]==1){
     
        source("findromanguessIT.R")
     
   }
print(i)
i=i+1
}

trn$romanguessIT<-romanguessIT
save(romanguessIT,file="romanguessIT")
rm(romanguessIT)

