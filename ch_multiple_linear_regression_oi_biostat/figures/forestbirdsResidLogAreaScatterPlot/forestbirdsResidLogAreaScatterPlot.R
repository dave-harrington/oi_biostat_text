library(openintro)
library(oibiostat)
data("forest.birds")
data(COL)


forest.birds$log.area = log(forest.birds$patch.area)

library(plyr)
forest.birds$grazing.binary = forest.birds$grazing.intensity
forest.birds$grazing.binary = mapvalues(forest.birds$grazing.binary,
                                        from = c("light", "less than average",
                                                 "average", "moderately heavy"),
                                        to = c("moderate", "moderate", "moderate",
                                               "moderate"))

grazing = (forest.birds$grazing.binary == "heavy")

residuals = resid(lm(abundance ~ log.area + grazing.binary, data=forest.birds))
predicted = predict(lm(abundance ~ log.area + grazing.binary, data=forest.birds))

myPDF("forestbirdsResidLogAreaScatterPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(forest.birds$log.area[grazing == FALSE],
     residuals[grazing == FALSE],
     pch = 21,
     cex = 1,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "Residual")
points(forest.birds$log.area[grazing == TRUE],
     residuals[grazing == TRUE],
     pch = 21,
     cex = 1,
     bg = COL[4, 3],
     col = COL[4])
mtext("log.area", 1, 1.9)
abline(h = 0, lty = 2)



dev.off()
