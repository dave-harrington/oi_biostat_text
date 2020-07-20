library(openintro)
data(COL)
library(oibiostat)
data(wdi.2011)

myPDF("wdiIncomeHistReg.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(wdi.2011$gdp.per.capita,
         breaks = 9,
         xlab = 'Income (USD)',
         ylab = "Frequency",
         ylim = c(0, 120),
         col = COL[1],
         border = COL[5])
dev.off()