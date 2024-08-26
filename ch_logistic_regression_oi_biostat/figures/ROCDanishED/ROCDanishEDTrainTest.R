
library(openintro)
library(dplyr)
library(ROCR)
data(COL)

d.primary = demographic.primary
d.valid = demographic.validation

# redefine for age-restricted data

d.primary = d.primary[d.primary$age < 100, ]
d.valid = d.valid[d.valid$age < 100, ]

# interaction model

m = glm(mort30 ~ triage + age + sex + age*sex, data = d.primary,
                    family = "binomial")
fitted.m = predict(m, newdata = d.valid,
                        type = 'response')

pred.m = prediction(fitted.m,
                    d.valid$mort30)
perf.m = performance(pred.m, "tpr", "fpr")

# model with dept only
#

m.dept = glm(mort30 ~ triage, data = d.primary,
        family = "binomial")
fitted.m.dept = predict(m.dept, newdata = d.valid,
                   type = 'response')

pred.m.dept = prediction(fitted.m.dept,
                    d.valid$mort30)
perf.m.dept = performance(pred.m.dept, "tpr", "fpr")


myPDF("ROCDanishED.pdf", 7.7, 4.4,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

plot(perf.m,
     xlab = "False positive rate",
     ylab = "True positive rate",
     col = "blue")

#pred.m.int <- prediction(m$fitted.int, d.primary$mort30)
#

# pred.m.int <- prediction(m.int$fitted.values, d.valid$mort30)

perf.m.int <- performance(pred.m.int, "tpr", "fpr")

m.null = glm(mort30 ~ triage, data = d.primary,
        family = "binomial")

fitted.values = predict(m.int, newdata = d.valid,
                              type = 'response')

pred.m.null <- prediction(m.null$fitted.values, d.primary$mort30)
perf.m.null <- performance(pred.m.null, "tpr", "fpr")

fpr = round(as.vector(perf.m.null@x.values[[1]]), digits = 3)
tpr = round(as.vector(perf.m.null@y.values[[1]]), digits = 3)



# ns1 <- 4
myPDF("ROCDanishED.pdf", 7.7, 4.4,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

plot(perf.m.int,
     xlab = "False positive rate",
     ylab = "True positive rate",
     col = "blue")

abline(a = 0, b = 1)

lines(fpr, tpr,
      lty = 1, col = "green")

# interaction model, test data

# fitted.values = predict(m, newdata = d.valid,
#                                type = 'response')

pred.m = prediction(fitted.values,
                              d.valid$mort30)
perf.m = performance(pred.m, "tpr", "fpr")

fpr = round(as.vector(perf.m@x.values[[1]]), digits = 3)
tpr = round(as.vector(perf.m@y.values[[1]]), digits = 3)

lines(fpr, tpr,
      lty = 2, col = "blue")

# DEPT classification, primary data

m = glm(mort30 ~ triage, data = d.primary,
                family = "binomial")


pred.m <- prediction(m$fitted.values, d.primary$mort30)
perf.m <- performance(pred.m, "tpr", "fpr")


fpr = round(as.vector(perf.m@x.values[[1]]), digits = 3)
tpr = round(as.vector(perf.m@y.values[[1]]), digits = 3)

lines(fpr, tpr,
      lty = 1, col = "darkgreen")

# DEPT classification, test data

m = glm(mort30 ~ triage, data = d.valid,
        family = "binomial")

pred.m <- prediction(m$fitted.values, d.valid$mort30)
perf.m <- performance(pred.m, "tpr", "fpr")


fpr = round(as.vector(perf.m@x.values[[1]]), digits = 3)
tpr = round(as.vector(perf.m@y.values[[1]]), digits = 3)

lines(fpr, tpr,
      lty = 2, col = "darkgreen")


dev.off()
