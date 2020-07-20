library(openintro)
data(COL)

myPDF('mammogramPValue.pdf', 4.4, 1.87,
      mar = c(1.5, 1, 0.2, 1),
      mgp = c(2.1, 0.45, 0))

ChiSquareTail(U=0.02, df=1, xlim = c(0,5),
              col = COL[1])

dev.off()
