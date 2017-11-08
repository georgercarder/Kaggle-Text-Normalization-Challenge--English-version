#!/bin/Rscript

#nrow(trn[trn$before=="-",])
#[1] 22635
#> unique(trn$class[trn$before=="-"])
#[1] "VERBATIM" "PLAIN"    "PUNCT"   
#> head(trn$after[trn$before=="-"&trn$class=="VERBATIM"])
#[1] "-" "-" "-" "-" "-" "-"
#> head(trn$after[trn$before=="-"&trn$class=="PLAIN"])
#[1] "to" "to" "to" "to" "to" "to"
#> head(trn$after[trn$before=="-"&trn$class=="PUNCT"])
#[1] "-" "-" "-" "-" "-" "-"
#> length(trn$after[trn$before=="-"&trn$class=="PUNCT"])
#[1] 1568

P=length(trn$after[trn$before=="-"&trn$class=="PUNCT"])/nrow(trn[trn$before=="-",])

n<-nrow(tst)

to.indicatorT<-rep(0,n)
#clersses<-""


nermbs<-c("DATE","CARDINAL","DECIMAL","MEASURE","MONEY","ORDINAL","TIME","DIGIT","FRACTION")

i=2
while(i<=(n-1)){


    if(
((tst$before[i]=="-")|(tst$before[i]==":"))
&((tst$Classs[i+1] %in% nermbs)&(tst$Classs[i-1] %in% nermbs))
){
        to.indicatorT[i]=1   
    }

print(i)
i=i+1
}

tst$to.indicatorT<-to.indicatorT
save(to.indicatorT,file="to.indicatorT")
rm(to.indicatorT)

