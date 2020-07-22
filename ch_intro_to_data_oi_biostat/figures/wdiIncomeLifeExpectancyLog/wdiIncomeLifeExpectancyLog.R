library(openintro)
library(oibiostat)
data("wdi.2011")
data(COL)

myPDF("wdiIncomeLifeExpectancyLog.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(log(wdi.2011$gdp.per.capita), log(wdi.2011$life.expect),
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     ylab = "Life Expectancy (log years)")
points(log(wdi.2011$gdp.per.capita), log(wdi.2011$life.expect),
       cex = 1.3,
       col = COL[1])
mtext("Per Capita Income (log USD)", 1, 1.9)

dev.off()

