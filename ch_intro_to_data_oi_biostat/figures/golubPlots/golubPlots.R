library(openintro)
data(COL)

library(oibiostat)
data(golub.train)

## analysis

gene.matrix = as.matrix(golub.train[,-(1:6)])

leuk.type = (golub.train$cancer == "aml")
table(leuk.type)

aml.mean.expression = apply(gene.matrix[leuk.type == TRUE,], 2, mean)
all.mean.expression = apply(gene.matrix[leuk.type == FALSE,], 2, mean)

diff.mean.expression = (aml.mean.expression - all.mean.expression)




myPDF("golubHist.pdf",
      6.05, 3.5,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.6, 0.7, 0))
histPlot(diff.mean.expression,
         breaks = 30,
         xlab = 'Difference in Mean Expression (AML-ALL)',
         ylab = "Frequency",
         ylim = c(0, 3750),
         col = COL[1],
         border = COL[5])
dev.off()


myPDF("golubBoxPlot.pdf", 5, 6.7,
      mar = c(1, 5, 1, 0.5),
      mgp = c(3.5, 0.5, 0))

boxPlot(diff.mean.expression,
        ylab = 'Difference in Mean Expression (AML-ALL)',
        # ylim = c(-30000, 25000),
        pch = 19,
        pchCex = 0.8,
        lcol = COL[1],
        col = COL[1,3])

dev.off()
