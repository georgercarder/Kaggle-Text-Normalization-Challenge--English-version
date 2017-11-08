#!/bin/Rscript

n<-nrow(tst)
isroyalromanT<-rep("",n)
#ODDORDINALS<-unique(trn$before[trn$Classs==""&trn$class=="ORDINAL"])
load("ODDORDINALS")
royalty<-c("pope","king","queen","prince","princess","duke","emperor","Duchess","Marquees","Marchioness","Earl","Countess","Viscount","Viscountess","Baron","Baroness","Baronets","Knight","Dame","Esquire","Gentlemen","Lady","Imperator","Caeser","Rex","Regina","Magnus","Dux","Magna","Ducissa","Archidux","Archiducissa","Archduke","Archduchess","Dux","Ducissa","Duke","Duchess","Princeps","Principissa","Prince","Princess","Prorex","Proregina","Marchio","Marchionissa","Marquees","Marchioness","Comes","Comitissa","Earl","Countess","Vicecomes","Vicecomitissa","Viscount","Viscountess","Baro","Baronissa","Baron","Baroness","Eques","Knight","Dame","Gentleman","Lady","Viziers","Viceroy","Priest","Scribe")
royalty<-tolower(royalty)


i=1

while(i<=n){
   # if(tst$Classs[i]==""){

        if(tst$before[i] %in% ODDORDINALS){
            if(length(intersect(tolower(tst$before[tst$sentence_id==tst$sentence_id[i]]),royalty))>0){
                isroyalromanT[i]=1
            }
        }
   # }
print(i)
i=i+1
}

tst$isroyalromanT<-isroyalromanT
save(isroyalromanT,file="isroyalromanT")
rm(isroyalromanT,ODDORDINALS)

