require(openintro)
#data(frog.altitude)
data(COL)
d   <- frog.altitude$clutch.volume

myPDF("frogBoxPlot.pdf", 6.1, 4,
      mar = c(0, 4, 0, 1),
      mgp = c(2.8, 0.7, 0))
boxPlot(d,
        ylab = 'Clutch Volume',
        xlim = c(0.3, 3),
        axes = FALSE,
        ylim = range(d))
axis(2)

arrows(2,min(d), 1.4, min(d) - 5, length = 0.08)
text(2, min(d), 'lower whisker', pos = 4)

q1 <- quantile(d, 0.25)
arrows(2, q1, 1.4, q1, length = 0.08)
text(2, q1,
     expression(Q[1]~~'(first quartile)'), pos = 4)

m <- median(d)
arrows(2, m, 1.4, m, length = 0.08)
text(2, m, 'median (second quartile)', pos = 4)

q3 <- quantile(d, 0.75)
arrows(2, q3, 1.4, q3, length = 0.08)
text(2, q3,
     expression(Q[3]~~'(third quartile)'), pos = 4)

arrows(2, rev(sort(d))[11],
       1.4, rev(sort(d))[11], length = 0.08)
text(2, rev(sort(d))[11],
     'upper whisker', pos = 4)

#y <- quantile(d, 0.75) + 1.5 * IQR(d)
#arrows(2, y, 1.4, y, length = 0.08)
#lines(c(0.72, 1.28), rep(y, 2),
      #lty = 3, col = '#00000066')
#text(2, y,
     #'max whisker reach', pos = 4)

m <- rev(tail(sort(d), 9))
s <- m[1] - 0.4 * sd(m)
arrows(2, s - 200, 1.1, m[1] - 0.2, length = 0.08)
arrows(2, s - 200, 1.1, m[2] + 0.3, length = 0.08)
arrows(2, s - 200, 1.1, m[3] + 0.35, length = 0.08)
arrows(2, s - 200, 1.1, m[4] + 0.4, length = 0.08)
arrows(2, s - 200, 1.1, m[5] + 0.45, length = 0.08)
arrows(2, s - 200, 1.1, m[6] + 0.5, length = 0.08)
#arrows(2, s - 200, 1.1, m[7] + 0.55, length = 0.08)
arrows(2, s - 200, 1.1, m[8] + 0.6, length = 0.08)
arrows(2, s - 200, 1.1, m[9] + 0.7, length = 0.08)
text(2, s - 200, 'outliers', pos = 4)

points(rep(0.4, 215), rev(sort(d))[1:215],
       cex = rep(1.3, 431),
       col = rep(COL[1, 3], 431),
       pch = rep(1, 431))
points(rep(0.4, 215), sort(d)[1:215],
       cex = rep(1, 215),
       col = rep(COL[4,3], 215),
       pch = rep("-", 215))

dev.off()
