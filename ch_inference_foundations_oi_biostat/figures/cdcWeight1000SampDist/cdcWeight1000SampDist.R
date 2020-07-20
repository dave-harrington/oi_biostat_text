# graph of sampling distribution
# border not right

library(openintro)
data(COL)

set.seed(5)
means <- c()
for (i in 1:1000) {
  these <- sample(nrow(cdc), 60)
  means[i] <- mean(cdc$weight[these], na.rm = TRUE)
}

myPDF('cdcWeight1000SampDist.pdf', 6.5, 3.2,
      mar = c(3.5, 3.5, 0.7, 0.7),
      mgp = c(2.3, 0.6, 0))
plot(0, 0,
     type = 'n',
     xlim = c(150,190),
     ylim = c(0, 140),
     xlab = 'Sample mean',
     ylab = 'Frequency',
     axes = FALSE)
m <- mean(cdc$weight, na.rm = TRUE)
s <- sd(cdc$weight, na.rm = TRUE) / sqrt(60)
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
axis(1, at = seq(150, 190, 5))
#at <- seq(150, 190, 1.0)
#axis(1, at, rep("", length(at)), tcl = -0.1)
axis(1, at = seq(150, 190, 5))
axis(2, at = seq(0, 140, 20))
dev.off()


####

set.seed(5)
means <- c()
for (i in 1:1000) {
  these <- sample(nrow(cdc), 150)
  means[i] <- mean(cdc$weight[these], na.rm = TRUE)
}

myPDF('cdcWeight1000SampDistB.pdf', 6.5, 3.2,
      mar = c(3.5, 3.5, 0.7, 0.7),
      mgp = c(2.3, 0.6, 0))
plot(0, 0,
     type = 'n',
     xlim = c(150,190),
     ylim = c(0, 140),
     xlab = 'Sample mean',
     ylab = 'Frequency',
     axes = FALSE)
m <- mean(cdc$weight, na.rm = TRUE)
s <- sd(cdc$weight, na.rm = TRUE) / sqrt(60)
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
axis(1, at = seq(150, 190, 5))
#at <- seq(150, 190, 1.0)
#axis(1, at, rep("", length(at)), tcl = -0.1)
axis(1, at = seq(150, 190, 5))
axis(2, at = seq(0, 140, 20))
dev.off()

