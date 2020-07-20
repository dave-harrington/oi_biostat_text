library(openintro)
data(COL)

load("adolescent_fertility.Rdata")

myPDF("adol_fertility_boxplot.pdf", 5, 4,
      mar = c(2, 4.5, 1, 0.5),
      mgp = c(3.2, 0.75, 0))

boxPlot(adolescent.fertility$fert_1997,
        xlim = c(0, 6),
        ylab = 'Fertility Rate (live births per 1000 women)',
        ylim = c(0, 250),
        lcol = "#00000000",
        col = "#00000000")
boxPlot(adolescent.fertility$fert_1997,
        lcol = COL[5],
        col = COL[1,3],
        add = 1)
boxPlot(adolescent.fertility$fert_2000,
        lcol = COL[5],
        col = COL[1,3],
        add = 2)
boxPlot(adolescent.fertility$fert_2002,
        lcol = COL[5],
        col = COL[1,3],
        add = 3)
boxPlot(adolescent.fertility$fert_2005,
        lcol = COL[5],
        col = COL[1,3],
        add = 4)
boxPlot(adolescent.fertility$fert_2006,
        lcol = COL[5],
        col = COL[1,3],
        add = 5)
axis(1, at = 1:5, labels = c("1997", "2000", "2002", "2005", "2006"))

dev.off()
