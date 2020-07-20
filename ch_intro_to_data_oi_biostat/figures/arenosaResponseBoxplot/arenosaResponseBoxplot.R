library(hddplot)
library(openintro)
data(COL)

data(arenosa)

arenosa.means = data.frame(arenosa$gene.name, ka.nv.mean, ka.v.mean,
                           tbg.nv.mean, tbg.v.mean)

tbg.resp = log2(arenosa.means$tbg.v.mean/arenosa.means$tbg.nv.mean)
ka.resp = log2(arenosa.means$ka.v.mean/arenosa.means$ka.nv.mean)

summary(is.infinite(tbg.resp))
summary(is.infinite(ka.resp))

ka.zero.ratio = which(is.infinite(ka.resp) == TRUE)

arenosa.means.nonzero = arenosa.means[-ka.zero.ratio,]

tbg.resp.noinf = log2(arenosa.means.nonzero$tbg.v.mean/arenosa.means.nonzero$tbg.nv.mean)
ka.resp.noinf = log2(arenosa.means.nonzero$ka.v.mean/arenosa.means.nonzero$ka.nv.mean)

myPDF("arenosaResponseBoxplot.pdf", 6, 4.5,
      mar = c(2, 4, 1, 1),
      mgp = c(3, 0.75, 0))

boxPlot(tbg.resp.noinf,
        xlim = c(0.5, 2.5),
        ylab = 'Log2 Expression Ratio',
        ylim = c(-10, 10),
        lcol = "#00000000",
        col = "#00000000")
boxPlot(tbg.resp.noinf,
        lcol = COL[4],
        col = COL[4,3],
        cex = 0.75,
        add = 1)
boxPlot(ka.resp.noinf,
        lcol = COL[4],
        col = COL[4,3],
        cex = 0.75,
        add = 2)
axis(1, at = 1:2, labels = c("TBG", "KA"))

dev.off()
