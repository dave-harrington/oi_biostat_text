library(openintro)
data(COL)
library(oibiostat)
data(nhanes.samp.adult.500)

myPDF("nhanesHeightWeight.pdf",
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

t1 <- nhanes.samp.adult.500$Height[480]
t2 <- nhanes.samp.adult.500$Weight[480]
lines(c(t1, t1), c(-10, t2),
      lty = 2,
      col = COL[4])
lines(c(-10, t1), c(t2, t2),
      lty = 2,
      col = COL[4])
points(t1, t2,
       pch = 19,
       cex = 1.3,
       col = COL[4, 3],)

dev.off()