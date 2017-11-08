#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])


n<-nrow(tst)
romanoptionFT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessFT<-rep("",n)



d<-length(trn$before[trn$token_id==0&grepl("^[IVXLCDM]{2,}$",trn$before)])
c<-length(trn$before[trn$class=="CARDINAL"&trn$token_id==0&grepl("^[IVXLCDM]{2,}$",trn$before)])
l<-length(trn$before[trn$class=="LETTERS"&trn$token_id==0&grepl("^[IVXLCDM]{2,}$",trn$before)])
o<-length(trn$before[trn$class=="ORDINAL"&trn$token_id==0&grepl("^[IVXLCDM]{2,}$",trn$before)])
p<-length(trn$before[trn$class=="PLAIN"&trn$token_id==0&grepl("^[IVXLCDM]{2,}$",trn$before)])



romprobsFT<-c(c/d,l/d,o/d,p/d)
roms<-c("CARDINAL","LETTERS","ORDINAL","PLAIN")




##parallel alternative
#findroman2<-function(i){
#   if(trn$rommaybe[i]==1){
#     
#        source("findromanguess.R")
#     
#   }
#
#return(romanguess[i])
#}
###
i=1

while(i<=n){
   if(tst$rommaybeFT[i]==1){
     
        source("findromanguessFT.R")
     
   }
print(i)
i=i+1
}

tst$romanguessFT<-romanguessFT
save(romanguessFT,file="romanguessFT")


