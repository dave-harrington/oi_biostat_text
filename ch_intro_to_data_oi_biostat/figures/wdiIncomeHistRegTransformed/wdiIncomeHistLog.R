library(openintro)
data(COL)
library(oibiostat)
data(wdi.2011)

myPDF("wdiIncomeHistLog.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(wdi.2011$log.gdp.per.capita,
         breaks = 12,
         xlab = 'Income (log USD)',
         ylab = "Frequency",
         ylim = c(0, 30),
         col = COL[1],
         border = COL[5])
dev.off()