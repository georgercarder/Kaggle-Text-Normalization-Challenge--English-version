#!/bin/Rscript

#head(trn$before[!grepl("DC|ID|CD|DVD",trn$before)&grepl("^I\\.$|^I's$|[XV]th$|IInd$|^[ICDMVX]{2,}$",trn$before)])

print("load caches")
n<-nrow(tst)
romanoptionT<-data.frame(rep(0,n),rep(0,n),rep(0,n),rep(0,n))
romanguessT<-rep("",n)

#3602/6170 cardinal
#1088/6170 letters
#1049/6170 ordinal
#431/6170 plain


romprobs<-c(3602/6170,1088/6170,1049/6170,431/6170)
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
   if(tst$rommaybeT[i]==1){
     
        source("findromanguessT.R")
     
   }
print(i)
i=i+1
}

save(romanguessT,file="romanguessT")


