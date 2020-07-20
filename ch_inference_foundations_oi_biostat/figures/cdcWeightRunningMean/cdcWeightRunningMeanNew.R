library(openintro)
data(COL)

#set parameters
replicates = 500

#set seed
set.seed(5011)

sample.means = vector("numeric", replicates)

#calculate sample means
for(k in 1:replicates){
  sample.rows = sample(nrow(cdc), k)
  sample.means[k] = mean(cdc$weight[sample.rows], na.rm = TRUE)
}

m.pop <- mean(cdc$weight)

myPDF('cdcWeightRunningMeanNew.pdf', 5.5, 2.7,
      mar=c(3.3, 4.9, 1, 2))

plot(sample.means,
     type = "l",
     axes = FALSE,
     xlab = "",
     ylab = "Mean weight",
     col = COL[1],
     lwd = 1.5,
     ylim = range(sample.means))
axis(1, at = seq(0, 500, 100))
axis(2, at = seq(0,200,10))
abline(h = m.pop, lty = 2, lwd = 1.5, col = COL[4,1])
mtext("Sample size", 1, 2)
dev.off()

