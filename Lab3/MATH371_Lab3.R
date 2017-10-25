rm(list=ls())

mysteryDATA = read.table(file="mysteryDATA.dat")
attach(mysteryDATA)
summary(mysteryDATA)

#choose data set
data=d2

#plot histogram of data set
by=1
min=min(data)
max=max(data)
size=length(data)
seq=seq(min-1-by/2,max+1+by/2,by)
hist(data,seq,prob=TRUE)

#eliminate bad distributions
isDisc = TRUE
isExp = TRUE
isGamma = TRUE
for(i in data){
	if((i %% 1) > 0){
		isDisc = FALSE
	}
	if(i < 0){
		isExp = FALSE
		isGamma = FALSE
	}
}

#find best fit distribution
if(isDisc){
	#fitBinom = 1
	fitGeom = fitdistr(data,"geometric")
	#fitHyper = 1
	fitPois = fitdistr(data,"Poisson")
	fitNBinom = fitdistr(data,"negative binomial") 
} else {
	#fitUnif = 1
	fitNorm = fitdistr(data,"normal")
	if(isExp){fitExp = fitdistr(data,"exponential")}
	if(isGamma){fitGamma = fitdistr(data,"gamma")}
	#fitChi = fitdistr(data,"chi-squared", list(df=1,ncp=0))
	fitBeta1 = fitdistr(data,"beta", list(shape1 = 0.5, shape2 = 0.5))
	fitBeta2 = fitdistr(data,"beta", list(shape1 = 0.5, shape2 = 1))
	fitBeta3 = fitdistr(data,"beta", list(shape1 = 0.5, shape2 = 2))
	fitBeta4 = fitdistr(data,"beta", list(shape1 = 1, shape2 = 0.5))
	fitBeta5 = fitdistr(data,"beta", list(shape1 = 1, shape2 = 1))
	fitBeta6 = fitdistr(data,"beta", list(shape1 = 1, shape2 = 2))
	fitBeta7 = fitdistr(data,"beta", list(shape1 = 2, shape2 = 0.5))
	fitBeta8 = fitdistr(data,"beta", list(shape1 = 2, shape2 = 1))
	fitBeta9 = fitdistr(data,"beta", list(shape1 = 2, shape2 = 2))
}

#print best distribution(s)
if(exists("fitBinom")){print(fitBinom)}
if(exists("fitGeom")){print(fitGeom)}
if(exists("fitHyper")){print(fitHyper)}
if(exists("fitPois")){print(fitPois)}
if(exists("fitNBinom")){print(fitNBinom)}
if(exists("fitUnif")){print(fitUnif)}
if(exists("fitNorm")){print(fitNorm)}
if(exists("fitExp")){print(fitExp)}
if(exists("fitGamma")){print(fitGamma)}
if(exists("fitChi")){print(fitChi)}
if(exists("fitBeta")){print(fitBeta)}

#overlay line of best fit distribution to histogram
x=seq(min,max,1)
#line=dbinom(x,size,prob)
#lines(x,line,col="red")

