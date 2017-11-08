#!/bin/Rscript

load("CHEMICALS")
n<-nrow(tst)
m<-nrow(CHEMICALS)

N<-nrow(tst[tst$Classs=="PLAINCHEMS",])

i=1
while(i<=N){

     tst$after[tst$Classs=="PLAINCHEMS"][i]<-CHEMICALS[CHEMICALS[,1]==tst$before[tst$Classs=="PLAINCHEMS"][i],2]
#    j=1
 #   while(j<=m){
    
  #      if(tst$before[tst$Classs=="PLAINCHEMS"][i]==CHEMICALS[j,1]){
   #        tst$after[tst$Classs=="PLAINCHEMS"][i]=CHEMICALS[j,2]
    
    #    }
  #  j=j+1
   # }

print(i)
i=i+1
}


