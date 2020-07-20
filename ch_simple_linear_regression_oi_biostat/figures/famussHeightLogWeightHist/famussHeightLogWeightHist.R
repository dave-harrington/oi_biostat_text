library(openintro)
data(COL)

myPDF("famussHeightLogWeightHist.pdf", 6, 2.7,
      mfrow = c(1, 2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0.2, 1, 0.8))
hist(famuss$height, main="", xlab="Height", axes=FALSE, col=COL[1])
Axis(side=1)
hist(log(famuss$weight), main="", xlab="Log(weight)", axes=FALSE, col=COL[1])
Axis(side=1)
dev.off()

