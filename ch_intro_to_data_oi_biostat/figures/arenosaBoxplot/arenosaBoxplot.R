library(hddplot)
library(openintro)
data(COL)

data(arenosa)

ka.nv.mean = apply(arenosa[2:4], 1, mean)
ka.v.mean = apply(arenosa[5:7], 1, mean)
tbg.nv.mean = apply(arenosa[8:10], 1, mean)
tbg.v.mean = apply(arenosa[11:13], 1, mean)

myPDF("arenosaBoxplot.pdf", 5.5, 6,
      mar = c(2, 4.5, 1, 0.5),
      mgp = c(3.2, 0.75, 0))

boxPlot(ka.nv.mean,
        xlim = c(0, 5),
        ylab = 'Expression (Number of Transcripts)',
        ylim = c(0, 8000),
        lcol = "#00000000",
        col = "#00000000")
boxPlot(ka.nv.mean,
        lcol = COL[2],
        col = COL[2,3],
        add = 1)
boxPlot(ka.v.mean,
        lcol = COL[1],
        col = COL[1,3],
        add = 2)
boxPlot(tbg.nv.mean,
        lcol = COL[2],
        col = COL[2,3],
        add = 3)
boxPlot(tbg.v.mean,
        lcol = COL[1],
        col = COL[1,3],
        add = 4)
axis(1, at = 1:4, labels = c("KA NV", "KA V", "TBG NV", "TBG V"))

dev.off()
