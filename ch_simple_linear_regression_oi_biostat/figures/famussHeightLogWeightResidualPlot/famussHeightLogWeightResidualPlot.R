
library(openintro)
data(COL)

height.logweight.residuals = residuals(lm(log(weight) ~ height, data=famuss))
height.logweight.predicted = predict(lm(log(weight) ~ height, data=famuss))

myPDF("famussHeightLogWeightResidualPlot.pdf", 6, 2.7,
      mfrow = c(1, 2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0.2, 1, 0.8))
plot(height.logweight.predicted, height.logweight.residuals, col=COL[1], main = "Predicted values vs Residuals",
     ylab = " ", xlab = " ", abline(h = 0))
boxplot(height.logweight.residuals, col=COL[1], main="Boxplot of residuals", axes=FALSE)

#par(mar = c(3,4,1,0))


#axis(1)
#axis(2)
dev.off()



