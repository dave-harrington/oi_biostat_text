library(openintro)
#data(income)
data(COL)

myPDF("incomeHistReg.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(life.expectancy.income$income,
         breaks = 9,
         xlab = 'Income (USD)',
         ylab = "Frequency",
         ylim = c(0, 120),
         col = COL[1],
         border = COL[5])
dev.off()