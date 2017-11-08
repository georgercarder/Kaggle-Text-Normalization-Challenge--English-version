#!/bin/Rscript


#ints<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")
         if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachecardintF)){
        intoptionFT[i,1]=1
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachedateintF)){
        intoptionFT[i,2]=1
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachedigitintF)){
        intoptionFT[i,3]=3
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachedecimalintF)){
        intoptionFT[i,4]=4
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachetelephoneintF)){
        intoptionFT[i,5]=5
        }   
       
    
    if(sum(intoptionFT[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(intoptionFT[i,],1,replace=FALSE,prob=intprobsF)
    }
    
    


    intguessFT[i]<-ints[as.integer(guess)]
}



