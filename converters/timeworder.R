#!/bin/Rscript

hours<-function(i){if(i==1){return("hour")}
if(i!=1){return("hours")}}
minutes<-function(i){if(i==1){return("minute")}
if(i!=1){return("minutes")}}
seconds<-function(i){if(i==1){return("second")}
if(i!=1){return("seconds")}}
milliseconds<-function(i){if(i==1){return("millisecond")}
if(i!=1){return("milliseconds")}}
#given ABEF
N<-length(ABEF) 
i=1
while(i<=N){
    a<-as.double(gsub(":.*","",ABEF[i]))
    n<-a
    source("numberwords.R")
    wordA<-word
    if(str_count(ABEF[i],":")==0&str_count(ABEF[i],"\\.")==0){
        time<-wordA
    }
    if(str_count(ABEF[i],":")==1&str_count(ABEF[i],"\\.")==1){
    #milliseconds case
        b<-gsub(".*[:]([^.]+)[\\.].*","\\1",ABEF[i])
        n<-as.double(b)
        source("numberwords.R")
        wordB<-word
        c<-gsub(".*\\.","",ABEF[i])
        n<-as.double(c)
        source("numberwords.R")
        wordC<-word
        time<-stringi::stri_join(wordA," ",minutes(a)," ",wordB," ",seconds(b)," and ",wordC," ",milliseconds(c))
    }
# gsub(".*[:]([^.]+)[\\.].*","\\1",b)
#b<-"1:03.37"
    if(str_count(ABEF[i],":")==2){
    # hours minutes seconds case
        b<-gsub(".*[:]([^.]+)[:].*","\\1",ABEF[i])
        n<-as.double(b)
        source("numberwords.R")
        wordB<-word
        c<-gsub(".*:","",ABEF[i])
        n<-as.double(c)
        source("numberwords.R")
        wordC<-word
        time<-stringi::stri_join(wordA," ",hours(a)," ",wordB," ",minutes(b)," and ",wordC," ",seconds(c))
    }
    if(str_count(ABEF[i],":")==1&str_count(ABEF[i],"\\.")==0){
    #standard case
        b<-gsub(".*:","",ABEF[i])
        n<-as.double(b)
        if(n!=0){
        source("numberwords.R")
        wordB<-word
            if(n>0&n<10){
                wordB<-stringi::stri_join("o ",wordB)
            }
        }
        if(n==0){
        wordB<-"o'clock"
        }
       
        time<-stringi::stri_join(wordA," ",wordB)
    } 
BBEF[i]<-time
print(i)

i=i+1
}
