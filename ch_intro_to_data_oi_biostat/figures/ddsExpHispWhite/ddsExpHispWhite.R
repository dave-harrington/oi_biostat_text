library(openintro)
#data(dds.discr)
data(COL)

myPDF("ddsExpHispWhite.pdf", 0.7 * 8, 0.7 * 5,
      mar = c(4.2, 4, 1, 0.5),
      mgp = c(3, 0.5, 0)
)

dds.hispanics = dds.discr[dds.discr$ethnicity == "Hispanic", ]
dds.white.non.hisp = dds.discr[dds.discr$ethnicity == "White not Hispanic", ]

dds.hisp.white = rbind(dds.hispanics, dds.white.non.hisp)
dds.hisp.white$ethnicity <- droplevels(dds.hisp.white$ethnicity)

boxPlot(dds.hisp.white$expenditures, dds.hisp.white$ethnicity,
        xlab = 'Ethnicity',
        ylab = 'Expenditures (USD)',
        ylim = c(0, 80000),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
