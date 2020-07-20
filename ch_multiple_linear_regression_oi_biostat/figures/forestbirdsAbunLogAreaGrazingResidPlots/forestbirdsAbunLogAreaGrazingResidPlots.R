library(openintro)
library(oibiostat)

data(COL)
data(forest.birds)

library(plyr)

forest.birds$log.area = log(forest.birds$patch.area)

forest.birds$grazing.binary = forest.birds$grazing.intensity
forest.birds$grazing.binary = mapvalues(forest.birds$grazing.binary,
                                        from = c("light", "less than average",
                                                 "average", "moderately heavy"),
                                        to = c("moderate", "moderate", "moderate",
                                               "moderate"))


residuals = resid(lm(abundance ~ log.area + grazing.binary, data=forest.birds))
predicted = predict(lm(abundance ~ log.area + grazing.binary, data=forest.birds))

grazing = (forest.birds$grazing.binary == "heavy")

myPDF("forestbirdsAbunLogAreaGrazingResidPlots.pdf", 6, 3,
      mfrow = c(1, 3),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 3, .5, .5) + 0.1)
#mar = c(3, 0.2, 1.5, 0.8) + 0.1)

#plot one
plot(predicted,
     residuals,
     pch = 21,
     cex = 1,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "Predicted Value",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(predicted,
       residuals,
       cex = 1,
       col = COL[1])
#mtext("Predicted Value", 1, 1.9)

abline(lm(residuals ~ predicted), lty = 2)

#plot two, a (different colored points for grazing intensity)
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
title(xlab = "log.area")
abline(h = 0, lty = 2)

#plot two, b (standard plot)
plot(forest.birds$log.area,
     residuals,
     pch = 21,
     cex = 1,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "log(area)",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(forest.birds$log.area,
       residuals,
       cex = 1,
       col = COL[1])
abline(lm(residuals ~ forest.birds$log.area), lty = 2)

#plot three
boxplot(residuals ~ forest.birds$grazing.binary,
        ylab = 'Residual',
        ylim = c(min(residuals), max(residuals)),
        pch = 21,
        pchCex = 1,
        border = COL[1],
        outcol = COL[1],
        outbg = COL[1,3],
        col = COL[1,4],
        medlwd = 1.25,
        names = c("not heavy", "heavy"))
title(xlab = "grazing.binary")

dev.off()

