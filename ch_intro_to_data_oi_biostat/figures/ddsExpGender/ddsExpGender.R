library(openintro)
#data(dds.discr)
data(COL)

myPDF("ddsExpGender.pdf", 5, 3,
      mar = c(4, 4.8, 1, 0.5),
      mgp = c(3.5, 0.5, 0),
)

boxPlot(dds.discr$expenditures, dds.discr$gender,
        xlab = '',
        ylab = 'Expenditures (USD)',
        ylim = c(0, 80000),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])
mtext('Gender', 1, 2.5)
dev.off()
