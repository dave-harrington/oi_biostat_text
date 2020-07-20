library(openintro)
library(oibiostat)
data(COL)
data(prevend)

myPDF("prevendAgeRFFTPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(prevend.samp$Age,
     prevend.samp$RFFT,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "RFFT Score")
points(prevend.samp$Age,
       prevend.samp$RFFT,
       cex = 1.3,
       col = COL[1])
mtext("Age (yrs)", 1, 1.9)

dev.off()
