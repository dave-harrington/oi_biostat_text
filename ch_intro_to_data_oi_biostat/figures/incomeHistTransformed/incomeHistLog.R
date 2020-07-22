library(openintro)
library(oibiostat)
data(wdi.2011)
data(COL)

myPDF("incomeHistLog.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(log(wdi.2011$gdp.per.capita),
         breaks = 12,
         xlab = 'Income (log USD)',
         ylab = "Frequency",
         ylim = c(0, 30),
         col = COL[1],
         border = COL[5])
dev.off()