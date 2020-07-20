require(openintro)
data(COL)

myPDF('wdiPlotA.pdf', 5.5, 3.5,
      mar = c(3, 3.2, 0.5, 1),
      mgp = c(1.9, 0.45, 0))

plot(log(wdi.2011$inf.mort) ~ wdi.2011$sanit.access.num,
     pch = 20,
     cex = 1.7,
     col = COL[1, 3],
     xlab = "Access to Sanitation",
     ylab = "log(Infant Mortality)")

abline(4.0184, -1.6806, col = COL[5])

dev.off()


myPDF('wdiPlotB.pdf', 4.5, 4,
      mar = c(3, 3.5, 0, 0.5),
      mgp = c(1.9, 1.5 ,0))
dotPlot(log(wdi.2011$inf.mort), wdi.2011$sanit.access.num,
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
labels <- c("", "0\n(low)", "1\n(high)", "")
mtext("Access to Sanitation", 1, line = 1.5)
axis(1, at, labels)
par(mgp = c(1.9, 0.6, 0))
axis(2)
par(las = 0)
mtext("log(Infant Mortality)", 2, line = 2)
g <- lm(log(wdi.2011$inf.mort) ~ wdi.2011$sanit.access.num)
abline(g, lwd = 1.5, col = COL[5])
rect(-10, -1000, -0.125, 1000,
     border  =  rgb(1, 1, 1),
     col  =  rgb(1, 1, 1))
rect(10, -1000, 1.125, 1000,
     border  =  rgb(1, 1, 1),
     col  =  rgb(1, 1, 1))
dev.off()
