library(openintro)
data(COL)

myPDF('pValueOneSided.pdf', 6, 2.4,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(U = 2,
         col = COL[1],
         #xlim = c(-3, 3),
         axes  =  FALSE,
         lwd  =  2)
at <- c(-5, 0, 2, 5)
labels <- expression(0, ''*mu*' = 0  ',
                     't-statistic', 0)
axis(1, at, labels, cex.axis = 0.87)
yMax <- 0.4

dev.off()

###arrow label

arrows(2.5, yMax / 2,
       2.5, yMax / 10,
       length = 0.1,
       col = COL[1],
       lwd = 1.5)
text(2.5, yMax / 2, 'p-value',
     pos = 3,
     cex = 1.2,
     col = COL[1])