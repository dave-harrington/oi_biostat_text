library(openintro)
data(COL)

myPDF("wdiHistReg.pdf",
      4,
      3,
      mar = c(3.4, 2.4, 0.5, 0.5),
      mgp = c(2.1, 0.5, 0))
hist(wdi.2011$inf.mort,
     breaks = 10,
     main = "",
     xlab = "Infant Mortality (deaths/1,000 live births) ",
     ylab = "",
     axes = FALSE,
     col = COL[1])
axis(1, seq(0, 110, 10))
axis(2, c(0, 10, 20, 30, 40, 50))

dev.off()

myPDF("wdiHistLog.pdf",
      4,
      3,
      mar = c(3.4, 2.4, 0.5, 0.5),
      mgp = c(2.2, 0.5, 0))
expr <- expression(log*~"(Infant Mortality)")
hist(log(wdi.2011$inf.mort),
     main = "",
     breaks = 9,
     xlab = expr,
     axes = FALSE,
     ylab = "",
     col = COL[1])
axis(1)
axis(2, c(0, 10, 20, 30))

dev.off()

