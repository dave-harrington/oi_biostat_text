library(openintro)
data(COL)

d = demographic.primary

age.cat = cut(d$age, quantile(d$age))

# sort out cols and rows
## triage as columns

tbl = table(d$triage, age.cat)
colnames(tbl)= c("(16, 45]", "(45,63]", 
                            "(63, 75]", "(75, 108]")
prop.tbl <- prop.table(tbl, 2)


myPDF("ageTriageSegBarDanishED.pdf",
      6,
      3.5)
par(mar=c(2.5, 2.5, 0.5, 2.5), xpd=TRUE)
barplot(prop.tbl, ylim=c(0, 1), width=2)

dev.off()
