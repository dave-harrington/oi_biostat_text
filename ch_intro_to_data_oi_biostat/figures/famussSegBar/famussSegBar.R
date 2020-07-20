library(openintro)
#data(famuss)
data(COL)

## genotypes as columns

table(famuss$actn3.r577x, famuss$race)
genotype.race = matrix(table(famuss$actn3.r577x, famuss$race), ncol=3, byrow=T)
colnames(genotype.race)=c("CC", "CT", "TT")
rownames(genotype.race)=c("African Am", "Asian", "Caucasian", "Hispanic", "Other")

prop.genotype.race <- prop.table(genotype.race, 2)

#seg bar
myPDF("famussSegBarA.pdf",
      6,
      3.5,
      mar = c(2, 5, 0.5, 0.5),
      mgp = c(2.2, 0.6, 0))
barplot(genotype.race, col=COL[c(7, 4, 1, 2, 3)], ylim=c(0,300), width=2)
legend("topright", inset=c(.05, 0), fill=COL[c(7, 4, 1, 2, 3)], legend=rownames(genotype.race))
dev.off()

#sta seg bar
myPDF("famussSegBarStaA.pdf",
      6,
      3.5)
par(mar=c(2.5, 2.5, 0.5, 7), xpd=TRUE)
barplot(prop.genotype.race, col=COL[c(7, 4, 1, 2, 3)], ylim=c(0, 1), width=2)
legend("topright", inset=c(-.32, 0),fill=COL[c(7, 4, 1, 2, 3)], legend=rownames(genotype.race))
dev.off()


## races as columns

table(famuss$race, famuss$actn3.r577x)
race.genotype = matrix(table(famuss$race, famuss$actn3.r577x), ncol=5, byrow=T)
colnames(race.genotype)=c("African Am", "Asian", "Caucasian", "Hispanic", "Other")
rownames(race.genotype)=c("CC", "CT", "TT")

prop.race.genotype <- prop.table(race.genotype, 2)

#seg bar
myPDF("famussSegBarB.pdf",
      6,
      3.5,
      mar = c(2, 5, 0.5, 0.5),
      mgp = c(2.2, 0.6, 0))
barplot(race.genotype, col=COL[c(1, 2, 3)], ylim=c(0,500), width=2)
legend("topright", inset=c(.1, 0), fill=COL[c(1, 2, 3)], legend=rownames(race.genotype))
dev.off()

#sta seg bar
myPDF("famussSegBarStaB.pdf",
      6,
      3.5)
par(mar=c(2.5, 2.5, 0.5, 5), xpd=TRUE)
barplot(prop.race.genotype, col=COL[c(1,2,3)], ylim=c(0, 1), width=2)
legend("topright", inset=c(-.15, 0), fill=COL[c(1,2,3)], legend=rownames(race.genotype))
dev.off()
