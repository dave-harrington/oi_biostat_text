library(openintro)
data(COL)

source("QQNorm.R")

set.seed(1)
obs1 <- 0.3 * rchisq(25, 1.4)

set.seed(5)
obs2 <- 16 - 2 * rlnorm(50, sdlog = 0.8)

myPDF("normalQuantileExerAdditional.pdf", 7.2, 3.18,
      mfrow = c(1, 2),
      mgp = c(2.4, 0.55, 0),
      mar = c(3.5, 3.45, 1, 1),
      cex.lab = 1.1)

QQNorm(obs1, 0:2, lwd = 2)
QQNorm(obs2, seq(5, 15, 5), lwd = 2)
dev.off()

dnbinom(2, 4, 0.8) #6 attempts for 4 successes
dnbinom(1, 4, 0.8) #5 attempts for 4 successes

dnbinom(6, 4, 0.8) #10 attempts for 4 successes


mu = .25*(1) + .40*(2) + .30*(3) + .05*(4)

var = .25*(1-mu)^2 + 0.40*(2-mu)^2 + 
  0.30*(3-mu)^2 + 0.05*(4-mu)^2

sd = sqrt(var)
sd

100*mu

(100^2)*var

sqrt((100^2)*var)

three.hearts = (13/52)*(12/51)*(11/50)
three.black = (26/52)*(25/51)*(24/50)
other = 1 - three.hearts - three.black

mean = three.hearts*(50) + three.black*(25)
var = ((50-mean)^2)*three.hearts + ((25-mean)^2)*three.black +
  ((0 - mean)^2)*other
sd = sqrt(var)
sd

mean - 5

data <- read.table(file="DataQuestionA1.dat.txt", header = TRUE)
data$T <- as.factor(data$T)
plot(y ~ T, data = data)


mean = .34*(25) + .12*(35)
var = .54*((0 - mean)^2) + 0.34*((25 - mean)^2) +
  .12*((35 - mean)^2)
sqrt(var)

sqrt(1 + 9*0.0625)
