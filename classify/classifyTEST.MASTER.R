#!/bin/Rscript


#by the end of building this script I learned much more efficient ways to combine grepl scripts. Please excuse the lack of brevity in the initial portion of this text.

print("initializing...")
Classs<-rep("",nrow(tst))
tst$Classs<-Classs
print("...............")
load("islast")
trn$islast<-islast

print("classifying 'electronic'")
tst$Classs[grepl("([0-9]+\\.){3,}",tst$before)|grepl("^::$",tst$before)|grepl("#[a-zA-Z]",tst$before)|grepl("\\.[a-zA-Z]{2,}",tst$before)]="ELECTRONIC"
print("electronic classified")

print("Classifying 'FRACTION'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(!grepl("[^0-9/½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒-]",tst$before)&!grepl("[a-zA-Z]",tst$before)&((grepl("[0-9]",tst$before)&grepl("/",tst$before)&!grepl("/.*/",tst$before)&nchar(gsub(".*/","",tst$before))>0)|grepl("[½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒]",tst$before)))]="FRACTION"
print("'FRACTION' classified.")

print("Classifying 'PUNCT'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(!(grepl("::",tst$before)|grepl("[0-9]+",tst$before)|grepl(":-\\)",tst$before)|grepl(":-\\(",tst$before)|grepl(":\\)",tst$before)|grepl(":\\(",tst$before))&(grepl("\"",tst$before)|grepl("^--+$",tst$before)|grepl("^]+$",tst$before)|grepl("^[-\\.,\\(\\):'—!/;\\?«»¡¿\\|\\[]+$",tst$before)))]="PUNCT"
print("'PUNCT' classified.")

print("Classifying 'TIME'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(((grepl(":\\s[0-9]",tst$before)|grepl(":[0-9]",tst$before))&!grepl("[a-zA-Z]",tst$before))|(grepl("[0-9]",tst$before)&!grepl("[bcdefghijklnoqrstuvwxyz-]",tst$before)&(grepl("GMT",tst$before)|grepl("UTC",tst$before)|grepl("GMT",tst$before)|grepl("AEST",tst$before)|grepl("PST",tst$before)|grepl("BST",tst$before)|grepl("CET",tst$before)|grepl("EDT",tst$before)|grepl("MST",tst$before)|grepl("CST",tst$before)|grepl("KST",tst$before)|grepl("CEST",tst$before)|grepl("am",tst$before)|grepl("a.m.",tst$before)|grepl("AM",tst$before)|grepl("A.M.",tst$before)|grepl("pm",tst$before)|grepl("p.m.",tst$before)|grepl("PM",tst$before)|grepl("P.M.",tst$before))))]="TIME"
print("'TIME' classified.")

print("Classifying 'DECIMAL'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(!grepl("[$£¥€]",tst$before)&((grepl("thousand$",tst$before)|grepl("million$",tst$before)|grepl("billion$",tst$before)|grepl("trillion$",tst$before))&(grepl("^[0-9]+\\.[0-9]+",tst$before)|grepl("^[0-9]+",tst$before))|grepl("^-[0-9]+\\.[0-9]+$",tst$before)|grepl("^([0-9]+,[0-9]+)+\\.[0-9]+$",tst$before)|grepl("^[0-9]+\\.[0-9]+$",tst$before)|grepl("^\\.[0-9]+$",tst$before)))]="DECIMAL"
print("'DECIMAL' classified")

print("getting moneysymbols")
moneysymbols<-unique(gsub(" |million|MILLION|billion|BILLION|trillion|TRILLION|\\.|,|[0-9]","",trn$before[trn$class=="MONEY"]))

print("Classifying 'MONEY'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(grepl("[0-9]",tst$before)&gsub(" |million|MILLION|billion|BILLION|trillion|TRILLION|\\.|,|[0-9]","",tst$before) %in% moneysymbols)]="MONEY"
print("'MONEY' classified.")
rm(moneysymbols)

print("fetching meastable")
meastable<-read.csv("meastable.csv",header=TRUE,sep=",")
meastable$measbefore<-as.character(meastable$measbefore)
meastable$measafter<-as.character(meastable$measafter)


print("Classifying 'MEASURE'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(!grepl("[0-9]s",tst$before)&grepl("[0-9]",tst$before)&gsub(" |million|MILLION|billion|BILLION|trillion|TRILLION|\\.|,|[0-9]","",tst$before) %in% meastable$measbefore)]="MEASURE"
print("'MEASURE' classified.")
rm(meastable)

print("Classifying 1st part 'ORDINAL'...")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&!grepl("/|january|february|march|april|may|june|july|august|september|october|november|december|sunday|monday|tuesday|wednesday|thursday|friday|saturday|jan|feb|mar|apr|may|jun|jul|aug|sep|sept|oct|nov|dec|mon|tues|wed|thurs|fri|sat ",tolower(tst$before))&grepl("1st|2nd|3rd|[0-9]th",tolower(tst$before))]="ORDINAL"
print("1st part 'ORDINAL' classified.")

print("Classifying 2nd parth 'ORDINAL...'")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&grepl("Ist$|IInd$|IIIrd$|Vth$|IIth$|^[IVXCMD]+Xth$",tst$before)]="ORDINAL"
print("2nd part 'ORDINAL' classified.")

print("classifying 'DATE'")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&grepl("^[0-9]{2}'s$|^[0-9]{4}'s",tolower(tst$before))]="DATE"

tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&grepl("^[0-9]{2}s$|^[0-9]{4}s",tolower(tst$before))]="DATE"

tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&grepl(" ad$| ad\\.$| a\\.d\\.$| bc$| bc\\.$| b\\.c\\.$| ce$| ce\\.$| c\\.e\\.$| bce$| bce\\.$| b\\.c\\.e\\.$",tolower(tst$before))]="DATE"

dasherdate<-gsub("/|\\.","-",tst$before)
tst$dasherdate<-dasherdate
rm(dasherdate)

tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&grepl("^[ 0][0-9]-[ 012][0-9]-[0-9]{2}$|^1[012]-3[01]-[0-9]{2}$|^1[012]-[ 012][0-9]-[0-9]{2}$|^[ 0][0-9]-3[01]-[0-9]{2}$|^[012][0-9]{3}-1[012]-[ 012][0-9]$|^[012][0-9]{3}-1[012]-3[01]$|^[012][0-9]{3}-[ 0][0-9]-[ 012][0-9]$|^[012][0-9]{3}-[ 0][0-9]-3[01]$|^[ 0][0-9]-[012][0-9]-[012][0-9]{3}$|^[ 0][0-9]-3[012]-[012][0-9]{3}$|^1[012]-[012][0-9]-[012][0-9]{3}$|^1[012]-3[012]-[012][0-9]{3}$",tst$dasherdate)]="DATE"

tst$dasherdate<-NULL


tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&grepl("[0-9]",tst$before)&grepl("january|february|march|april|may|june|july|august|september|october|november|december|jan|feb|mar|apr|may|jun|jul|aug|sep|sept|oct|nov|dec|sunday|monday|tuesday|wednesday|thursday|friday|saturday",tolower(tst$before))]="DATE"

load("probdatevectT")### see aws output
tst$probdatevectT<-probdatevectT
rm(probdatevectT)

tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&tst$probdatevectT==1&grepl("^[ 012][0-9]{3}$",tst$before)&!(tst$before %in% 2000:2009)]="DATE"

tst$probdatevectT<-NULL


print("'DATE' is classified")

print("classifying the various roman tokens")
load("romanguessT")### aws computed
load("romanguessFT")### aws computed  
load("romanguessIFT")### aws computed
load("romanguessXT")### aws computed
load("romanguessXFT")### aws computed
tst$romanguessT<-romanguessT
tst$romanguessFT<-romanguessFT
tst$romanguessIFT<-romanguessIFT
tst$romanguessXT<-romanguessXT
tst$romanguessXFT<-romanguessXFT

rm(romanguessT,romanguessFT,romanguessIFT,romanguessXT,romanguessXFT)

