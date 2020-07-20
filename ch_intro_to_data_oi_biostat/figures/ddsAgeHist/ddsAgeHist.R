library(openintro)
#data(dds.discr)
data(COL)

myPDF("ddsAgeHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(dds.discr$age,
         breaks = 10,
         xlab = 'Age (years)',
         ylab = "Frequency",
         ylim = c(0, 450),
         col = COL[1],
         border = COL[5])
dev.off()