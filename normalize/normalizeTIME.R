#!/bin/Rscript


#case1
TIMBEFB<-tst$before[tst$Classs=="TIME"&!grepl("[a-zA-Z]",tst$before)]
TIMBEFB<-gsub(" +","",TIMBEFB)
## minutes, seconds, milliseconds
#what time it is
#how much time has lapsed
#military time

#case2
TIMBEFA<-tst$before[tst$Classs=="TIME"&grepl("[a-zA-Z]",tst$before)]
TIMBEFAA<-gsub("[a-zA-Z]","",TIMBEFA)
TIMBEFAA<-gsub("(\\.)+$","",gsub(" +","",TIMBEFAA))
TIMBEFAA<-gsub("\\.",":",TIMBEFAA)
TIMBEFAAA<-gsub("[ \\.:0-9]","",TIMBEFA)

#case1go
ABEF<-TIMBEFB

N<-length(ABEF)
BBEF<-rep("",N)


source("timeworder.R")

TIMAFTB<-BBEF

#get BBEF
###case1finished

#case2go
#TIMBEFAA gives number times
#TIMBEFAAA gives alpha decorations
ABEF<-TIMBEFAA
source("timeworder.R")
TIMAFTAA<-BBEF
TIMAFTAAA<-gsub(""," ",(tolower(TIMBEFAAA)))
TIMAFTAAAA<-rep("",N)
i=1
while(i<=N){

TIMAFTAAAA[i]<-stringi::stri_join(TIMAFTAA[i]," ",TIMAFTAAA[i])
TIMAFTAAAA[i]<-gsub("^ +| +$","",gsub(" +"," ",TIMAFTAAAA[i]))
print(i)
i=i+1
}
#case2finished

TIMAFTB<-gsub("^ +","",gsub(" +$","",gsub(" {2,}"," ",TIMAFTB)))
tst$after[tst$Classs=="TIME"&!grepl("[a-zA-Z]",tst$before)]=TIMAFTB
TIMAFTAAAA<-gsub("^ +","",gsub(" +$","",gsub(" {2,}"," ",TIMAFTAAAA)))
tst$after[tst$Classs=="TIME"&grepl("[a-zA-Z]",tst$before)]=TIMAFTAAAA


