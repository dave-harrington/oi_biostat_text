library(openintro)
library(oibiostat)
data(prevend.samp)
data(COL)

myPDF("prevendRFFTEducBoxPlot.pdf", 4.25, 4.25,
      mar = c(3.6, 3.6, 1, 0.5),
      mgp = c(2.4, 0.5, 0)
)

boxPlot(prevend.samp$RFFT, prevend.samp$Education,
        xlab = 'Education level',
        ylab = 'RFFT Score',
        ylim = c(0, 140),
        width = 0.60,
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()


