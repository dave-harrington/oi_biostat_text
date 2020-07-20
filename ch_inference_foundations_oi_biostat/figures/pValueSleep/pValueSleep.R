library(openintro)
data(COL)

myPDF('pValueSleep.pdf', 6, 2.4,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(L = -0.864,
         col = COL[1],
         axes  =  FALSE,
         lwd  =  2)
at <- c(-5, 0, -0.864, 5)
labels <- expression(0, ''*mu*' = 0  ',
                     't = -0.864', 0)
axis(1, at, labels, cex.axis = 1)
yMax <- 0.4

par(new=TRUE)
normTail(L = -1.64,
         curveColor = fadeColor(3, fade = "00"),
         border = fadeColor(2, fade = "33"),
         col = fadeColor(2, fade = "33"),
         axes = FALSE)

dev.off()
