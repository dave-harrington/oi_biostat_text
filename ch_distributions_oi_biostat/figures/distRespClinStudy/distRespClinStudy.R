n = 20
p = 0.2
plot( seq(0,n), dbinom( seq(0,n), n, p), type='h', lwd=10,
      xlim=c(-1,n+1), xlab='X', ylab='Probability')


library(openintro)
data(COL)

myPDF("distRespClinStudy.pdf",
      7,
      5,
      mar = c(3.5, 5, 0.5, 0.5),
      mgp = c(2.6, .6, 0))
plot(seq(0,n), dbinom( seq(0,n), n, p), type='h', lwd=10,
      xlim=c(-1, n+1), xlab='X', ylab='Probability', col=COL[1])

dev.off()

