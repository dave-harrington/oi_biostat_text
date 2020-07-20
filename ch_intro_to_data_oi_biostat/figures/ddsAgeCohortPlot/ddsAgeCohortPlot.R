library(openintro)
#data(dds.discr)
data(COL)

myPDF("ddsAgeCohortPlot.pdf",
      6.05, 3.1,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))
plot(dds.discr$age.cohort,
     xlab = 'Age (years)',
     ylab = "Frequency",
     col = COL[1],
     border = COL[5])
dev.off()