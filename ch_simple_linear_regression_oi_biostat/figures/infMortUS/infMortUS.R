require(openintro)
data(COL)

dc = 9

myPDF('infMortUS.pdf', 5.5, 3.5,
      mar = c(3, 3.2, 0.5, 1),
      mgp = c(1.9, 0.45, 0))

plot(infant.mortality$inf.mort ~ infant.mortality$doctors,
     pch = 20,
     cex = 1.7,
     col = COL[1, 3],
     xlab = "Doctors (per 100,000 members of pop.)",
     ylab = "Infant Mortality")
points(infant.mortality$inf.mort[dc] ~ infant.mortality$doctors[dc],
       pch = 20,
       col = COL[4, 2],
       cex = 1.5,
       lwd = 2.5)

abline(6.36220, 0.00205, col = COL[4])
dev.off()


myPDF('infMortUSnoDC.pdf', 5.5, 3.5,
      mar = c(3, 3.2, 0.5, 1),
      mgp = c(1.9, 0.45, 0))

plot(infant.mortality$inf.mort[-dc] ~ infant.mortality$doctors[-dc],
     pch = 20,
     cex = 1.7,
     col = COL[1, 3],
     xlab = "Doctors (per 100,000 members of pop.)",
     ylab = "Infant Mortality")

abline(8.599061, -0.006797, col = COL[2])
dev.off()
