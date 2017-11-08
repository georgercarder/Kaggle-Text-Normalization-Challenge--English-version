#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])


n<-nrow(tst)
romanoptionPERT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessPERT<-rep("",n)

rommaybePER<-rep("",nrow(trn))
trn$rommaybePER<-rommaybePER
trn$rommaybePER[(gsub("\\.","",trn$before) %in% ROMANNUMERALS)&grepl("^[A-Z]\\.$",trn$before)]=1
d<-nrow(trn[trn$rommaybePER==1,])
c<-nrow(trn[trn$rommaybePER==1&trn$class=="CARDINAL",])
l<-nrow(trn[trn$rommaybePER==1&trn$class=="LETTERS",])
o<-nrow(trn[trn$rommaybePER==1&trn$class=="ORDINAL",])
p<-nrow(trn[trn$rommaybePER==1&trn$class=="PLAIN",])


romprobsPER<-c(c/d,l/d,o/d,0)
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
   if(tst$rommaybePERT[i]==1){
     
        source("findromanguessPERT.R")
     
   }
print(i)
i=i+1
}

tst$romanguessPERT<-romanguessPERT

save(romanguessPERT,file="romanguessPERT")
rm(romanguessPERT)
