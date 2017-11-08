#!/bin/Rscript


#ints<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")
             
         if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachecardint0)){
        intoption0T[i,1]=1
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachedateint0)){
        intoption0T[i,2]=1
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachedigitint0)){
        intoption0T[i,3]=3
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachedecimalint0)){
        intoption0T[i,4]=4
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachetelephoneint0)){
        intoption0T[i,5]=5
        }   
       
    
    if(sum(intoption0T[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(intoption0T[i,],1,replace=FALSE,prob=intprobs0)
    }
    
    


    intguess0T[i]<-ints0[as.integer(guess)]
}


