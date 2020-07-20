library(openintro)
#data(famuss)
data(COL)

myPDF("famussHeightWeight.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(famuss$height,
     famuss$weight,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "",
     ylab = "Weight (lb)")
points(famuss$height,
       famuss$weight,
       cex = 1.3,
       col = COL[1])
mtext("Height (in)", 1, 1.9)

t1 <- famuss$height[290]
t2 <- famuss$weight[290]
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