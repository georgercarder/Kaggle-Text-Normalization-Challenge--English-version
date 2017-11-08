#!/bin/Rscript        
        
        if(trn$class[i]=="CARDINAL"){
            
            if(trn$sentence_id[i+1]==trn$sentence_id[i]){
            cachecardIF<-union(cachecardIF,trn$before[i+1])
            }

        }
        if(trn$class[i]=="LETTERS"){
           
            if(trn$sentence_id[i+1]==trn$sentence_id[i]){
            cachelettersIF<-union(cachelettersIF,trn$before[i+1])
            }
        }
        if(trn$class[i]=="ORDINAL"){
           
            if(trn$sentence_id[i+1]==trn$sentence_id[i]){
            cacheordIF<-union(cacheordIF,trn$before[i+1])
            }        }
        if(trn$class[i]=="PLAIN"){
            
            if(trn$sentence_id[i+1]==trn$sentence_id[i]){
            cacheplainIF<-union(cacheplainIF,trn$before[i+1])
            } 
       }        

