library(openintro)
library(oibiostat)
data(prevend.samp)
data(COL)


myPDF("prevendRFFTHist.pdf", 4.5, 4.0,
      mgp = c(2.4, 0.7, 0),
      mar = c(3.5, 3.5, 0.5, 1.0))

histPlot(prevend.samp$RFFT,
         breaks = 14,
         xlab = 'RFFT Scores',
         ylab = "Frequency",
         ylim = c(0, 70),
         col = COL[1],
         border = COL[5])

dev.off()
