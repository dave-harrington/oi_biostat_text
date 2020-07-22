library(openintro)
library(oibiostat)
data(wdi.2011)
data(COL)

myPDF("wdiIncomeHistReg.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(wdi.2011$gdp.per.capita,
         breaks = 9,
         col = COL[1],
         border = COL[5], xlab = "Income (USD)", ylab = "Frequency",
         axes = FALSE)
AxisInDollars(1, pretty(wdi.2011$gdp.per.capita))
axis(2, ylim = c(1, 120))
dev.off()
