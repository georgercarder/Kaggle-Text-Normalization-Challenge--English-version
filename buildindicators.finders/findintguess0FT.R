#!/bin/Rscript


#ints<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")
             
         if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachecardint0F)){
        intoption0FT[i,1]=1
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachedateint0F)){
        intoption0FT[i,2]=1
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachedigitint0F)){
        intoption0FT[i,3]=3
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachedecimalint0F)){
        intoption0FT[i,4]=4
        }
        if(tst$sentence_id[i+1]==tst$sentence_id[i]&(tst$before[i+1] %in% cachetelephoneint0F)){
        intoption0FT[i,5]=5
        }   
       
    
    if(sum(intoption0FT[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(intoption0FT[i,],1,replace=FALSE,prob=intprobs0F)
    }
    
    


    intguess0FT[i]<-ints0[as.integer(guess)]
}