tst$Classs[tst$Classs==""&tst$romanguessT!=""]=tst$romanguessT[tst$Classs==""&tst$romanguessT!=""]
tst$Classs[tst$Classs==""&tst$romanguessFT!=""]=tst$romanguessFT[tst$Classs==""&tst$romanguessFT!=""]
tst$Classs[tst$Classs==""&tst$romanguessIFT!=""]=tst$romanguessIFT[tst$Classs==""&tst$romanguessIFT!=""]
tst$Classs[tst$Classs==""&tst$romanguessXT!=""]=tst$romanguessXT[tst$Classs==""&tst$romanguessXT!=""]
tst$Classs[tst$Classs==""&tst$romanguessXFT!=""]=tst$romanguessXFT[tst$Classs==""&tst$romanguessXFT!=""]

tst$romanguessT<-NULL
tst$romanguessFT<-NULL
tst$romanguessIFT<-NULL
tst$romanguessXT<-NULL
tst$romanguessXFT<-NULL


print("classified the various roman tokens")

print("classifying 'TELEPHONE'")
print("first we classify 911 and 999")

load("emrgncyT")### ran emrgncyT in AWSoutput
tst$emrgncyT<-emrgncyT
rm(emrgncyT)

tst$Classs[grepl("^911$|^999$",tst$before)&tst$emrgncyT==1]="TELEPHONE"
print("911 and 999 are classified")

tst$emrgncyT<-NULL


print("now we classify the remainder of the telephone numbers")
tst$Classs[tst$Classs==""&tst$before!="-"&tst$before!=":"&(grepl("^1-800",tst$before)|(!grepl("\\.|,|[a-zA-Z]|^-|-$",tst$before)&nchar(sub(" ","",tst$before))>3&!(sub(" ","",tst$before) %in% 1:999999)&grepl("[0-9]",tst$before)&grepl("^0| |-|\\(",tst$before)))]="TELEPHONE"

#print("running findverbat.R")
#load("verbat")
#source("findverbat.R")

print("we classify 'VERBATIM'")

load("verbmaybeT")### ran in AWSoutput
tst$verbmaybeT<-verbmaybeT
rm(verbmaybeT)

tst$Classs[tst$Classs==""&tst$verbmaybeT==1&tst$before!="-"&tst$before!=":"]="VERBATIM"
print("'VERBATIM IS CLASSIFIED'")

tst$verbmaybeT<-NULL


print("we classify the integers")



load("intguessT")### recalculated 10.24 ran see AWS output folder
load("intguessFT")### recalculated 10.25
load("intguess0T")# recalculated 10.25
load("intguess0FT")# recalculated 10.25
tst$intguessT<-intguessT
tst$intguessFT<-intguessFT
tst$intguess0T<-intguess0T
tst$intguess0FT<-intguess0FT
rm(intguessT,intguessFT,intguess0T,intguess0FT)

print("need to integrate tst$Classs into this part!!!")
tst$Classs[tst$Classs==""&tst$intguessT!=""]=tst$intguessT[tst$Classs==""&tst$intguessT!=""]
tst$Classs[tst$Classs==""&tst$intguessFT!=""]=tst$intguessFT[tst$Classs==""&tst$intguessFT!=""]
tst$Classs[tst$Classs==""&tst$intguess0T!=""]=tst$intguess0T[tst$Classs==""&tst$intguess0T!=""]
tst$Classs[tst$Classs==""&tst$intguess0FT!=""]=tst$intguess0FT[tst$Classs==""&tst$intguess0FT!=""]
print("the integers are classified")

tst$intguessT<-NULL
tst$intguessFT<-NULL
tst$intguess0T<-NULL
tst$intguess0FT<-NULL




print("Classifying '-' and ':' as 'to' where appropriate...")
print("....................................................")

#to.indicatorT is associated to spacingnumberT.R

source("spacingnumberT.R")

load("to.indicatorT")#
tst$to.indicatorT<-to.indicatorT
rm(to.indicatorT)

tst$Classs[tst$to.indicatorT==1]="PLAIN"
tst$Classs[tst$Classs==""&grepl("^-$|^:$",tst$before)]="PUNCT"
print("classified '-' and ':' to 'to' where appropriate")

tst$to.indicatorT<-NULL


print("remember, classifyinf -/to/: correctly does not")
print("align with the classes set forth by the training set")

###########
tst$Classs[tst$Classs==""&grepl("^[A-Z]$",tst$before)]="LETTERS"

load("romanguessPERT")### ran see AWS output folder
tst$romanguessPERT<-romanguessPERT
rm(romanguessPERT)

