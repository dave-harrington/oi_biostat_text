library(openintro)
library(oibiostat)
data(COL)

load("babies.Rda")


myPDF("babiesScatterPlotMatrix.pdf",
      #      6, 3.3,
      5, 4,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.0, 0.5, 0),
      mai = c(0.1, 0.1, 0.1, 0.1))

pairs(babies[, -c(1, 4, 8)],
      pch = 21,
      cex = 0.5,
      cex.axis = (0.8),
      bg = COL[1, 3],
      col = COL[1])

dev.off()



myPDF("babiesBoxplots.pdf", 6.5, 3,
      mfrow = c(1, 3),
      mgp = c(2.5, 0.5, 0),
      mar = c(3.7, 3.7, 0.5, 1.5))

par(mfrow = c(1, 2))

boxplot(babies$bwt ~ babies$parity,
        pch = 21,
        pchCex = 1,
        border = COL[1],
        outcol = COL[1],
        outbg = COL[1,3],
        col = COL[1,4],
        medlwd = 1.25,
        names = c("not first born", "first born"),
        xlab = "", ylab = "")
title(ylab = "Birthweight (oz)")
title(xlab = "Birth Order")

par(mar = c(3.7, 4.7, 0.5, 0.5))
boxplot(babies$bwt ~ babies$smoke,
        pch = 21,
        pchCex = 1,
        border = COL[1],
        outcol = COL[1],
        outbg = COL[1,3],
        col = COL[1,4],
        medlwd = 1.25,
        names = c("nonsmoker", "smoker"),
        xlab = "", ylab = "")
title(ylab = "Birthweight (oz)")
title(xlab = "Mother Smoking Status")

dev.off()
