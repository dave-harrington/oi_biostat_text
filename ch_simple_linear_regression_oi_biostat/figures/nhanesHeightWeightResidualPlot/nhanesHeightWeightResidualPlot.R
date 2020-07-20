library(openintro)
data(COL)
library(oibiostat)
data("nhanes.samp.adult.500")

myPDF('nhanesHeightWeightResidualPlot.pdf', 6.51, 3.786,
      mar = c(3, 3, 0.5, 1),
      mgp = c(1.8, 0.6, 0))

plot(-57.7379 + 0.8389 * nhanes.samp.adult.500$Height,
     nhanes.samp.adult.500$Weight - (-57.7379 + 0.8389 * nhanes.samp.adult.500$Height),
     pch = 20,
     cex = 1.5,
     col = COL[1, 3],
     xlab = 'Predicted Weight',
     ylab = 'Residuals')
abline(h = 0, lty = 2)

dev.off()