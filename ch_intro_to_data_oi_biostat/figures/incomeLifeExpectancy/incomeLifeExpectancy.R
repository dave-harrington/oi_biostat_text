library(openintro)
#data(income)
data(COL)

myPDF("incomeLifeExpectancy.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(life.expectancy.income$income, life.expectancy.income$life.expectancy,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     ylab = "Life Expectancy (years)")
points(life.expectancy.income$income, life.expectancy.income$life.expectancy,
       cex = 1.3,
       col = COL[1])
mtext("Per Capita Income (USD)", 1, 1.9)

dev.off()
