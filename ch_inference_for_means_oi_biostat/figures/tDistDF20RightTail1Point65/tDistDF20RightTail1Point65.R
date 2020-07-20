library(openintro)
data(COL)

myPDF('tDistDF20RightTail1Point65.pdf', 4, 1.8,
      mar = c(1.6, 1, 0.1, 1),
      mgp = c(5, 0.45, 0))
normTail(U = 1.65,
         L = -1.65,
         df = 12,
         xlim = c(-4, 4),
         col = COL[1],
         axes = FALSE)
axis(1)
dev.off()
