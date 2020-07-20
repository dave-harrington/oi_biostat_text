library(openintro)
#data(famuss)
data(COL)

myPDF("famussBoxPlot.pdf", 3, 4,
      mar = c(0.5, 3.5, 0.5, 0.5),
      mgp = c(2, 0.55, 0),
)

boxPlot(famuss$height,
        ylab = 'Height',
        ylim = c(55, 80),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
