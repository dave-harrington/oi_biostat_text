library(openintro)
library(oibiostat)
data(famuss)
data(COL)

myPDF("famussBoxPlot.pdf", 4.5, 4.5,
      mar = c(3.6, 3.6, 1, 0.5),
      mgp = c(2.4, 0.25, 0)
)

boxPlot(famuss$ndrm.ch, famuss$actn3.r577x,
        xlab = 'Genotype',
        ylab = 'Change in Non-Dominant Arm Strength (%)',
        ylim = c(0, 275),
        width = 0.60,
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()

###for summary table
summary(famuss$actn3.r577x)
mean(famuss$ndrm.ch[famuss$actn3.r577x=="CC"])
mean(famuss$ndrm.ch[famuss$actn3.r577x=="CT"])
mean(famuss$ndrm.ch[famuss$actn3.r577x=="TT"])
sd(famuss$ndrm.ch[famuss$actn3.r577x=="CC"])
sd(famuss$ndrm.ch[famuss$actn3.r577x=="CT"])
sd(famuss$ndrm.ch[famuss$actn3.r577x=="TT"])
