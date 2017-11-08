#!/bin/Rscript


A<-tst$before[tst$Classs=="ADDRESS"]
A<-gsub("[- \\(\\)]","",A)

A1<-str_extract(A,"[0-9]+")
A2<-str_extract(A,"[a-zA-Z]+")

N<-length(A)
AAFT<-rep("",N)
i=1
while(i<=N){
    if(nchar(A2[i])>3){
        a2aft<-tolower(A2[i])
    }
    if(nchar(A2[i])<=3){
        a2aft<-gsub(""," ",tolower(A2[i]))
    }
    if(nchar(A1[i])<=2){
        n<-as.double(A1[i])
        source("numberwords.R")
        a1aft<-word
    }
    if(nchar(A1[i])==3){
        n<-as.double(substr(A1[i],1,1))
        source("numberwords.R")
        a1<-word

        n<-as.double(substr(A1[i],2,3))  
        if(n>=10){              
        source("numberwords.R")
        a2<-word
        }
        if(n<10){
            n<-substr(A1[i],2,3)
            a2<-gsub("9","nine",gsub("8","eight",gsub("7","seven",gsub("6","six",gsub("5","five",gsub("4","four",gsub("3","three",gsub("2","two",gsub("1","one",gsub("0","o",substr(gsub(""," ",gsub(" |,|-","",n)),2,nchar(gsub(""," ",gsub(" |,|-","",n)))-1)))))))))))
            
        }
        a1aft<-stringi::stri_join(a1," ",a2)
    }
    if(nchar(A1[i])>=4){
        a1aft<-gsub("9","nine",gsub("8","eight",gsub("7","seven",gsub("6","six",gsub("5","five",gsub("4","four",gsub("3","three",gsub("2","two",gsub("1","one",gsub("0","o",substr(gsub(""," ",gsub(" |,|-","",A1[i])),2,nchar(gsub(""," ",gsub(" |,|-","",A1[i])))-1)))))))))))
    }
    AAFT[i]<-gsub(" +"," ",stringi::stri_join(a2aft," ",a1aft))
    AAFT[i]<-gsub("^ +| +$","",AAFT[i])
    
print(i)
i=i+1
}




tst$after[tst$Classs=="ADDRESS"]=AAFT

