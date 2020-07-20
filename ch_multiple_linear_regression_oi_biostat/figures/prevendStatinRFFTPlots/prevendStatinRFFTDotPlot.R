library(openintro)
library(oibiostat)
data(COL)
data(prevend.samp)


myPDF('prevendStatinRFFTDotPlot.pdf', 4.5, 4.0,
      mar = c(3, 3.0, 2.0, 0.5) + 0.1,
      mgp = c(1.9, 1.5 ,0))


dotPlot(prevend.samp$RFFT, prevend.samp$Statin,
        vertical = TRUE,
        at = 0:1,
        key = 0:1,
        xlab = "",
        ylab = "",
        axes = FALSE,
        col = COL[1, 3],
        pch = 19,
        cex = 1.3)
at <- -1:2
labels <- c("", "0\n(No)", "1\n(Yes)", "")
mtext("Statin Use", 1, line = 1.5)
axis(1, at, labels)
par(mgp = c(1.9, 0.6, 0.0))
axis(2)
par(las = 0)
mtext("RFFT Score", 2, line = 2)
g <- lm(prevend.samp$RFFT ~ prevend.samp$Statin)
abline(g, lwd = 1.5, col = COL[5])
rect(-10, -1000, -0.125, 1000,
     border  =  rgb(1, 1, 1),
     col  =  rgb(1, 1, 1))
rect(10, -1000, 1.125, 1000,
     border  =  rgb(1, 1, 1),
     col  =  rgb(1, 1, 1))

dev.off()
