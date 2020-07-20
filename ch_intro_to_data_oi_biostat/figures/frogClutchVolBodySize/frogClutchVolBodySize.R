library(openintro)
#data(frog.altitude)
data(COL)

myPDF("frogClutchVolBodySize.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(frog.altitude$body.size,
     frog.altitude$clutch.volume,
     pch = 19,
     cex = 1.3,
     col = COL[1, 3],
     xlab = "Female Body Size",
     ylab = expression("Clutch Volume" ~ (mm^3)))
points(frog.altitude$body.size,
       frog.altitude$clutch.volume,
       cex = 1.3,
       col = COL[1])
mtext("Female Body Size (cm)", 1, 1.9)

dev.off()