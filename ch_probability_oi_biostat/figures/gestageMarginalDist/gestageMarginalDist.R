###DH PLOT

#  get marginal distribution of gestational age

setwd("~/Dropbox/working_files/teaching/open_intro/oi_biostat/prob_chapter_draft")
load("~/Dropbox/working_files/teaching/open_intro/oi_biostat/prob_chapter_draft/birthwt_gestage/brthwt.gestage.overall.counts.Rdata")
View(brthwt.gestage.overall.counts)

gestage.marginal.counts = colSums(brthwt.gestage.overall.counts[,-1], na.rm = T)
View(gestage.marginal.counts)

gestage.marginal.dist.table = as.table(gestage.marginal.counts/sum(gestage.marginal.counts))

View(gestage.marginal.dist.table)

barplot(gestage.marginal.dist.table)

library(xtable)
xtable(gestage.marginal.dist.table)


###JV PLOT

library(openintro)
data(COL)

#change labels
colnames(brthwt.gestage.overall.counts)[2] <- "under 20"
colnames(brthwt.gestage.overall.counts)[3] <- "20 - 27"
colnames(brthwt.gestage.overall.counts)[4] <- "28 - 31"
colnames(brthwt.gestage.overall.counts)[5] <- "32 - 33"
colnames(brthwt.gestage.overall.counts)[6] <- "34 - 36"
colnames(brthwt.gestage.overall.counts)[7] <- "37 - 38"
colnames(brthwt.gestage.overall.counts)[8] <- "39"
colnames(brthwt.gestage.overall.counts)[9] <- "40"
colnames(brthwt.gestage.overall.counts)[10] <- "41"
colnames(brthwt.gestage.overall.counts)[11] <- "42 and over"
colnames(brthwt.gestage.overall.counts)[12] <- "not stated"

gestage.marginal.counts = colSums(brthwt.gestage.overall.counts[,-1], na.rm = T)
gestage.marginal.dist.table = as.table(gestage.marginal.counts/sum(gestage.marginal.counts))

barplot(gestage.marginal.dist.table)

myPDF("gestageMarginalDist.pdf",
      15, 5,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))

barplot(gestage.marginal.dist.table,
        axes = TRUE,
        xlab = 'Gestational Age (Weeks)',
        ylab = 'Probability',
        main = '',
        ylim = c(0,0.4),
        col = COL[1])

dev.off()
