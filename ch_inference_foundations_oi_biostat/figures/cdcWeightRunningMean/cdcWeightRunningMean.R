# plot of running mean of weight
# modified from OI to show what happens in large sample sizes

library(openintro)
data(COL)

set.seed(2401)
sample.size = 500
row.numbers = sample(1:nrow(cdc), sample.size, replace = FALSE)
cdc.r.mean = cdc[row.numbers, ] 

d <- cdc.r.mean$weight
xBars <- cumsum(d) / (1:500)
m.pop <- mean(cdc$weight)
m.sample = mean(cdc.r.mean$weight)

myPDF('cdcWeightRunningMean.pdf', 5.5, 2.7,
      mar=c(3.3, 4.9, 1, 2))

plot(xBars,
     type = "l",
     axes = FALSE,
     xlab = "",
     ylab = "Running mean, weight",
     col = COL[1],
     lwd = 2,
     ylim = range(xBars))
axis(1, at = seq(0, 500, 100))
axis(2, at = seq(0,200,10))
abline(h = m.sample, lty = 2, col = COL[6,3])
abline(h = m.pop, lty = 3, col = COL[6,3])
mtext("Sample size", 1, 2)
dev.off()

m.pop
