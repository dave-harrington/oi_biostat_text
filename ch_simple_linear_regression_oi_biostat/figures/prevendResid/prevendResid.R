require(openintro)
require(oibiostat)
data(prevend.samp)
data(COL)
set.seed(1)

myPDF('prevendResid.pdf', 5.5, 3.5,
      mar = c(3, 3.2, 0.5, 1),
      mgp = c(1.9, 0.45, 0))
these <- c(500, 170, 218)
#500 is +38 resid (age 40), #170 is +5 resid (age 56), #218 is -13 resid (age 77)

plot(prevend.samp$Age, prevend.samp$RFFT,
     pch = 20,
     cex = 1.7,
     col = COL[1, 3],
     xlab = "Age (yrs)",
     ylab = "RFFT Score")
points(prevend.samp$Age[these] + rnorm(3, 0, 0.02),
       prevend.samp$RFFT[these] + rnorm(3, 0, 0.02),
       pch = c(3, 4, 2),
       col = COL[4],
       cex = 1.5,
       lwd = 2.5)
abline(137.550, -1.261, col = COL[5])

for(i in 1:3){
  y2 <- 137.550 - 1.261 * prevend.samp$Age[these[i]]
  lines(rep(prevend.samp$Age[these[i]], 2),
        c(prevend.samp$RFFT[these[i]], y2),
        lty = 3,
        lwd = 2.5,
        col = COL[4])
}

dev.off()
