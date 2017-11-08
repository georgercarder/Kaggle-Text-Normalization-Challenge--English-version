#!/bin/Rscript

#tst$after[tst$Classs=="VERBATIM"&!(tst$before %in% VERBA.DIFF[,1])]=tst$before[tst$Classs=="PLAIN"]

load("VERBA.DIFF")
n<-nrow(tst)

N<-nrow(tst[tst$Classs=="VERBATIM"&!(tst$before %in% VERBA.DIFF$before),])
tst$Classs[tst$Classs=="VERBATIM"&!(tst$before %in% VERBA.DIFF$before)]="VERBA1"

#i=1
#while(i<=N){   
               tst$after[tst$Classs=="VERBA1"]=tst$before[tst$Classs=="VERBA1"]
         
#print(i)
#i=i+1
#}

N<-nrow(tst[tst$Classs=="VERBATIM"&(tst$before %in% VERBA.DIFF$before),])

tst$Classs[tst$Classs=="VERBATIM"&(tst$before %in% VERBA.DIFF$before)]="VERBA2"

i=1
while(i<=N){   
               tst$after[tst$Classs=="VERBA2"][i]=VERBA.DIFF$after[VERBA.DIFF$before==tst$before[tst$Classs=="VERBA2"][i]]

print(i)
i=i+1
}

tst$Classs[tst$Classs=="VERBA1"|tst$Classs=="VERBA2"]="VERBATIM"
