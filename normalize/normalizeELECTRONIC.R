#!/bin/Rscript

A<-tst$before[tst$Classs=="ELECTRONIC"]

N<-length(A)
AAFT<-rep("",N)

i=1
while(i<=N){
    if(A[i]=="::"){
        AAFT[i]="::"
    }
    if(A[i]!="::"&!grepl("^#",A[i])){
        B<-tolower(gsub(""," ",A[i]))
        B<-gsub("9","nine",gsub("8","eight",gsub("7","seven",gsub("6","six",gsub("5","five",gsub("4","four",gsub("3","three",gsub("2","two",gsub("1","one",gsub("0","o",B))))))))))
        B<-gsub("#","hash",gsub("-","dash",gsub("\\.","dot",gsub("/","slash",gsub(":","colon",B)))))
    }     
    if(grepl("^#",A[i])){
        B<-tolower(gsub("#","hash tag ",A[i]))
        B<-gsub("9","nine",gsub("8","eight",gsub("7","seven",gsub("6","six",gsub("5","five",gsub("4","four",gsub("3","three",gsub("2","two",gsub("1","one",gsub("0","o",B))))))))))
        B<-gsub("#","hash",gsub("-","dash",gsub("\\.","dot",gsub("/","slash",gsub(":","colon",B)))))
    }
    AAFT[i]<-gsub(" +"," ",B)
    AAFT[i]<-gsub("^ +| +$","",AAFT[i])
print(i)
i=i+1
}

tst$after[tst$Classs=="ELECTRONIC"]=AAFT
