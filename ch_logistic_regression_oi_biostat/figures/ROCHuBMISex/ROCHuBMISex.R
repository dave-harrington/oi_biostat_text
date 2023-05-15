library(openintro)
library(dplyr)
library(ROCR)
data(COL)

d = hyperuricemia.samp


#m.int = glm(mort30 ~ triage + age + sex + age*sex, data = d.primary,
#        family = "binomial")
#summary(m.int)

m = glm(hu ~ bmi + sex, data = d,
          family = "binomial")
summary(m)


pred.m <- prediction(m$fitted.values, d$hu)
perf.m <- performance(pred.m, "tpr", "fpr")


fpr.m = round(as.vector(perf.m@x.values[[1]]), digits = 3)
tpr.m = round(as.vector(perf.m@y.values[[1]]), digits = 3)

d.fitted.values = predict(m, type = 'response')


# ns1 <- 4
myPDF("ROCHuBMISex.pdf", 6.0, 5.0,
#      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

plot(perf.m,
     xlab = "False positive rate",
     ylab = "True positive rate",
     col = "blue")

#plot(fpr.m, tpr.m, type = "l", col = "darkgreen")

abline(a = 0, b = 1)

#lines(fpr.m, tpr.m, type = "l",
#      lty = 1, col = "darkgreen")
#lines(fpr.m.int.valid, tpr.m.int.valid, 
#      lty = 1, col = "darkred")


dev.off()
