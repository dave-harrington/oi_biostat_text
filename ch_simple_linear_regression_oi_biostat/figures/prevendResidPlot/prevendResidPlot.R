require(openintro)
data(COL)

myPDF('prevendResidPlot.pdf', 6.51, 3.786,
      mar = c(3, 3, 0.5, 1),
      mgp = c(1.8, 0.6, 0))
these <- c(500, 170, 218)

plot(137.550 - 1.261 * prevend.samp$Age[-these],
     prevend.samp$RFFT[-these] - (137.550 - 1.261 * prevend.samp$Age[-these]),
     pch = 20,
     cex = 1.5,
     col = COL[1, 3],
     xlab = 'Predicted RFFT Score',
     ylab = 'Residuals')
y.extra <- - 1.261 * prevend.samp$Age[these] + rnorm(1,0,0.01)
points(prevend.samp$Age[these] + rnorm(1, 0, 0.01),
       prevend.samp$RFFT[these] - (137.550 + y.extra),
       pch = c(3, 4, 2),
       col = COL[4],
       cex = 1.5,
       lwd = 2.5)
abline(h = 0, lty = 2)
dev.off()
