#!/bin/Rscript



             
         if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachecardPER)){
        romanoptionPERT[i,1]=1
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachelettersPER)){
        romanoptionPERT[i,2]=2
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cacheordPER)){
        romanoptionPERT[i,3]=3
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cacheplainPER)){
        romanoptionPERT[i,4]=4
        }  
       
    
    if(sum(romanoptionPERT[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(romanoptionPERT[i,],1,replace=FALSE,prob=romprobsPER)
    }
    
    


    romanguessPERT[i]<-roms[as.integer(guess)]
}


