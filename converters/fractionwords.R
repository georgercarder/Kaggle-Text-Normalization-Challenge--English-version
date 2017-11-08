#!/bin/Rscript

#A<-sample(0:100000000,10,replace=FALSE,prob=NULL)
#B<-sample(1:100000000,10,replace=FALSE,prob=NULL)
#i=1
#while(i<=10){

#f<-stringi::stri_join(as.character(A[i]),"/",as.character(B[i]))

#given f="a/b"

# parse F to get a and b separately
#find out if we reduce fractions. assuming not we continue
a<-as.double(gsub("/.*","",f))
b<-as.double(gsub(".*/","",f))


n<-a
source("numberwords.R")
#print("worda is")
#print(worda)


n<-b
source("thsnumberwords.R")
#print("wordb is")
#print(wordb)

wordfrac<-stringi::stri_join(worda," ",wordb)


if(b==1){
wordfrac<-stringi::stri_join(worda)
}
if(b==2){
wordfrac<-stringi::stri_join(worda," halves")
}
wordfrac<-stringi::stri_join(worda," ",wordb)

wordfrac<-gsub("  "," ",wordfrac)
wordfrac<-gsub(" +$","",wordfrac)
if(a==1&b==2){
wordfrac<-"one half"
}

if((a==1&b!=1)&(a==1&b!=2)){
wordfrac<-substr(wordfrac,1,nchar(wordfrac)-1)
a=a+1
}


print(f)
print("wordfrac is")
print(wordfrac)

#i=i+1
#}
