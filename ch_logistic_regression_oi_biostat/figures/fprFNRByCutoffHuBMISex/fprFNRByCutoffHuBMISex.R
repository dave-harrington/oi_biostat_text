library(openintro)
library(dplyr)
library(ROCR)
data(COL)

d = hyperuricemia.samp


m = glm(hu ~ bmi + sex, data = d,
          family = "binomial")
summary(m)


pred.m <- prediction(m$fitted.values, d$hu)
perf.m <- performance(pred.m, "tpr", "fpr")

fpr.m = round(as.vector(perf.m@x.values[[1]]), digits = 3)
tpr.m = round(as.vector(perf.m@y.values[[1]]), digits = 3)
cutoff.m = round(as.vector(perf.m@alpha.values[[1]]), digits = 3)
tnr.m = 1 - fpr.m
fnr.m = 1 - tpr.m

m.err.rates = as.data.frame(cbind(cutoff.m, fpr.m,
                                  tpr.m, tnr.m, fnr.m))

#ns1 <- 4

myPDF("fprFNRByCutoffHuBMISex.pdf", 7.7, 4.4,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

plot(m.err.rates$cutoff.m, m.err.rates$fpr.m, 
     type = "l", 
     xlab = "Threshold for predicted probability of hyperurcemia",
     ylab = "Error rates",
     lty = 1)
lines(m.err.rates$cutoff.m, m.err.rates$fnr.m, type = "l", lty = 3)

dev.off()
