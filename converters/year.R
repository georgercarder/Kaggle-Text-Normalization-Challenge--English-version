#!/bin/Rscript

##nineteen hundreds etc

    if(!(year %in% 2000:2009)){
        if(nchar(year)==4){        
        a<-as.double(substr(year,1,2))
        n<-a
        source("numberwords.R")
        wordA<-word        
        n<-as.double(substr(year,3,4))
        
        if(n!=0){
        source("numberwords.R")
        }else if(n==0){
        word<-"hundred"
        }
        wordB<-word
        yr<-gsub("^ +| +$","",stringi::stri_join(wordA," ",wordB)) 
        }
        if(nchar(year)==3){
        a<-as.double(substr(year,1,1))
        n<-a
        source("numberwords.R")
        wordA<-word        
        n<-as.double(substr(year,2,3))
        if(n!=0){
        source("numberwords.R")
        }else if(n==0){
        word<-"hundred"
        }
        wordB<-word
        yr<-gsub("^ +| +$","",stringi::stri_join(wordA," ",wordB)) 
        }
        if(nchar(year)==2){
        n<-as.double(year)
        source("numberwords.R")
        yr<-word

        }
    }
    if(year %in% 2000:2009){
        n<-as.double(year)
        source("numberwords.R")
        yr<-gsub("^ +| +$","",word)
    }

