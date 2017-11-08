#!/bin/Rscript



tst$after[tst$Classs=="DIGIT"]=gsub("9","nine",gsub("8","eight",gsub("7","seven",gsub("6","six",gsub("5","five",gsub("4","four",gsub("3","three",gsub("2","two",gsub("1","one",gsub("0","o",substr(gsub(""," ",gsub(" |,|-","",tst$before[tst$Classs=="DIGIT"])),2,nchar(gsub(""," ",gsub(" |,|-","",tst$before[tst$Classs=="DIGIT"])))-1)))))))))))



