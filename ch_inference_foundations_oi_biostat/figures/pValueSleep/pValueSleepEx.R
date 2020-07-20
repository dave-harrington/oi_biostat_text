library(openintro)
data(COL)

myPDF('pValueSleepEx.pdf', 6, 2.4,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))

normTail(U = -0.864,
         col = COL[1],
         axes  =  FALSE,
         lwd  =  2)
at <- c(-5, -0.864, 5)
labels <- expression(0,
                     't = -0.864', 0)
axis(1, at, labels, cex.axis = 1.5)
yMax <- 0.4

dev.off()
