library(openintro)
library(oibiostat)
data(COL)
data("forest.birds")

forest.birds$log.area = log(forest.birds$patch.area)
forest.birds$log.dist.nearest = log(forest.birds$dist.nearest)
forest.birds$log.dist.larger = log(forest.birds$dist.larger)
forest.birds$log.yrs.isolation = log(forest.birds$yrs.isolation)

myPDF("forestbirdsScatterPlotMatrix.pdf",
#      6, 3.3,
     6, 5.5,
     mar = c(3, 4.5, 0.5, 1.2),
     mgp = c(2.0, 0.5, 0),
     mai = c(0.1, 0.1, 0.1, 0.1))

pairs(~ abundance + log.area + log.dist.nearest
      + log.dist.larger  + altitude + log.yrs.isolation +
        grazing.intensity, data=forest.birds,
      pch = 21,
      cex = 0.7,
      cex.axis = (0.8),
      bg = COL[1, 3],
      col = COL[1])

dev.off()
