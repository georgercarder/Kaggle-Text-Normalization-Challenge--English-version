#!/bin/Rscript



             
         if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachecardF)){
        romanoptionFT[i,1]=1
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachelettersF)){
        romanoptionFT[i,2]=2
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cacheordF)){
        romanoptionFT[i,3]=3
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cacheplainF)){
        romanoptionFT[i,4]=4
        }  
       
    
    if(sum(romanoptionFT[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(romanoptionFT[i,],1,replace=FALSE,prob=romprobsFT)
    }
    
    


    romanguessFT[i]<-roms[as.integer(guess)]
}


