#!/bin/Rscript

TELBEF<-tst$before[tst$Classs=="TELEPHONE"]
TELBEF<-gsub("\\(|\\)|-"," ",TELBEF)
TELBEF<-gsub(" +","S",TELBEF)



TELAFT<-gsub("S","sil",gsub("9","nine",gsub("8","eight",gsub("7","seven",gsub("6","six",gsub("5","five",gsub("4","four",gsub("3","three",gsub("2","two",gsub("1","one",gsub("0","o",substr(gsub(""," ",TELBEF),2,nchar(gsub(""," ",TELBEF))-1))))))))))))

tst$after[tst$Classs=="TELEPHONE"]=TELAFT
