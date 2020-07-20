library(openintro)
library(oibiostat)

data(COL)
data(dds.discr)

#generate dataframe with only hispanics and white non-hispanics
dds.hispanics = dds.discr[dds.discr$ethnicity == "Hispanic", ]
dds.white.non.hisp = dds.discr[dds.discr$ethnicity == "White not Hispanic", ]
dds.hisp.white = rbind(dds.hispanics, dds.white.non.hisp)

residuals = resid(lm(expenditures ~ ethnicity + age, data = dds.hisp.white))
predicted = predict(lm(expenditures ~ ethnicity + age, data = dds.hisp.white))

myPDF("ddsAgeEthnicityResidNormPlot.pdf", 6, 3,
      mfrow = c(1, 2),
      mgp = c(3.2, 0.5, 0),
      mar = c(2, 4, 1.5, .5) + .1)

plot(predicted,
     residuals,
     pch = 19,
     cex = .7,
     col = COL[1, 3],
     xlab = "Predicted Value",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(predicted,
       residuals,
       cex = .7,
       col = COL[1])
#mtext("Predicted Value", 1, 1.9)

abline(lm(residuals ~ predicted), lty = 2)

par(mar = c(3,4,1,0))

qqnorm(residuals,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = "Sample Quantiles",
       xlab = "Theoretical Quantiles",
       col = COL[1,3])
axis(1)
axis(2)
qqline(residuals)
mtext("Theoretical Quantiles", 1, 1.9)

dev.off()
