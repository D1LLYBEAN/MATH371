# remember to set RStudio to your working directory
setwd("~/Dropbox/371_2017/data")

# Poisson demos
ll=2.3
data<-rpois(100,ll)
data<-rpois(1000,ll)

hist(data,seq(-.5,max(data)+1,1),col="yellow")

ll=3.1
data<-rpois(1000,ll)
hist(data,seq(-.5,max(data)+1,1),add=T,col="cyan")

# Get the probability mass function for a binomial RV
# with n=10, p=.2 and other discrete RVs
probBinom=dbinom(0:10,10,.2)
probGeom<-dgeom(0:10,.2)
# similar commands for dhyper and dnbinom.  Use help(dhyper), etc.

# Get a random draw of size 100 from a binomial distribution
dataBINOM=rbinom(100,10,.2)

# some plotting commands for densities
# The first command makes a new plot, the second adds to the plot
hist(dataBINOM,seq(-.5,10.5,1),prob=T)
lines(0:10,probBinom,col="red")

# For the gamma densities, do not forget to specify
# scale = beta.  If you forget this, R will use rate = 1/scale

# gammas
x=seq(.01,7,.01)

gamma_a.1=dgamma(x, shape=.1)
gamma_a.5=dgamma(x, shape=.5)
gamma_a1=dgamma(x, shape=1)
gamma_a2=dgamma(x, shape=2)
gamma_a3=dgamma(x, shape=3)
gamma_a4=dgamma(x, shape=4)

plot(x,gamma_a1,col="magenta",type='l',lwd=5)
lines(x,gamma_a.1,col="blue",type='l',lwd=3)
lines(x,gamma_a.5,col="dark green",lwd=3)
lines(x,gamma_a3,col="cadet blue",lwd=3)
lines(x,gamma_a2,col="sky blue",lwd=3)
lines(x,gamma_a4,col="orange",lwd=3)

graphics.off()

# exponentials
x=seq(.01,7,.01)

exp_b.1=dgamma(x, shape=1, scale = .1 )
exp_b.5=dgamma(x, shape=1, scale = .5 )
exp_b1=dgamma(x, shape=1, scale = 1)
exp_b2=dgamma(x, shape=1, scale = 2)
exp_b4=dgamma(x, shape=1, scale = 4)

plot(x,exp_b1,col="magenta",type='l',lwd=5)
lines(x,exp_b.1,col="blue",type='l',lwd=3)
lines(x,exp_b.5,col="dark green",lwd=3)
lines(x,exp_b2,col="sky blue",lwd=3)
lines(x,exp_b4,col="orange",lwd=3)

# chi-squared
x=seq(.01,8,.01)

# degrees of freedom = 2*shape
chi_vu1=dgamma(x, shape=.5, scale = 2 )
chi_vu2=dgamma(x, shape=1, scale = 2 )
chi_vu3=dgamma(x, shape=1.5, scale = 2)
chi_vu4=dgamma(x, shape=2, scale = 2)
chi_vu5=dgamma(x, shape=2.5, scale = 2)
chi_vu6=dgamma(x, shape=3, scale = 2)

plot(x,chi_vu1,col="magenta",type='l',lwd=3)
#plot(x,chi_vu2,col="blue",type='l',lwd=3)
lines(x,chi_vu2,col="blue",lwd=3)
lines(x,chi_vu3,col="dark green",lwd=3)
lines(x,chi_vu4,col="sky blue",lwd=3)
lines(x,chi_vu5,col="orange",lwd=3)
lines(x,chi_vu6,col="black",lwd=3)

# betas
x=seq(0,1,.01)

beta_a1_b1=dbeta(x, 1,1)
beta_a2_b2=dbeta(x, 2,2)
beta_a3_b3=dbeta(x, 3,3)
beta_a.5_b.5=dbeta(x, .5,.5)
beta_a.1_b.1=dbeta(x, .1,.1)

plot(x,beta_a1_b1,col="magenta",type='l',lwd=3,ylim=c(0,2))
#plot(x,beta_a2_b2,col="cadet blue",type='l',lwd=3,ylim=c(0,2))
lines(x,beta_a2_b2,col="cadet blue",type='l',lwd=3)
lines(x,beta_a3_b3,col="blue",type='l',lwd=3)
lines(x,beta_a.5_b.5,col="orange",type='l',lwd=3)
lines(x,beta_a.1_b.1,col="red",type='l',lwd=3)

# asymmetries
# different alphas and betas
beta_a1.1_b.5=dbeta(x, .1,.5)
beta_a.2_b.5=dbeta(x, .2,.5)
beta_a.6_b.3=dbeta(x, .6,.3)

plot(x,beta_a1.1_b.5,col="magenta",type='l',lwd=3,ylim=c(0,5))
lines(x,beta_a.2_b.5,col="sky blue",lwd=3)
lines(x,beta_a.6_b.3,col="orange",type='l',lwd=3)

# asymmetries
# different alphas and betas
beta_a11_b5=dbeta(x, 1,5)
beta_a2_b5=dbeta(x, 2,5)
beta_a10_b3=dbeta(x, 10,3)

plot(x,beta_a11_b5,col="magenta",type='l',lwd=3,ylim=c(0,5))
lines(x,beta_a2_b5,col="sky blue",lwd=3)
lines(x,beta_a10_b3,col="orange",type='l',lwd=3)


