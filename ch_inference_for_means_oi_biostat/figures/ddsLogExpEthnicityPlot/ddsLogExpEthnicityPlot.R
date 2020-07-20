library(openintro)
#data(dds.discr)
data(COL)

dds.hispanics = dds.discr[dds.discr$ethnicity == "Hispanic", ]
dds.white.non.hisp = dds.discr[dds.discr$ethnicity == "White not Hispanic", ]

dds.hisp.white = rbind(dds.hispanics, dds.white.non.hisp)
dds.hisp.white$ethnicity <- droplevels(dds.hisp.white$ethnicity)


myPDF("ddsLogExpEthnicityPlot.pdf", 8, 5,
      mar = c(4.2, 4, 1, 0.5),
      mgp = c(2.4, 0.25, 0),
)

dds.hisp.white$log.expenditures = log(dds.hisp.white$expenditures)


boxPlot(dds.hisp.white$log.expenditures, dds.hisp.white$ethnicity,
        xlab = 'Ethnicity',
        ylab = 'Log Expenditures (log(USD))',
        ylim = c(4, 12),
        pch = 19,
        pchCex = 1,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
