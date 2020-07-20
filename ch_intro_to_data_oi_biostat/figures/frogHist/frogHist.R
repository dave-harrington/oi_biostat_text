library(openintro)
#data(frog.altitude)
data(COL)

H <- hist(frog.altitude$clutch.volume,
          breaks = 14,
          plot = FALSE)
counts <- rbind(H$counts)
from   <- head(H$breaks, -1)
to     <- tail(H$breaks, -1)
colnames(counts) <- paste(from, 'to', to)
require(xtable)
xtable(counts)

myPDF("frogHist.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(frog.altitude$clutch.volume,
         breaks = 14,
         xlab = 'Clutch Volume',
         ylab = "Frequency",
         ylim = c(0, 100),
         col = COL[1],
         border = COL[5])
dev.off()