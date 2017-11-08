#!/bin/Rscript



tst$after[tst$Classs=="PLAIN"&(tst$before=="-"|tst$before==":")]="to"

tst$after[tst$Classs=="PLAIN"&!(tst$before=="-"|tst$before==":")]=tst$before[tst$Classs=="PLAIN"&!(tst$before=="-"|tst$before==":")]
