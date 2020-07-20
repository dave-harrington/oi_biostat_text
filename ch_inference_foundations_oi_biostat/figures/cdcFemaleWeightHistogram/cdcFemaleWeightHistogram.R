library(openintro)
load("cdc_samp.Rdata")

#data(cdc.samp)
data(COL)


male = cdc.samp$gender == "m"
female = cdc.samp$gender == "f"

H <- hist(cdc.samp$weight[female],
          breaks = 10,
          plot = FALSE)
counts <- rbind(H$counts)
from   <- head(H$breaks, -1)
to     <- tail(H$breaks, -1)
colnames(counts) <- paste(from, 'to', to)
require(xtable)
xtable(counts)

myPDF("cdcFemaleWeightHistogram.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
histPlot(cdc.samp$weight[female],
         breaks = 10,
         xlab = 'Weight of Females',
         ylab = "Frequency",
         ylim = c(0, 20),
         col = COL[1],
         border = COL[5])
dev.off()
