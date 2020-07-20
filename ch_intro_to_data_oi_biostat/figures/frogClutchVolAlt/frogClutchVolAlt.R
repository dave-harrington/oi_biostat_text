library(openintro)
#data(frog.altitude)
data(COL)

myPDF("frogClutchVolAlt.pdf", 7.5, 5,
      mar = c(3.6, 3.6, 1, 0.5),
      mgp = c(2.4, 0.25, 0),
      )

boxPlot(frog.altitude$clutch.volume, frog.altitude$altitude,
        xlab = 'Altitude',
        ylab = 'Clutch Volume',
        ylim = c(0, 3000),
        pch = 19,
        pchCex = 1.8,
        lcol = COL[1],
        col = COL[1,3])

dev.off()