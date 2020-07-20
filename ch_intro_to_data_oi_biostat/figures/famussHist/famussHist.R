library(openintro)
#data(famuss)
data(COL)

myPDF("famussHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(famuss$height,
         breaks = 14,
         xlab = 'Height',
         ylab = "Frequency",
         ylim = c(0, 150),
         col = COL[1],
         border = COL[5])
dev.off()
