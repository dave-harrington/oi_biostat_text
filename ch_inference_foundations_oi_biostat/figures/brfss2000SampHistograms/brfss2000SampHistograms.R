library(openintro)
data(COL)

d <- brfss.2000.adults.samp

myPDF("brfss2000SampHistograms.pdf", 5.7, 3.9,
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
         xlim = c(50,300))
par(mar = c(3.5, 3.5, 0.5, 1.5))
histPlot(d$age,
         main = "",
         xlab = "Age (years)",
         ylab = "Frequency",
         col = COL[1])
par(mar = c(3.5, 4.5, 0.5, 0.5))
histPlot(d$desired.weight,
         main = "",
         xlab = "Desired Weight (lbs)",
         ylab = "Frequency",
         col = COL[1],
         xlim = c(50,300))    


dev.off()
