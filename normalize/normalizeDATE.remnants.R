#!/bin/Rscript

A<-tst$before[tst$after==""&grepl("[a-zA-Z]",tst$before)]
A<-gsub("[,\\.]","",A)
A<-gsub("^ +| +$","",gsub(" +"," ",gsub("the","",A)))

A1<-gsub(" .*","",A)
A2<-gsub("^[0-9a-zA-Z]+ ","",A)
A3<-gsub("^([0-9a-zA-Z]+ ){1,2}","",A)


mn<-c("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec")
MONTH<-cbind(mn,month)

N<-length(A)
AAFT<-rep("",N)
i=1
while(i<=N){
    if(grepl("^[a-zA-Z]+$",A1[i])){
        if(tolower(A1[i]) %in% mn){
            a1<-MONTH[MONTH[,1]==tolower(A1[i]),2]
        }
        if(!(tolower(A1[i]) %in% mn)){
            a1<-tolower(A1[i])
        }
    }
    if(!grepl("^[a-zA-Z]+$",A1[i])){
        a1<-gsub("[a-zA-Z]","",A1[i])
        if(grepl("^[0-9]+$",a1)){        
        n<-as.double(a1)
        source("ordnumberwords.R")
        a1<-stringi::stri_join("the ",word)
        }
    }
    AAFT[i]<-gsub("^ +| +$","",gsub(" +"," ",a1))
print(i)
i=i+1
}

AAFT2<-rep("",N)
i=1
while(i<=N){
    if(str_count(A2[i]," ")==0){
    if(grepl("^[a-zA-Z]+$",A2[i])){
        if(tolower(A2[i]) %in% mn){
            a1<-MONTH[MONTH[,1]==tolower(A2[i]),2]
            a1<-stringi::stri_join("of ",a1)
        }
        if(!(tolower(A2[i]) %in% mn)){
            a1<-stringi::stri_join("of ",tolower(A2[i]))
        }
    }
    if(!grepl("^[a-zA-Z]+$",A2[i])){
        a1<-gsub("[a-zA-Z]","",A2[i])
        if(grepl("^[0-9]+$",a1)){        
        n<-as.double(a1)
        source("ordnumberwords.R")
        a1<-word
        }
    }
    AAFT2[i]<-gsub("^ +| +$","",gsub(" +"," ",a1))
    }
print(i)
i=i+1
}

AAFT3<-rep("",N)
i=1
while(i<=N){
    if(str_count(A3[i]," ")==0&str_count(A[i]," ")==2){
    if(grepl("^[a-zA-Z]+$",A3[i])){
        if(tolower(A3[i]) %in% mn){
            a1<-MONTH[MONTH[,1]==tolower(A3[i]),2]
            a1<-stringi::stri_join("of ",a1)
        }
        if(!(tolower(A3[i]) %in% mn)){
            a1<-stringi::stri_join("of ",tolower(A3[i]))
        }
    }
    if(!grepl("^[a-zA-Z]+$",A3[i])){
        a1<-gsub("[a-zA-Z]","",A3[i])
        if(grepl("^[0-9]+$",a1)){        
        n<-as.double(a1)
        source("ordnumberwords.R")
        a1<-word
        }
    }
    AAFT3[i]<-gsub("^ +| +$","",gsub(" +"," ",a1))
    }
print(i)
i=i+1
}

AAFTER<-rep("",N)
i=1
while(i<=N){
    AAFTER[i]<-stringi::stri_join(AAFT[i]," ",AAFT2[i]," ",AAFT3[i])
    AAFTER[i]<-gsub(" +"," ",AAFTER[i])
    AAFTER[i]<-gsub("^ +| +$","",AAFTER[i])
print(i)
i=i+1
}

tst$after[tst$after==""&grepl("[a-zA-Z]",tst$before)]=AAFTER



