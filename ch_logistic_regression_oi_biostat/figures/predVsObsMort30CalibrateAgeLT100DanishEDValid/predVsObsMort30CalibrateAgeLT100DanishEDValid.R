# code below from OI4, produces bucket plot figure 9.26

library(openintro)
library(dplyr)


d = demographic.primary

d.primary = d[d$age < 100,]

d = demographic.validation
d.valid = d[d$age < 100, ]

m = glm(mort30 ~ triage + age + sex + age*sex, data = d.primary,
        family = "binomial")

p  <- predict(m, newdata = d.valid,  type = "response")

lo.fit = predict(loess(d.valid$mort30 ~ p, family = "gaussian", span = 2/3))

dframe = data.frame(p, lo.fit)
dframe = dframe[order(p), ]



ns1 <- 4
myPDF("predVsObsMort30CalibrateAgeLT100DanishEDValid.pdf", 7.7, 4.4,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))
noise <- rnorm(nrow(d.valid), sd = 0.08)
plot(p, d.valid$mort30 + noise / 5,
     type = "n",
     xlim = 0:1,
     ylim = c(-0.07, 1.07),
     axes = FALSE,
     xlab = "Predicted Probability",
     ylab = "Observed Proportion")
par(las = 0)
# mtext("Truth", 2, 5.5)
par(las = 1)
rect(0, 0, 1, 1,
     border = COL[6],
     col = "#00000000",
     lwd = 1.5)
lines(0:1, 0:1,
      lty = 2,
      col = COL[6],
      lwd = 1.5)
points(p, d.valid$mort30 + noise / 5,
       col = fadeColor(COL[1], "18"),
       pch = 20)
axis(1)
at <- seq(0, 1, length.out = 6)
labels <- c("0 (Alive)",
            "0.2  ",
            "0.4  ",
            "0.6  ",
            "0.8  ",
            "1 (Deceased)")
axis(2, at, labels)
eps <- 1e-4
bucket_breaks <- quantile(p, seq(0, 1, 0.01))
bucket_breaks[1] <- bucket_breaks[1] - eps
n_buckets <- length(bucket_breaks) - 1
bucket_breaks[n_buckets] <- bucket_breaks[n_buckets] + 1e3 * eps
bucket_breaks. <- bucket_breaks
k <- 1
for (i in 1:n_buckets) {
  if (abs(bucket_breaks.[i] - bucket_breaks[k]) >= 0.01) {
    k <- k + 1
    bucket_breaks[k] <- bucket_breaks.[i]
  }
}
bucket_breaks <- bucket_breaks[1:k]

n_buckets <- length(bucket_breaks)
xp <- rep(NA, n_buckets)
yp <- rep(NA, n_buckets)
yp_lower <- rep(NA, n_buckets)
yp_upper <- rep(NA, n_buckets)
zs <- qnorm(0.975)
for (i in 1:n_buckets) {
  these <- bucket_breaks[i] < p & p <= bucket_breaks[i + 1]
  xp[i] <- mean(p[these])
  y <- d.valid$mort30[these]
  yp[i] <- mean(y)
  yp_lower[i] <- yp[i] - zs * sqrt(yp[i] * (1 - yp[i]) / length(y))
  yp_upper[i] <- yp[i] + zs * sqrt(yp[i] * (1 - yp[i]) / length(y))
}
points(xp, yp, pch = 19, cex = 0.7)
segments(xp, yp_lower, xp, yp_upper)

lines(dframe$p, dframe$lo.fit, lty = 1,
      lwd = 1.5, col = "blue")

dev.off()
