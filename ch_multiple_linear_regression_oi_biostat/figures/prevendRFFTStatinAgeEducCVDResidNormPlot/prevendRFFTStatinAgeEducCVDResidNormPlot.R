library(openintro)
library(oibiostat)

data(COL)
data(prevend.samp)


residuals = resid(lm(RFFT ~ as.factor(Statin) + Age  + 
                    as.factor(Education) + as.factor(CVD), 
                  data=prevend.samp))

predicted = predict(lm(RFFT ~ as.factor(Statin) + Age  + 
                    as.factor(Education) + as.factor(CVD), 
                  data=prevend.samp))

myPDF("prevendRFFTStatinAgeEducCVDResidNormPlot.pdf", 6, 3,
      mfrow = c(1, 2),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 3, .5, .5) + 0.1)
#mar = c(3, 0.2, 1.5, 0.8) + 0.1)
plot(predicted,
     residuals,
     pch = 19,
     cex = 1,
     col = COL[1, 3],
     xlab = "Predicted Value",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(predicted,
       residuals,
       cex = 1,
       col = COL[1])
#mtext("Predicted Value", 1, 1.9)

abline(lm(residuals ~ predicted), lty = 2)

par(mar = c(3,4,1,0))

qqnorm(residuals,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = "Sample Quantiles",
       col = COL[1,3])
axis(1)
axis(2)
qqline(residuals)

dev.off()


