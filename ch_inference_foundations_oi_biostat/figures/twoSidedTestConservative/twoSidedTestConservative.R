library(openintro)
data(COL)

myPDF('twoSidedTestConservative.pdf', 6, 2.4,
      mar = c(2, 0, 0.5, 0),
      mgp = c(3, 0.65, 0))
normTail(L = -1.96,
         U = 1.96,
         col = COL[1],
         axes = FALSE)
##labels <- expression(t*' = -1.96')
#labels2 <- expression('1.96')
##axis(1, at = -1.96, labels = labels, cex.axis = 0.87)
#axis(1, at = 1.96, labels = labels2, cex.axis = 0.87)

##shading 1.65 >>

X <- rev(seq(-4, 4, 0.025))
Y <- dt(X, 1000) # makes better visual

yMax <- 0.41

these <- (1.65 < X )
x <- c(1.65, X[these], 1.65)
y <- c(0, dt(X[these], 1000), 0)
polygon(x, y, col=COL[1,3], border='#00000000')

#labels <- expression(t*' = 1.65')
#axis(1, at = 1.65, labels = labels, cex.axis = 0.87)


#adding bottom axis, labeling mu

par(mgp = c(3, 0.77, 0))
at <- c(-15, 0, 5)
labels <- expression(0, mu*' = 0', 0)
axis(1, at, labels, cex.axis = 0.87)

##label alpha/2

yMax <- dnorm(0)
text(-1.90, yMax * 0.3, expression(alpha/2 *'= 0.025'),
     pos = 2,
     cex = .87,
     col = COL[1])

##vline marking 1.80
yMax <- 0.41

lines(rep(1.80, 2), c(0, yMax*.68), lty=1, col=COL[6])
text(1.75, yMax*.7, expression(t*' = 1.80'), pos=3, cex = .87, col = COL[6])

dev.off()