tst$Classs[tst$Classs==""&tst$romanguessPERT!=""]=tst$romanguessPERT[tst$romanguessPERT!=""]

tst$romanguessPERT<-NULL


tst$Classs[tst$Classs==""&grepl("^([A-Z]\\.){2,}$",tst$before)]="LETTERS"
###NEED MORE FOR LETTERS
print("remember, classifyinf -/to/: correctly does not")
print("align with the classes set forth by the training set")



#############CLEAN UP ROUND
print("we classify the loose ends....")
tst$Classs[tst$Classs==""&grepl("[0-9]AD$|[0-9]BC$|[0-9]CE$|[0-9]AD\\.$|[0-9]CE\\.$",tst$before)]="DATE"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("[0-9]-$",tst$before)]="DIGIT"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("^SR[ -][0-9]|^SR[0-9]|^I[ -][0-9]|^[A-Z][0-9]|^Interstate [0-9]|^U\\.S\\. [0-9]|^US [0-9]|^US[0-9]|^CR [0-9]|^CR[0-9]",tst$before)]="ADDRESS"
print("loose end..,")
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("[0-9],[0-9]",tst$before)]="CARDINAL"
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("^-[0-9]",tst$before)]="CARDINAL"
print("loose end..,")
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("[/\\.][12][0-9]{3}$",tst$before)]="DATE"
print("loose end..,")

tst$Classs[tst$Classs==""&grepl("º",tst$before)]="ORDINAL"
tst$Classs[tst$Classs==""&grepl("ª",tst$before)]="ORDINAL"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("^[0-9]{1,} $",tst$before)]="CARDINAL"
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("^[0-9]+$|^[0-9]+,$|^[0-9]+, $",tst$before)]="CARDINAL"
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("^[0-9]+:$",tst$before)]="CARDINAL"
print("loose end..,")
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("^[0-9] [0-9]$",tst$before)]="DIGIT"
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("[0-9] [0-9]",tst$before)]="CARDINAL"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("^[0-9]+ U.S. $",tst$before)]="DIGIT"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("[½⅓⅔¼¾⅕⅖⅗⅘⅙⅚⅐⅛⅜⅝⅞⅑⅒]",tst$before)]="FRACTION"
print("loose end..,")
tst$Classs[tst$Classs==""&!grepl("[a-zA-Z]",tst$before)&grepl("[0-9]",tst$before)&grepl("/",sub("/","",tst$before))]="DATE"
tst$Classs[tst$Classs==""&grepl("^Sun. [0-9]",tst$before)]="DATE"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("/mol$|/second$|/minute$|[ /]mm$|/m$|[ /]kg$|/h$|/cm$|sq mi$|/s$|/day$|/month$|/year$|km²$",tst$before)]="MEASURE"
print("loose end..,")
tst$Classs[tst$Classs==""&grepl("^[0-9]+s$|^[0-9]+'s$",tst$before)]="DATE"
print("loose end..,")
print("at this point you should run royalroman.R")

#################
print("loose end..,")

load("isroyalromanT")# recalculated 10.25
tst$isroyalromanT<-isroyalromanT
rm(isroyalromanT)

tst$Classs[tst$isroyalromanT==1]="ORDINAL"

tst$isroyalromanT<-NULL

tst$Classs[tst$Classs==""&grepl("[0-9] BC\\.$|[0-9] BC,$|[0-9] B\\.C$|[0-9] BCE,$|[0-9] A\\.D$",tst$before)]="DATE"


source("buildroman.R")
load("ROMANNUMERALS")
#load("rm") # on second laptop/thumbdrive
#load("rm1")
#load("rm2")
#load("rm3")
rm<-trn[trn$Classs==""&grepl("'s",trn$before)&(sub("'s","",trn$before) %in% ROMANNUMERALS),]
rm1<-(rm$before[rm$class=="LETTERS"])
rm2<-(rm$before[rm$class=="PLAIN"])
rm3<-(rm$before[rm$class=="ORDINAL"])

tst$Classs[tst$Classs==""&(tst$before %in% rm1)]="LETTERS"
tst$Classs[tst$Classs==""&(tst$before %in% rm2)]="PLAIN"
tst$Classs[tst$Classs==""&(tst$before %in% rm3)]="ORDINAL"




#######################
#######################

