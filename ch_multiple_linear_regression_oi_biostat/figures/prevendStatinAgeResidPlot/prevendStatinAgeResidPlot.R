library(openintro)
library(oibiostat)
data(COL)
data("prevend.samp")

obs = residuals(lm(RFFT ~ Statin + Age, data=prevend.samp))

myPDF("prevendStatinAgeResidPlot.pdf",
      6.0,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2) + 0.1,
      mgp = c(2.8, 0.5, 0))
plot(prevend.samp$Age,
     obs,
     pch = 19,
     cex = 1,
     col = COL[1, 3],
     xlab = "",
     ylab = "Residual")
points(prevend.samp$Age,
       obs,
       cex = 1,
       col = COL[1])
mtext("Age (yrs)", 1, 1.9)

abline(lm(obs ~ prevend.samp$Age), lty = 2)

dev.off()

