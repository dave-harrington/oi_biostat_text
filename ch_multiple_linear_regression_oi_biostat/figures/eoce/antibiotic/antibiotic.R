load("antibiotics_2010.Rdata")


myPDF("antibioticsPlots.pdf", 6, 6,
      mfrow = c(1, 3),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 3, 1, .5) + 0.1)

par(mfrow = c(2, 2))

plot(antibiotics.2010$consumption ~ antibiotics.2010$female,
     main = "Consumption vs Female",
     ylab = "Consumption (DID)", xlab = "Percentage Female Pop",
     pch = 21, col = COL[1], bg = COL[1, 3], cex.main = 0.8, cex.lab = 0.9) 
plot(antibiotics.2010$consumption ~ antibiotics.2010$lifeexp,
     main = "Consumption vs Life Expectancy",
     ylab = "Consumption (DID)", xlab = "Life Expectancy (yrs)",
     pch = 21, col = COL[1], bg = COL[1, 3], cex.main = 0.8, cex.lab = 0.9)
plot(antibiotics.2010$consumption ~ antibiotics.2010$illiteracy,
     main = "Consumption vs Percent Illiterate", cex = 0.75,
     ylab = "Consumption (DID)", xlab = "Percentage Illiterate",
     pch = 21, col = COL[1], bg = COL[1, 3], cex.main = 0.8, cex.lab = 0.9) 
plot(antibiotics.2010$consumption ~ antibiotics.2010$popdensity,
     main = "Consumption vs Pop Density", cex = 0.75,
     ylab = "Consumption (DID)", xlab = "Density (1,000 people per sq km)",
     pch = 21, col = COL[1], bg = COL[1, 3], cex.main = 0.8, cex.lab = 0.9) 

dev.off()
