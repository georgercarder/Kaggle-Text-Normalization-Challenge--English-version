#!/bin/Rscript


##  " " gives "and"
#has minus

#½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒

load("unicodefractiontab")

FRACBEFORE<-tst$before[tst$Classs=="FRACTION"]

FRACBEFORE.ST<-FRACBEFORE[!grepl("[½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒]",FRACBEFORE)]
FRACBEFORE.UN<-FRACBEFORE[grepl("[a-zA-Z½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒]",FRACBEFORE)]

FRACBEFORE.ST<-gsub("-","P",FRACBEFORE.ST)
FRACBEFORE.UN<-gsub("-","P",FRACBEFORE.UN)

N<-length(FRACBEFORE.ST)
FRACAFTER.ST<-rep("",N)
i=1
while(i<=N){
   if(!grepl("P",FRACBEFORE.ST[i])){
        f<-FRACBEFORE.ST[i]
        source("fractionwords.R")
        FRACAFTER.ST[i]=wordfrac
    }
    if(grepl("P",FRACBEFORE.ST[i])){
        FRACBEFORE.ST[i]=gsub("P","",FRACBEFORE.ST[i])
        f<-FRACBEFORE.ST[i]
        source("fractionwords.R")
        FRACAFTER.ST[i]=stringi::stri_join("minus ",wordfrac)
    }
print(i)
i=i+1
}
FRACAFTER.ST<-gsub(" +$","",FRACAFTER.ST)
FRACAFTER.ST<-gsub("^ +","",FRACAFTER.ST)

FRACAFTER.ST<-gsub(" {2,}"," ",FRACAFTER.ST)
tst$after[tst$Classs=="FRACTION"&!grepl("[½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒]",tst$before)]=FRACAFTER.ST

print("still need unicode fractions")
print("......  ")
print("......  ")
print("......  ")
print("......  ")
print("......  ")
print("......  ")

#FRACBEFORE.UN
FRACBEFORE.UN1<-gsub("[a-zA-Z]| |½|⅓|⅔|¼|¾|⅕|⅖|⅗|⅘|⅙|⅚|⅐|⅛|⅜|⅝|⅞|⅑|⅒","",FRACBEFORE.UN)

FRACBEFORE.UN2<-gsub("[ a-zA-Z0-9]","",FRACBEFORE.UN)
NN<-length(FRACBEFORE.UN)
FRACAFTER.UN<-rep("",NN)

i=1
while(i<=NN){
        if(grepl("[0-9]",FRACBEFORE.UN1[i])){      
        n<-as.double(FRACBEFORE.UN1[i])
        source("numberwords.R")
        wordA<-word
        f<-unicodefractiontab[unicodefractiontab[,1]==FRACBEFORE.UN2[i],2]
unicodefractiontab[unicodefractiontab[,1]=="½",2]
        source("fractionwords.R")
        if(FRACBEFORE.UN2[i]=="½"){
        FRACAFTER.UN[i]=stringi::stri_join(wordA," and a half")
        print(FRACAFTER.UN[i])
        }
        if(FRACBEFORE.UN2[i]!="½"){
        FRACAFTER.UN[i]=stringi::stri_join(wordA," and ",wordfrac)
        print(FRACAFTER.UN[i])        
        }
        }
        if(!grepl("[0-9]",FRACBEFORE.UN1[i])){  
            f<-unicodefractiontab[unicodefractiontab[,1]==FRACBEFORE.UN2[i],2]
            unicodefractiontab[unicodefractiontab[,1]=="½",2]
            source("fractionwords.R")
            if(FRACBEFORE.UN2[i]=="½"){
            FRACAFTER.UN[i]="one half"
            print(FRACAFTER.UN[i])
            }
            if(FRACBEFORE.UN2[i]!="½"){
            FRACAFTER.UN[i]=wordfrac
            print(FRACAFTER.UN[i]) 
            }     
        }   
print(i)
i=i+1
}


FRACAFTER.UN<-gsub(" +$","",FRACAFTER.UN)
FRACAFTER.UN<-gsub("^ +","",FRACAFTER.UN)

FRACAFTER.UN<-gsub(" {2,}"," ",FRACAFTER.UN)
tst$after[tst$Classs=="FRACTION"&grepl("[½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒]",tst$before)]=FRACAFTER.UN







