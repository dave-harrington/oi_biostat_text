# graph of sampling distribution
# border not right

library(openintro)
data(COL)

set.seed(5)
means <- c()
for (i in 1:1000) {
  these <- sample(nrow(brfss.2000.adults), 75)
  means[i] <- mean(brfss.2000$weight[these], na.rm = TRUE)
}

myPDF('brfss2000Weight1000SampDist.pdf', 6.5, 3.2,
      mar = c(3.5, 3.5, 0.7, 0.7),
      mgp = c(2.3, 0.6, 0))
plot(0, 0,
     type = 'n',
     xlim = c(155,180),
     ylim = c(0, 100),
     xlab = 'Sample mean',
     ylab = 'Frequency',
     axes = FALSE)
m <- mean(brfss.2000.adults$weight, na.rm = TRUE)
s <- sd(brfss.2000.adults$weight, na.rm = TRUE) / sqrt(75)
rect(m - s / 100, 0,
     m + s / 100, 1500,
     col = '#00000044',
     border = '#00000000')
rect(m - s, 0,
     m + s, 1500,
     col = '#00000011',
     border = '#00000000')
rect(m - 2 * s, 0,
     m + 2 * s, 1500,
     col = '#00000011',
     border = '#00000000')
rect(m - 3 * s, 0,
     m + 3 * s, 1500,
     col = '#00000011',
     border = '#00000000')
histPlot(means, col = COL[1], breaks = 25, add = TRUE)
abline(h = 0)
axis(1, at = seq(155, 185, 5))
at <- seq(155, 185, 1.0)
axis(1, at, rep("", length(at)), tcl = -0.1)
axis(2, at = seq(0, 100, 20))
dev.off()

