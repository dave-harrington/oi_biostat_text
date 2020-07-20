library(openintro)
#data(email50)
data(COL)

myPDF("frogClutchVolDotPlot.pdf",
      7.5,
      1.25,
      mar = c(3.6, 1, 0, 1),
      mgp = c(2.5, 0.7, 0),
      tcl = -0.4)
d <- frog.altitude$clutch.volume
dotPlot(d,
        xlab = 'Clutch Volumes',
        ylab = '',
        pch = 20,
        col = COL[1, 2],
        cex = 1.5,
        ylim = c(0.95, 1.05),
        axes = FALSE)
axis(1, at = seq(0, 3000, 100))
M <- mean(d)
polygon(M + c(-75, 75, 0) * 1.5,
        c(0.95, 0.95, 0.98),
        border = COL[4],
        col = COL[4])
dev.off()