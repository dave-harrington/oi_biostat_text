library(openintro)
library(oibiostat)
data(prevend.samp)
data(COL)

statin.use = (prevend.samp$Statin == 1)

myPDF("prevendAgeRFFTConfounderPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(prevend.samp$Age[statin.use == FALSE],
     prevend.samp$RFFT[statin.use == FALSE],
     pch = 21,
     cex = 1.3,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "RFFT Score")
points(prevend.samp$Age[statin.use == TRUE],
     prevend.samp$RFFT[statin.use == TRUE],
     pch = 21,
     cex = 1.3,
     bg = COL[4, 3],
     col = COL[4])
mtext("Age (yrs)", 1, 1.9)

abline(v = 40, lty = 2)
abline(v = 50, lty = 2)
abline(v = 60, lty = 2)
abline(v = 70, lty = 2)
abline(v = 80, lty = 2)

dev.off()
