#!/bin/Rscript


#print("trillion is limit for precision")
#L<-sample(1:100000000,50,replace=FALSE,prob=NULL)

#i=1
#while(i<=50){
#    n=L[i]
#    print(L[i])
############    

#print("given number n")
####first find degree of polynomial "in 10" and thousands millions etc
l1=1
l2=10*l1
p=0
t=0
tag=1
while(tag>0){
    if(n>=l1&n<l2){
        #print("p and t is")
        #print(p)
        #print(t)
        tag=0
    }else{
        l1=10*l1
        l2=10*l2
    if(p%%3==2){
        t=t+1
        p=p+1
    }else{
        p=p+1
    }
    }
}
##########
ones<-c("one","two","three","four","five","six","seven","eight","nine")
ones.ths<-c("firsts","seconds","thirds","fourths","fifths","sixths","sevenths","eighths","ninths")
## exception for teens
tens<-c("twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety")
tens.ths<-c("twentieths","thirtieths","fortieths","fiftieths","sixtieths","seventieths","eightieths","ninetieths")
##
teens<-c("ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eightteen","nineteen")
teens.ths<-c("tenths","elevenths","twelfths","thirteenths","fourteenths","fifteenths","sixteenths","seventeenths","eighteenths","nineteenths")
##
hundreds<-c("one hundred","two hundred","three hundred","four hundred","five hundred","six hundred","seven hundred","eight hundred","nine hundred")
hundreds.ths<-c("one hundredths","two hundredths","three hundredths","four hundredths","five hundredths","six hundredths","seven hundredths","eight hundredths","nine hundredths")
##
thousands<-c("thousand","million","billion","trillion","quadrillion","quintillion")
thousands.ths<-c("thousandths","millionths","billionths","trillionths","quadrillionths","quintillionths")
##pos is position 
pos=p
tos=t
tt=0
m=n
Z=0

###### put TAG in numberator!!!
TAG=1
word<-""
if(p==0&n==2){
    if(TAG==1){
    word<-"half"
    }else if(TAG>2){
    word<-"halves"
    }
}
while(pos>0){ 
x=floor(m/(10^(pos)))
##
if((m-x*10^pos)==0){
Z=1
}
##
#print("x is")
#print(x)
    if(pos%%3==0&tt!=1){
        if(x==0){
        #word<-stringi::stri_join(word,"and")
        }else{
        #print(ones[x])
        if(Z==1){
        word<-stringi::stri_join(word,ones.ths[x]) 
        }else{
        word<-stringi::stri_join(word,ones[x]) 
        }        
        #print("word00 tt")
        #print(word)
        #print(tt)
        
        }  
    }else if(pos%%3==1){
        if(x==0){
            #word<-stringi::stri_join(word,"and")
        }else if(x==1){
                       
            tt=1
            y=floor((m-10^pos)/(10^(pos-1)))
            #print(teens[y+1])
            if((m-x*10^pos-y*10^(pos-1))==0){
            word<-stringi::stri_join(word,teens.ths[y+1])
            }else{
            word<-stringi::stri_join(word,teens[y+1])
            }            
            #print("words in ")
            #print(word)
            m=as.double(m-y*10^(pos-1))
            #print("m in")
            #print(m)
            
        }else{
                          
            #print(tens[x-1]) 
            if(Z==1){
            word<-stringi::stri_join(word,tens.ths[x-1])
            }else{     
            word<-stringi::stri_join(word,tens[x-1])
            }
        }   
    }else{
        if(x==0){
                        
            #word<-stringi::stri_join(word,"and")
            
        }else{        
            #print(hundreds[x])
            #print("and")
            if(Z==1){
            word<-stringi::stri_join(word, hundreds.ths[x]," ")
            }else{
            word<-stringi::stri_join(word, hundreds[x]," ")
            }
            ###
            y=floor((m-x*10^pos)/(10^(pos-1)))
##
            z=floor(((m-x*10^pos)-y*10^pos)/(10^(pos-2)))
            
            if(y==0&z==0){
                #do nothing
            }else{
              
               #word<-stringi::stri_join(word,"and")
               
            }
        }
    }
    if(pos%%3==0||(pos%%3==1&x==1)&pos!=1){
        #print(thousands[tos])
        if(Z==1){
        word<-stringi::stri_join(word," ",thousands.ths[tos])
        }else{ 
        word<-stringi::stri_join(word," ",thousands[tos])
        }        
        tos=tos-1 
        tt=0       
            
    }


word<-stringi::stri_join(word," ")
#print("wordss")
#print(word)

#print("pos is")
#print(pos)
#print("word is")
#print(word)

m=as.double(m-x*10^pos)
#print("pos is")
#print(pos)
#print("m is")
#print(m)

#print("m is")
#print(m)
if(pos%%3==1&(x==1)){
pos=pos-1
#print("posif is")
#print(pos)
}


pos=pos-1
#print("posend is")
#print(pos)
}

if(pos==0||-1){
     x=m
     if(x==0){
     
     }else{
     #print(ones[x])
     
     word<-stringi::stri_join(word,ones.ths[x])
        
     }
}
#word<-gsub("  "," ",word)
wordb<-word

#print(word)

############
#i=i+1
#}
