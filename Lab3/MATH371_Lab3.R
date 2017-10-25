library(MASS)

rm(list=ls())
cat("\014")

mysteryDATA = read.table(file="mysteryDATA.dat")
attach(mysteryDATA)
#summary(mysteryDATA)

#choose data set
data=d5
summary(data)
min=min(data)
max=max(data)
size=length(data)

#eliminate bad distributions
by=max/10
isDisc = TRUE
isExp = TRUE
isGamma = TRUE
isBeta = TRUE
for(i in data){
	if((i %% 1) > 0){
	  by=1
		isDisc = FALSE
	}
	if(i < 0){
		isExp = FALSE
		isGamma = FALSE
		isBeta = FALSE
	}
  if(i > 0){
    isBeta = FALSE
  }
}

seq=seq(min-1-by/2,max+1+by/2,by)
hist(data,seq,prob=TRUE)

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
	if(isBeta){
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
}

#print best distribution(s)
x=seq(min,max,1)
#discrete distributions
if(exists("fitBinom")){
  print(fitBinom)
  line=dbinom(x,size=fitBinom[1])
  lines(x,line,col="red",lty="dashed",lwd=2)
}
if(exists("fitGeom")){
  print(fitGeom)
  line=dgeom(x,prob=fitGeom$estimate[1])
  lines(x,line,col="green",lty="dotted",lwd=2)
}
if(exists("fitHyper")){
  print(fitHyper)
  line=dhyper(x,m=,n=,k=)
  lines(x,line,col="blue",lty="dotdash",lwd=2)
}
if(exists("fitPois")){
  print(fitPois)
  line=dpois(x,lambda=fitPois$estimate[1])
  lines(x,line,col="violet",lty="longdash",lwd=2)
}
if(exists("fitNBinom")){
  print(fitNBinom)
  line=dnbinom(x,size=fitNBinom$estimate[1],mu=fitNBinom$estimate[2])
  lines(x,line,col="cyan",lty="twodash",lwd=2)
}
#continuous distributions
if(exists("fitUnif")){
  print(fitUnif)
  line=dunif(x,min=fitUnif$estimate[1],max=fitUnif[2])
  lines(x,line,col="red",lty="dashed",lwd=2)
}
if(exists("fitNorm")){
  print(fitNorm)
  line=dnorm(x,mean=fitNorm$estimate[1],sd=fitNorm$estimate[2])
  lines(x,line,col="green",lty="dotted",lwd=2)
}
if(exists("fitExp")){
  print(fitExp)
  line=dexp(x,rate=fitExp$estimate[1])
  lines(x,line,col="blue",lty="dotdash",lwd=2)
}
if(exists("fitGamma")){
  print(fitGamma)
  line=dgamma(x,shape=fitGamma$estimate[1],rate=fitGamma$estimate[2])
  lines(x,line,col="violet",lty="longdash",lwd=2)
}
if(exists("fitChi")){
  print(fitChiSq)
  line=dchisq(x,df=fitChiSq$estimate[1])
  lines(x,line,col="cyan",lty="twodash",lwd=2)
}
if(exists("fitBeta")){
  print(fitBeta)
  line=dbeta(x,shape1=fitBeta$estimate[1],shape2=fitBeta$estimate[2])
  lines(x,line,col="yellow",lty="solid",lwd=2)
}