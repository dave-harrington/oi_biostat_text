library(openintro)
library(dplyr)
library(ROCR)
data(COL)

d.primary = demographic.primary
d.valid = demographic.validation

# redefine for age-restricted data

d.primary = d.primary[d.primary$age < 100, ]
d.valid = d.valid[d.valid$age < 100, ]

# interaction model, primary data

m = glm(mort30 ~ triage + age + sex + age*sex, data = d.primary,
                    family = "binomial")

pred.m <- prediction(m$fitted.values, d.primary$mort30)
perf.m <- performance(pred.m, "tpr", "fpr")

# model with dept only

m.dept = glm(mort30 ~ triage, data = d.primary,
             family = "binomial")
fitted.m.dept = predict(m.dept, newdata = d.valid,
                        type = 'response')

pred.m.dept = prediction(fitted.m.dept,
                         d.valid$mort30)
perf.m.dept = performance(pred.m.dept, "tpr", "fpr")

fpr.dept = round(as.vector(perf.m.dept@x.values[[1]]), digits = 3)
tpr.dept = round(as.vector(perf.m.dept@y.values[[1]]), digits = 3)

# ns1 <- 4
myPDF("ROCDanishED.pdf", 7.7, 4.4,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

plot(perf.m,
     xlab = "False positive rate",
     ylab = "True positive rate",
     col = "blue")

abline(a = 0, b = 1)

lines(fpr.dept, tpr.dept,
      lty = 1, col = "darkgreen")

dev.off()

