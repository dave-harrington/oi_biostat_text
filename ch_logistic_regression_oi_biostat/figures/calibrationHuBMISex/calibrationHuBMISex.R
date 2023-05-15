

library(openintro)
library(dplyr)

d <- hyperuricemia.samp

m <- glm(hu ~ bmi, data = d, family = binomial)
summary(m)
p <- predict(m, type = "response")
lo.fit = predict(loess(d$hu ~ p, family = "gaussian", span = 2/3))

dframe = data.frame(p, lo.fit)
dframe = dframe[order(p), ]

m.2 <- glm(hu ~ bmi + sex, data = d, family = binomial)
summary(m)
p.2 <- predict(m.2, type = "response")

lo.fit.2 = predict(loess(d$hu ~ p.2, family = "gaussian", span = 2/3))

dframe.2 = data.frame(p.2, lo.fit.2)
dframe.2 = dframe.2[order(p.2), ]

# ns1 <- 4
myPDF("calibrationHuBMISex.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))
noise <- rnorm(nrow(d), sd = 0.05)


plot(p, d$hu + noise,
     xlim = 0:1,
     ylim = c(-0.15, 1.15),
     axes = FALSE,
     xlab = "Predicted Probability",
     ylab = "Hyperuricemia",
     col = fadeColor(COL[1], "33"),
     pch = 20)
axis(1)
axis(2,
     at = c(0,1),
     labels = c("No", "Yes"))
lines(0:1, 0:1,
      lty = 2,
      col = COL[6],
      lwd = 1.5)

lines(dframe$p, dframe$lo.fit, lty = 1,
      lwd = 1.5, col = "blue")

lines(dframe.2$p.2, dframe.2$lo.fit.2, lty = 1,
      lwd = 1.5, col = "darkgreen")

dev.off()

