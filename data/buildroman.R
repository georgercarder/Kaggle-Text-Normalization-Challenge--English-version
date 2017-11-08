#!/bin/Rscript



romones<-c("I","II","III","IV","V","VI","VII","VIII","IX")

romtens<-c("X","XX","XXX","XL","L","LL","LXX","LXXX","XC")

romhund<-c("C","CC","CCC","CD","D","DC","DCC","DCCC","CM")

romthous<-c("M","MM","MMM","","","","","","")

ROMANIA<-data.frame(romones,romtens,romhund,romthous)

ROMANNUMERALS<-rep("",3999)

S<-1:3999
ii=1

while(ii<=3999){

n<-S[ii]

N<-nchar(n)


i=1
romnumber<-""
while(i<=N){
    if(substr(n,N+1-i,N+1-i)!=0){
    romchar<-as.character(ROMANIA[as.integer(substr(n,N+1-i,N+1-i)),i])
    
    romnumber<-stringi::stri_join(romchar,romnumber)
    }
i=i+1
}

#print(n)
#print(romnumber)
ROMANNUMERALS[ii]=romnumber
ii=ii+1
}

