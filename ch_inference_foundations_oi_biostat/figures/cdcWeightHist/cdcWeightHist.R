library(openintro)
data(COL)

myPDF("cdcWeightHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(cdc.samp$weight,
         main = "",
         xlab = "Weight (lbs)",
         ylab = "Frequency",
         col = COL[1],
         xlim = c(50,300))
dev.off()
