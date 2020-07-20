library(openintro)
data(COL)

myPDF('pValueTuna.pdf', 6, 2.4,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(L = -0.599,
         U = 0.599,
         col = COL[1],
         axes = FALSE)
labels <- expression('t = 0.599')
axis(1, at = 0.599, labels = labels, cex.axis = 0.87)

par(mgp = c(3, 0.77, 0))
at <- c(-15, 0, 5)
labels <- expression(0, ''*mu*' = 0  ', 0)
axis(1, at, labels, cex.axis = 0.87)

par(new=TRUE)
normTail(L = -1.96,
         U = 1.96,
         curveColor = fadeColor(3, fade = "00"),
         border = fadeColor(2, fade = "33"),
         col = fadeColor(2, fade = "33"),
         axes = FALSE)

dev.off()
