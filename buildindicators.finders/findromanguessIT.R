#!/bin/Rscript

  

        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachecardI)){
        romanoptionT[i,1]=1
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachelettersI)){
        romanoptionT[i,2]=2
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cacheordI)){
        romanoptionT[i,3]=3
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cacheplainI)){
        romanoptionIT[i,4]=4
        }
    
    if(sum(romanoptionIT[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(romanoptionIT[i,],1,replace=FALSE,prob=romprobsI)
    }
    
    


    romanguessIT[i]<-roms[as.integer(guess)]
}
