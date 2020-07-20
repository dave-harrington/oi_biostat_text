library(openintro)
data(COL)
library(oibiostat)
data("nhanes.samp.adult.500")

myPDF("nhanesHeightWeightRegress.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(nhanes.samp.adult.500$Height,
     nhanes.samp.adult.500$Weight,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "Weight (kg)")
points(nhanes.samp.adult.500$Height,
       nhanes.samp.adult.500$Weight,
       cex = 1.3,
       col = COL[1])
mtext("Height (cm)", 1, 1.9)
abline(-57.7379, 0.8389, col = COL[5])

dev.off()
