library(openintro)
library(oibiostat)

data(COL)
data(forest.birds)

library(plyr)

forest.birds$grazing.binary = forest.birds$grazing.intensity
forest.birds$grazing.binary = mapvalues(forest.birds$grazing.binary,
                                        from = c("light", "less than average",
                                                 "average", "moderately heavy"),
                                        to = c("moderate", "moderate", "moderate",
                                               "moderate"))


residuals = resid(lm(abundance ~ log.area + grazing.binary, data=forest.birds))
predicted = predict(lm(abundance ~ log.area + grazing.binary, data=forest.birds))

myPDF("forestbirdsAbunLogAreaGrazingNormPlots.pdf", 6, 3,
      mfrow = c(1, 2),
      mgp = c(1.9, 0.5, 0),
      #mar = c(3, 3, .5, 1) + 0.1)
      mar = c(3, 0.2, 1.5, 0.8) + 0.5)

#par(mar = c(3,4,1,0))

NormalHist <- function(obs, hold, M, SD, col) {
  plot(0, 0,
       type = 'n',
       xlab = 'Residuals',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = M + c(-3, 3) * SD,
       ylim = c(0, max(hold$density)))
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

obs = residuals
hold <- hist(residuals, plot = FALSE)


NormalHist(residuals, hold, mean(residuals), sd(residuals), COL[1])

qqnorm(residuals,
       cex = 0.7,
       main = '',
       axes = FALSE,
       ylab = "Sample Quantiles",
       col = COL[1,3])
axis(1)
axis(2)
qqline(residuals)


dev.off()
