library(openintro)
#data(famuss)
data(COL)

myPDF("famussHeightWeightLine.pdf",
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

abline(lm(famuss$weight ~ famuss$height))
dev.off()
