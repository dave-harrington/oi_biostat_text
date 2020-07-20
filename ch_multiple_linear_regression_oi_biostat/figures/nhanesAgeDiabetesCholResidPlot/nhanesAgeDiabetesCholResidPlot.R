myPDF("nhanesAgeDiabetesCholResidPlot.pdf", 6.51, 3.786,
      mar = c(3, 3, 0.5, 1),
      mgp = c(1.8, 0.6, 0))

plot(predicted,
     residuals,
     pch = 19,
     cex = 1.2,
     col = COL[1, 3],
     xlab = "Predicted Value",
     ylab = "Residual",
     ylim = c(min(residuals), max(residuals)))
points(residuals,
       predicted,
       cex = 1,
       col = COL[1])
#mtext("Predicted Value", 1, 1.9)

abline(lm(residuals ~ predicted), lty = 2)

dev.off()
