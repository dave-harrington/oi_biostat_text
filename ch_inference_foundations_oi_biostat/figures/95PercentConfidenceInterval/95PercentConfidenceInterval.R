# graphs of confidence intervals for weight

library(openintro)
data(COL)

myPDF('95PercentConfidenceInterval.pdf', 6, 3.4,
      mar = c(1.7, 1, 0, 1),
      mgp = c(2.7, 0.7, 0))
m <- mean(cdc$weight)
s <- sd(cdc$weight)
n <- 60
k <- 25
SE <- s/sqrt(n)

set.seed(15)
means <- c()
SE    <- c()
for(i in 1:k){
  temp <- sample(nrow(cdc), n)
  d    <- cdc$weight[temp]
  means[i] <- mean(d, na.rm = TRUE)
  SE[i]    <- sd(d)/sqrt(n)
}
xR <- m + 4 * c(-1, 1) * s / sqrt(n)
yR <- c(0.7, 25.3)
plot(xR, yR,
     type = 'n',
     xlab = '',
     ylab = '',
     axes = FALSE)
abline(v = m, lty = 2, col = COL[5,2])
axis(1, at = m, expression(mu*' = 169.7' ))
for(i in 1:k){
  ci <- means[i] + 2 * c(-1, 1) * SE[i]
  if(abs(means[i] - m) > 1.96 * SE[i]){
    col <- COL[4]
    points(means[i], i, cex = 1.4, col = col)
    lines(ci, rep(i, 2), col = col, lwd = 4)
  } else {
    col <- COL[1]
  }
  points(means[i], i, pch = 20, cex = 1.2, col = col)
  lines(ci, rep(i, 2), col = col)
}
dev.off()
