library(openintro)
#data(income)
data(COL)

myPDF("incomeHistLog.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(log(life.expectancy.income$income),
         breaks = 12,
         xlab = 'Income (log USD)',
         ylab = "Frequency",
         ylim = c(0, 30),
         col = COL[1],
         border = COL[5])
dev.off()