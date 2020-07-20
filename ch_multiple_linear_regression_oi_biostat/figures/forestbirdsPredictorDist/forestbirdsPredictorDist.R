library(openintro)
library(oibiostat)
data(forest.birds)
data(COL)

myPDF("forestbirdsPredictorDist.pdf", 6.6, 4,
      mfrow = c(2,3),
      mgp = c(2, 0.7, 0),
      mar = c(3, 2, 1, 1))
      #mar = c(3, 0, 1, 1))
histPlot(forest.birds$patch.area,
         breaks = 10,
         xlab = 'area',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(forest.birds$altitude,
         breaks = 10,
         xlab = 'altitude',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(forest.birds$dist.nearest,
         breaks = 10,
         xlab = 'dist.nearest',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(forest.birds$dist.larger,
         breaks = 10,
         xlab = 'dist.larger',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
histPlot(forest.birds$yrs.isolation,
         breaks = 10,
         xlab = 'yrs.isolation',
         ylab = "Frequency",
         ylim = c(0, 25),
         col = COL[1],
         border = COL[5])
barplot(table(forest.birds$grazing.intensity),
        axes = TRUE,
        xlab="grazing.intensity",
        ylim= c(0,25),
        col = COL[1])
dev.off()
