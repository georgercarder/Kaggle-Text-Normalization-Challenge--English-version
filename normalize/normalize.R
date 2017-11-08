#!/bin/Rscript


library(stringr)

n<-nrow(tst)
tag=0

after<-rep("",n)
tst$after<-after

source("normalizePLAINCHEMS.R")

##strangeness with capitalization
source("normalizeBRIT.DIFF.R")

##strangeness with capitalization
source("normalizePLAINBRITISH.R")
tst$after[tst$Classs=="PLAINBRITISH"&tst$after==""]=tst$before[tst$Classs=="PLAINBRITISH"&tst$after==""]

source("normalizePLAIN.R")

source("normalizePUNCT.R")

source("normalizeVERBATIM.R")

source("normalizeLETTERS.R")

source("normalizeDIGITS.R")

source("normalizeCARDINAL.R")

source("normalizeORDINAL.R")### 10.27 doing good!

source("normalizeDECIMAL.R")### 10.27 doing good!

source("normalizeFRACTION.R")  ## 10.27 doing good!

source("normalizeTELEPHONE.R") ## 10.27 doing good!

source("normalizeTIME.R") ## 10.29 doing good!

source("normalizeDATE.R") ##non alpha dates 10.29 doing good!

source("normalizeDATEss.R") ## 10.29 doing good!

source("normalizeDATE.ALPHA.R") ##10.31 doing good!

source("normalizeDATE.BC.R") ##10.31 doing good!

source("normalizeDATE.md.dm.R") ##looks good so far

source("normalizeMONEY.R") ##looks good so far

source("normalizeMEASURE.R")

source("normalizeADDRESS.R") ##looks good so far

source("normalizeELECTRONIC.R")  #looks good so far

##clean up last of PLAINBRITISH

tst$after[tst$after==""&tst$Classs=="PLAINBRITISH"]=tst$before[tst$after==""&tst$Classs=="PLAINBRITISH"]

tst$after[tst$after==""&tst$Classs=="PLAIN"]=tst$before[tst$after==""&tst$Classs=="PLAIN"]

##may need to fix this
source("normalizeDATE.remnants.R")

source("normalizeDATE.mdy.R")

after<-tst$after
save(after,file="after")


