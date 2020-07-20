library(openintro)
data(COL)
library(oibiostat)
data("nhanes.samp.adult.500")

source("nhanesHeightWeightHelpers.R")

obs = residuals(lm(Weight ~ Height, data=nhanes.samp.adult.500))
hold <- hist(obs, plot = FALSE)

myPDF("nhanesHeightWeightResiduals.pdf", 6, 2.7,
      mfrow = c(1, 2),
      mgp = c(2, 0.7, 0),
      mar = c(3, 0.2, 1, 0.8))
NormalHist(obs, hold, 
           mean(obs), 
           sd(obs),
           COL[1])

par(mar = c(3,4,1,0))

qqnorm(obs,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = "Sample Quantiles",
       col = COL[1])
axis(1)
axis(2)
qqline(obs)
dev.off()



