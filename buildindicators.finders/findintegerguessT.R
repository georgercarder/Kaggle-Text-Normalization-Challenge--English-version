#!/bin/Rscript


#ints<-c("CARDINAL","DATE","DIGIT","DECIMAL","TELEPHONE")
         if(tst$sentence_id[i-1]==tst$sentence_id[i]&((tst$before[i-1] %in% cachecardint)|(tst$before[i-1] %in% cachedecimalint))){
        intoptionT[i,1]=1
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&((tst$before[i-1] %in% cachedateint)|(tst$before[i-1] %in% cachetelephoneint))){
        intoptionT[i,2]=1
        }
        if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachedigitint)){
        intoptionT[i,3]=3
        }
       #if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachedecimalint)){
        #intoptionT[i,4]=1
        #}
        #if(tst$sentence_id[i-1]==tst$sentence_id[i]&(tst$before[i-1] %in% cachetelephoneint)){
        #intoption[i,5]=3
        #}   
       
    
    if(sum(intoptionT[i,])>0){
    
    guess=0
    while(guess==0){
        guess<-sample(intoptionT[i,],1,replace=FALSE,prob=intprobs)
    }
    
    


    intguessT[i]<-ints[as.integer(guess)]
}



