require(openintro)
#data(famuss)
data(COL)

myPDF('famussBarPlot.pdf',
      7,
      3,
      mar = c(3.6, 4.5, 1, 1.5),
      mgp = c(3.4, 0.7, 0),
      mfrow = 1:2)
t <- table(famuss$actn3.r577x)
barplot(t,
        axes = TRUE,
        xlab = '',
        ylab = 'count',
        main = '',
        ylim = c(0,300),
        col = COL[1])
abline(h = 0)
mtext("genotype", 1, 2)

par(mar = c(3.6, 4.7, 1, 1))
barplot(t / sum(t),
        axes = FALSE,
        xlab = 'genotype',
        ylab = '',
        main = '',
        ylim = c(0, 300) / sum(t),
        col = COL[1])
at <- seq(0, 0.5, 0.25)
axis(2, at)
par(las = 0)
mtext('proportion', side = 2, line = 3)
mtext("genotype", 1, 2)
abline(h = 0)
dev.off()

table(email$number, email$spam)
