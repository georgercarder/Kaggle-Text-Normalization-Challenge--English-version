#!/bin/Rscript


n<-nrow(tst)
SID<-tst$sentence_id[grepl("^911$|^999$",tst$before)]
m<-length(SID)
emrgncyT<-rep("",n)
tst$emrgncyT<-emrgncyT
nineoneone<-c("police","emergency","call","caller","reno","dispatch","calling","calls","called")



i=1

while(i<=m){
    ii<-SID[i]
    S<-tst$before[tst$sentence_id==ii]
    if(length(intersect(S,nineoneone))>0){
        tst$emrgncyT[tst$sentence_id==ii]=1
    } 
print(i)  
i=i+1
}
emrgncyT<-tst$emrgncyT
save(emrgncyT,file="emrgncyT")
rm(emrgncyT)

