
# code for scatter bmi vs hu

library(openintro)
library(dplyr)

# breaks = 20

d = hyperuricemia.samp
breaks = 50


fifth.centile = ntile(d$bmi, breaks)

prob = rep(0, times = breaks)
mean.bmi  = rep (0, times = breaks)

for (j in 1:breaks) {
  quint = subset(d, fifth.centile == j)
  prob[j] = sum(quint$hu)/(nrow(quint))
  mean.bmi[j] = mean(quint$bmi)
}

lm.model = lm(hu ~ bmi, data = d)

ns1 <- 4


myPDF("bmiHuProbSecondTile.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

noise <- rnorm(nrow(d), sd = 0.05)

plot(d$bmi, d$hu + noise,
     xlim = c(15, 40),
     ylim = c(-0.10, 1.10),
     axes = FALSE,
     xlab = "BMI",
     ylab = "Estimated probability",
     col = fadeColor(COL[1], "20"),
     pch = 20)

points(mean.bmi, prob, col = COL[1], bg = COL[1, 3],
       pch = 21)

#draw the fitted logistic curve

glm.fit = glm(hu ~ bmi, data = d,
              family = "binomial")
x = seq(15, 40, l = 200)
pred.odds = exp(-(glm.fit$coef[1] + glm.fit$coef[2]*x))
pred.prob = 1 / (1 + pred.odds)

lines(x, pred.prob, col = COL[4], lwd = 1.75)
lines(d$bmi, lm.model$fitted.values, col = COL[2, 2], lwd = 1.75)

axis(1)
axis(2)

dev.off()


myPDF("bmiHuProbSecondTileDataOnly.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

noise <- rnorm(nrow(d), sd = 0.05)

plot(d$bmi, d$hu + noise,
     xlim = c(15, 40),
     ylim = c(-0.10, 1.10),
     axes = FALSE,
     xlab = "BMI",
     ylab = "Hyperuricemia",
     col = fadeColor(COL[1], "60"),
     pch = 20)

axis(1)
axis(2,
     at = c(0,1),
     labels = c("No", "Yes"))

dev.off()
