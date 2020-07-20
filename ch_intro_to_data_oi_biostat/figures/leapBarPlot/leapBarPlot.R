library(openintro)
library(oibiostat)
data(LEAP)
data(COL)

leap.summary = table(LEAP$overall.V60.outcome, LEAP$treatment.group)
leap.summary.prop <- prop.table(leap.summary, 2)
leap.summary.prop

#leap seg bar

myPDF("leapBarPlot.pdf", 6,
      3.5)
par(mar=c(2.5, 2.5, 0.5, 7), xpd=TRUE)
barplot(leap.summary, col = COL[c(4, 1)], ylim = c(0, 280), width = 2)
legend("topright", inset = c(-.32, 0), fill = COL[c(4, 1)], legend = rownames(leap.summary))
dev.off()

#leap sta seg bar

myPDF("leapBarPlotSta.pdf",
      6,
      3.5)
par(mar=c(2.5, 2.5, 0.5, 7), xpd=TRUE)
barplot(leap.summary.prop, col = COL[c(4, 1)], ylim = c(0, 1), width = 2)
legend("topright", inset = c(-.32, 0), fill = COL[c(4, 1)], legend = rownames(leap.summary.prop))
dev.off()
