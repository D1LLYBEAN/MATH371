mysteryDATA = read.table(file="mysteryDATA.dat")
attach(mysteryDATA)
summary(mysteryDATA)

by=1
data=d1
min=min(data)
max=max(data)
size=length(data)
prob=TRUE?
m=?
n=?
k=?
lambda=mean(data)
mu=?

seq=seq(min-1-by/2,max+1+by/2,by)
hist(data,seq,prob=TRUE)

x=seq(min,max,1)
line1=dbinom(x,size,prob)
line2=dgeom(x,prob)
line3=dhyper(x,m,n,k)
line4=dpois(x,mean)
line5=dnbinom(x,size,prob,mu)
line6=dgamma(x,shape,scale)

lines(x,line1,col="red")
lines(x,line2,col="red")
lines(x,line3,col="red")
lines(x,line4,col="red")
lines(x,line5,col="red")
lines(x,line6,col="red")

