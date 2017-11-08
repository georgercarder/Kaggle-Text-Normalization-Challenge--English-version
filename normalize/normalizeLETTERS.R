#!/bin/Rscript



tst$after[tst$Classs=="LETTERS"]=gsub(" ' s","'s",gsub("&","and",substr(gsub(""," ",tolower(gsub(" |\\.|-","",tst$before[tst$Classs=="LETTERS"]))),2,nchar(gsub(""," ",tolower(gsub(" |\\.|-","",tst$before[tst$Classs=="LETTERS"]))))-1)))



