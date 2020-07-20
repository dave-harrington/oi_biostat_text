library(openintro)
#data(nhanes.samp.adult)
data(COL)

myPDF("nhanesAdultBmiHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(nhanes.samp.adult$BMI,
         breaks = 14,
         xlab = 'BMI',
         ylab = "Frequency",
         ylim = c(0, 50),
         col = COL[1],
         border = COL[5])
dev.off()