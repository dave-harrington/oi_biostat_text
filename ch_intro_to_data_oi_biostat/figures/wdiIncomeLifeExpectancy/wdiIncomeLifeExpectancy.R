library(openintro)
library(oibiostat)
data("wdi.2011")
data(COL)

myPDF("wdiIncomeLifeExpectancy.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(wdi.2011$gdp.per.capita, wdi.2011$life.expect,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     ylab = "Life Expectancy (years)",
     xlab = "Per Capita Income (USD)",
     axes = FALSE)
points(wdi.2011$gdp.per.capita, wdi.2011$life.expect,
       cex = 1.3,
       col = COL[1])
AxisInDollars(1, pretty(wdi.2011$gdp.per.capita))
axis(2)

dev.off()
