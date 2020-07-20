library(openintro)
library(oibiostat)
data(COL)
data(prevend.samp)

myPDF("prevendStatinAgeBoxPlot.pdf", 4.0, 5.0,
      mar = c(4.0, 4.0, 2.0, 0.5),
      mgp = c(2.2, 0.7, 0))
boxPlot(prevend.samp$Age, prevend.samp$Statin,
        ylab = 'Age (years)',
        xlab = 'Statin Use',
        pch = 19,
        cex = 1.0,
        lcol = COL[1],
        col = COL[1,3],
        axes = TRUE)

dev.off()

