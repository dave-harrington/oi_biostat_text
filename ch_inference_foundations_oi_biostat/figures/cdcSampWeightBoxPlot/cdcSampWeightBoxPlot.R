library(openintro)
#data(famuss)
data(COL)

myPDF("cdcSampWeightBoxPlot.pdf", 5, 7,
      mar = c(3.5, 3.5, 1, 0.5),
      mgp = c(1.5, 0.25, 0),
)

boxPlot(cdc.samp$weight,
        ylab = 'Weight',
        ylim = c(50, 450),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
