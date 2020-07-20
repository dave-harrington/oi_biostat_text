# histograms to replace figure 4.4.  This code chunk should be moved to the figures 
# subdir of chapter 4 in the repo

# use age, height, weight, desired weight

library(openintro)
data(COL)

# data(cdc.samp)
d <- cdc.samp

myPDF("cdcSampHistograms.pdf", 5.7, 3.9,
      mfrow = c(2, 2),
      mar = c(3.5, 3.5, 0.5, 1.5),
      mgp = c(2.2, 0.55, 0))
histPlot(d$height,
         main = "",
         xlab = "Height (inches)",
         ylab = "Frequency",
         col = COL[1])
par(mar = c(3.5, 4.5, 0.5, 0.5))
histPlot(d$weight,
         main = "",
         xlab = "Weight (lbs)",
         ylab = "Frequency",
         col = COL[1],
         xlim = c(50,300),
         breaks = 8)
par(mar = c(3.5, 3.5, 0.5, 1.5))
histPlot(d$age,
         main = "",
         xlab = "Age (years)",
         ylab = "Frequency",
         col = COL[1])
par(mar = c(3.5, 4.5, 0.5, 0.5))
histPlot(d$wtdesire,
         main = "",
         xlab = "Desired Weight (lbs)",
         ylab = "Frequency",
         col = COL[1],
         xlim = c(50,300),
         breaks = 6)    


dev.off()