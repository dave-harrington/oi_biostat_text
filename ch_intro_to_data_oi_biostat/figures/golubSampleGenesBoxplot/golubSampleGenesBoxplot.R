library(hddplot)
library(openintro)
data(COL)

data(golub)
data(golubInfo)


#  running test files from the hddplot package

golub.trans = t(Golub)
golub.exprs.pheno = cbind(golubInfo, golub.trans)
golub.exprs.pheno.subtable = golub.exprs.pheno[1:5,]


boxplot(golub.exprs.pheno[,7:9])

myPDF("golubSampleGenesBoxplot.pdf", 7, 4.5,
      mar = c(2, 4.5, 1, 0.5),
      mgp = c(3.2, 0.75, 0))

boxPlot(golub.exprs.pheno$`AFFX-BioB-5_at`,
        xlim = c(0, 4), 
        ylab = 'Intensity (Normalized)',
        ylim = c(-2000, 0),
        lcol = "#00000000",
        col = "#00000000")
boxPlot(golub.exprs.pheno$`AFFX-BioB-5_at`,
        lcol = COL[1],
        col = COL[1,3],
        add = 1)
boxPlot(golub.exprs.pheno$`AFFX-BioB-M_at`,
        lcol = COL[4],
        col = COL[4,3],
        add = 2)
boxPlot(golub.exprs.pheno$`AFFX-BioB-3_at`,
        lcol = COL[2],
        col = COL[2,3],
        add = 3)
axis(1, at = 1:3, labels = c("A", "B", "C"))

dev.off()