tst$Classs[tst$Classs==""&grepl("^so$|^So$|^no$|^No$",tst$before)]="PLAIN"

lowerbefore<-tolower(tst$before)
tst$lowerbefore<-lowerbefore

###here we classify PLAIN tokens that are british english words that are spelled differently is USenglish... i.e. metre vs meter
tst$Classs[tst$Classs==""&(tst$lowerbefore %in% BRIT.DIFFtab[,1])]="PLAINBRITDIFF"

load("USAUK")
### need to also consider upper case tokens
tst$Classs[tst$lowerbefore %in% USAUK[,1]]="PLAINBRITISH"
#tst$Classs[tst$Classs=="PLAINBRITISH"&(tst$lowerbefore %in% USAUK[,2])]="PLAIN"

#load dictionaries

plaindictionary<-unique(trn$before[trn$class=="PLAIN"])
lettersdictionary<-unique(trn$before[trn$class=="LETTTERS"])
intersectdictionary<-intersect(plaindictionary,lettersdictionary)
plaindictionary.diff<-plaindictionary[!(plaindictionary %in% intersectdictionary)]
lettersdictionary.diff<-lettersdictionary[!(lettersdictionary %in% intersectdictionary)]

tst$Classs[tst$Classs==""&(tst$before %in% plaindictionary.diff)]="PLAIN"
tst$Classs[tst$Classs==""&(tst$before %in% lettersdictionary.diff)]="LETTERS"
tst$Classs[tst$Classs==""&(tst$before %in% intersectdictionary)]="PLAIN"

lowintersectdictionary<-tolower(intersectdictionary)
lowplaindictionary.diff<-tolower(plaindictionary.diff)
lowlettersdictionary.diff<-tolower(lettersdictionary.diff)

tst$Classs[tst$Classs==""&(tolower(tst$before) %in% lowplaindictionary.diff)]="PLAIN"
tst$Classs[tst$Classs==""&(tolower(tst$before) %in% lowintersectdictionary)]="PLAIN"
tst$Classs[tst$Classs==""&(tolower(tst$before) %in% lowlettersdictionary.diff)]="LETTERS"

### this is where we use cachePLAIN cacheLETTERS (build them first..revised)


##an example of building "caches"

A<-trn[which(trn$class=="PLAIN")-1,]
B<-A$before[A$islast!=1]
C<-unique(B)
cachePLAIN<-C

A<-trn[which(trn$class=="LETTERS")-1,]
B<-A$before[A$islast!=1]
C<-unique(B)
cacheLETTERS<-C
save(cachePLAIN,file="cachePLAIN")
save(cacheLETTERS,file="cacheLETTERS")

load("cachePLAIN")
load("cacheLETTERS")
intcache<-intersect(cachePLAIN,cacheLETTERS)

cachePLAIN.diff<-cachePLAIN[!(cachePLAIN %in% intcache)]
cacheLETTERS.diff<-cacheLETTERS[!(cacheLETTERS %in% intcache)]
#run findplainletters.R


## this is where we classify chemistry abbreviations..basic example C02 is normalized to carbon dioxide...

load("CHEMS")

load("CHEMICALS")
tst$Classs[(tst$before %in% CHEMICALS[,1])&tst$Classs==""]="PLAINCHEMS"


load("plainlettersguessT")


tst$plainlettersguessT<-plainlettersguessT
tst$Classs[tst$Classs==""&tst$plainlettersguessT!=""]=tst$plainlettersguessT[tst$Classs==""&tst$plainlettersguessT!=""]




##now find plain with 's 've etc.
##10.26. more loose ends!!
tst$Classs[grepl("'$|'ve$|'s$|'re$",tst$before)&tst$Classs==""]="PLAIN"
tst$Classs[grepl("[A-Z]\\.",tst$before)&tst$Classs==""]="LETTERS"
tst$Classs[!grepl("[a-z]",tst$before)&grepl("[A-Z]",tst$before)&tst$Classs==""]="LETTERS"

tst$Classs[!grepl("[a-zA-Z]",tst$before)&tst$Classs==""]="VERBATIM"


tst$Classs[!(tst$before %in% CHEMS)&tst$Classs==""]="PLAIN"


Classs<-tst$Classs
save(Classs,file="Classs")







