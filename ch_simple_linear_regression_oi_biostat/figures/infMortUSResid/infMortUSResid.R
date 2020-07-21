library(openintro)
library(oibiostat)
data(COL)
data("census.2010")
dc = 9

myPDF('infMortUSResidualPlot.pdf', 6.51, 3.786,
      mar = c(3, 3, 0.5, 1),
      mgp = c(1.8, 0.6, 0))

predicted = predict(lm(census.2010$inf.mort[-dc] ~ census.2010$doctors[-dc]))
residuals = residuals(lm(census.2010$inf.mort[-dc] ~ census.2010$doctors[-dc]))

plot(predicted,
     residuals,
     pch = 20,
     cex = 1.5,
     col = COL[1, 3],
     xlab = 'Predicted Infant Mortality',
     ylab = 'Residuals')
abline(h = 0, lty = 2)

dev.off()


###############


NormalHist <- function(obs, hold, M, SD, col) {
  plot(0, 0,
       type = 'n',
       xlab = 'Residuals',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = M + c(-3, 3) * SD,
       ylim = 1.1 * c(0, 0.0005 + max(hold$density)))
  for (i in 1:length(hold$counts)) {
    rect(hold$breaks[i], 0,
         hold$breaks[i + 1], hold$density[i],
         col = col)
  }
  axis(1)
  x <- seq(min(obs) - 2, max(obs) + 2, 0.01)
  y <- dnorm(x, M, SD)
  lines(x, y, lwd = 1.5)
}

# source("famussHeightWeightHelpers.R")

obs = residuals(lm(census.2010$inf.mort[-dc] ~ census.2010$doctors[-dc]))
hold <- hist(obs, plot = FALSE)

myPDF("infMortUSResidNormPlot.pdf", 6, 3,
      mfrow = c(1, 2),
      mgp = c(1.9, 0.5, 0),
      mar = c(3, 0.2, 0.5, 0.8))

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
       col = COL[1,2])
axis(1)
axis(2)
qqline(obs)

dev.off()

