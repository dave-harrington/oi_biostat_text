library(openintro)
library(oibiostat)
data(forest.birds)
data(COL)

myPDF("forestbirdsLogPredictorDist.pdf", 6.6, 4,
      mfrow = c(2,2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 2, 1, 1))
#mar = c(3, 0, 1, 1))
histPlot(log(forest.birds$patch.area),
         breaks = 10,
         xlab = 'log(area)',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(log(forest.birds$dist.nearest),
         breaks = 10,
         xlab = "log(dist.nearest)",
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(log(forest.birds$dist.larger),
         breaks = 10,
         xlab = "log(dist.larger)",
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(log(forest.birds$yrs.isolation),
         breaks = 10,
         xlab = "log(yrs.isolation)",
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])

dev.off()
