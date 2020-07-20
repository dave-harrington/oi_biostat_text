library(openintro)
#data(frog.altitude)
data(COL)

myPDF("frogHistReg.pdf",
      4,
      3,
      mar = c(3.4, 2.4, 0.5, 0.5),
      mgp = c(2.1, 0.5, 0))
hist(frog.altitude$clutch.volume,
     breaks = 10,
     main = "",
     xlab = "Clutch Volume",
     ylab = "",
     axes = FALSE,
     col = COL[1])
axis(1, seq(0, 3000, 500))
axis(2, c(0, 50, 100))
dev.off()

myPDF("frogHistLog.pdf",
      4,
      3,
      mar = c(3.4, 2.4, 0.5, 0.5),
      mgp = c(2.2, 0.5, 0))
expr <- expression(log[10]*~"(Clutch Volume)")
hist(log10(frog.altitude$clutch.volume),
     main = "",
     breaks = 12,
     xlab = expr,
     axes = FALSE,
     ylab = "",
     col = COL[1])
axis(1)
axis(2, c(0, 30, 60, 90))
dev.off()

