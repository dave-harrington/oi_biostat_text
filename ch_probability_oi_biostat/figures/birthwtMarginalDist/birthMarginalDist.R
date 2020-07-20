setwd("~/Dropbox/working_files/teaching/open_intro/oi_biostat/prob_chapter_draft/birthwt_gestage")

brthwt.gestage.overall.counts = as.matrix(read.table("bthwt_gestage_overall_counts.csv", header=TRUE, sep=",",
row.names = c("Total", "499 or less", "500 - 999","1000 - 1499","1500 - 1999",
              "2000 - 2499","2500 - 2999","3000 - 3499", "3500 - 3999","4000 - 4499","4500 - 4999",
              "5000 - 8165", "Not stated"),
col.names = c("Total","Under.wk.20","wk.20.27","wk.28.31","wk.32.33","wk.34.36","wk.37.38","wk39",
              "wk.40","wk.41","wk.42.and.over","Not.stated")))

save(brthwt.gestage.overall.counts, file="brthwt.gestage.overall.counts.Rdata")

# now get marginal distribution of birthwt

brthwt.marginal.counts = brthwt.gestage.overall.counts[-1,1]

View(brthwt.marginal.counts)
sum(brthwt.marginal.counts)
brthwt.marginal.dist = brthwt.marginal.counts / sum(brthwt.marginal.counts)
View(brthwt.marginal.dist)

brthwt.marginal.dist.table = as.table(brthwt.marginal.dist)
barplot(brthwt.marginal.dist.table)

# plot above is unadorned, but JV will fix that!

library(openintro)
data(COL)

myPDF("birthwtMarginalDist.pdf",
      15, 5,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))

barplot(brthwt.marginal.dist.table,
        axes = TRUE,
        xlab = 'Birth Weight (Grams)',
        ylab = 'Probability',
        main = '',
        ylim = c(0,0.4),
        col = COL[1])

dev.off()
