library(openintro)
library(oibiostat)
data(COL)
data("famuss")

myPDF("famussNormal.pdf", 5.5, 2.8,
      mfrow = c(1, 3),
      mgp = c(2, 0.5, 0),
      mar = c(3, 2, 3, 1))
qqnorm(famuss$ndrm.ch[famuss$actn3.r577x == "CC"], main = "Q-Q for CC genotype",
       pch = 21, col = COL[1, 1])
qqline(famuss$ndrm.ch[famuss$actn3.r577x == "CC"])
qqnorm(famuss$ndrm.ch[famuss$actn3.r577x == "CT"], main = "Q-Q for CT genotype",
       pch = 21, col = COL[1, 1])
qqline(famuss$ndrm.ch[famuss$actn3.r577x == "CT"])
qqnorm(famuss$ndrm.ch[famuss$actn3.r577x == "TT"], main = "Q-Q for TT genotype",
       pch = 21, col = COL[1, 1])
qqline(famuss$ndrm.ch[famuss$actn3.r577x == "TT"])
dev.off()
