#!/bin/Rscript


CURRENCYA<-c("","$","£","€","¥")
CURRENCYB<-c("","dollars","pounds","euros","yen")
CURRENCY<-cbind(CURRENCYA,CURRENCYB)
CENTS<-c("","cents","pence","cents","")
CHANGE<-cbind(CURRENCYA,CENTS)

A<-gsub(",","",tst$before[tst$Classs=="MONEY"&grepl("[a-zA-Z]",tst$before)])

B<-gsub(",","",tst$before[tst$Classs=="MONEY"&!grepl("[a-zA-Z]",tst$before)])
B1<-gsub("[ ,\\.0-9]","",B)
B2<-gsub(".*[$£€¥]","",B)
B2<-gsub(" ","",B2)

N<-length(B)
BAFT<-rep("",N)
i=1
while(i<=N){
    if(!grepl("\\.",B2[i])){
        n<-as.double(B2[i])
        source("numberwords.R")
        amt<-word
        curr<-CURRENCY[B1[i]==CURRENCY[,1],2]
        if(amt=="one"){
            curr<-substr(curr,1,nchar(curr)-1)
        }
        BAFT[i]<-gsub(" +"," ",stringi::stri_join(amt," ",curr))
        BAFT[i]<-gsub("^ +| +$","",BAFT[i])
    }
    if(grepl("\\.",B2[i])){
        n<-as.double(gsub("\\..*","",B2[i]))
        source("numberwords.R")
        amt<-word
        n<-as.double(gsub(".*\\.","",B2[i]))
        source("numberwords.R")
        cc<-word
        curr<-CURRENCY[B1[i]==CURRENCY[,1],2]
        if(amt=="one"){
            curr<-substr(curr,1,nchar(curr)-1)
        }
        chg<-CHANGE[B1[i]==CHANGE[,1],2]
        if(amt=="cc"){
            chg<-substr(chg,1,nchar(chg)-1)
        }
        BAFT[i]<-gsub(" +"," ",stringi::stri_join(amt," ",curr," and ",cc," ",chg))
        BAFT[i]<-gsub("^ +| +$","",BAFT[i])

    }
print(i)
i=i+1
}
##################################
A1<-gsub("[ ,\\.0-9a-zA-Z]","",A)
A1<-gsub("-","",A1)

A2<-gsub("[ ,a-zA-Z]","",gsub(".*[$£€¥]","",A))
A2<-gsub("-","",A2)
A3<-gsub(" ","",gsub(".*[0-9]","",A))
A3<-gsub("^m$|^M$","million",A3)
A3<-gsub("^bn$","billion",A3)
A3<-gsub("usd|dollar|dollars","\\$",tolower(A3))
A1[grepl("\\$",A3)]="$"
A3<-gsub("\\$|won","",A3)

N<-length(A)
AAFT<-rep("",N)
i=1
while(i<=N){

        n<-as.character(A2[i])
        if(grepl("\\.",as.character(A2[i]))){
        source("decimalwords.R")
        amt<-wordec
        }
        if(!grepl("\\.",as.character(A2[i]))){
        n<-as.double(n)
        source("numberwords.R")
        amt<-word
        }
        curr<-CURRENCY[A1[i]==CURRENCY[,1],2]
        if(grepl("^Rs",A[i])){
            curr<-"rupees"
        }
        if(grepl("won",A[i])){
            curr<-"won"
        }
        if(grepl("NOK",A[i])){
            curr<-"norwegian krones"
        }
       
        mull<-A3[i]
        AAFT[i]<-gsub(" +"," ",stringi::stri_join(amt," ",mull," ",curr))
        AAFT[i]<-gsub("^ +| +$","",AAFT[i])
    
print(i)
i=i+1
}


tst$after[tst$Classs=="MONEY"&grepl("[a-zA-Z]",tst$before)]=AAFT

tst$after[tst$Classs=="MONEY"&!grepl("[a-zA-Z]",tst$before)]=BAFT















