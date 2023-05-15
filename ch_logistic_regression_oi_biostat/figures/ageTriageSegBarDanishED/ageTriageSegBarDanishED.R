library(openintro)
data(COL)

d = demographic.primary

age.cat = cut(d$age, quantile(d$age))

# sort out cols and rows
## triage as columns

table(age.cat, d$triage)
age.cat.triage = matrix(table(age.cat,d$triage), ncol=4, byrow=T)
rownames(age.cat.triage) = c("(16, 45]", "(45,63]", 
                           "(63, 75]", "(75, 108]")
colnames(age.cat.triage)=c("red", "orange", "yellow", "green")

prop.age.cat.triage <- prop.table(age.cat.triage, 2)

#sta seg bar

myPDF("ageTriageSegBarDanishED.pdf",
      6,
      3.5)
par(mar=c(2.5, 2.5, 0.5, 7), xpd=TRUE)
barplot(prop.age.cat.triage, col=COL[c(7, 4, 1, 2, 3)], ylim=c(0, 1), width=2)
legend("topright", inset=c(-.25, 0),fill=COL[c(7, 4, 1, 2, 3)], 
       legend=rownames(age.cat.triage))
dev.off()
