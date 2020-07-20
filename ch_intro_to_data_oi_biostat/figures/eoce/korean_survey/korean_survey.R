library(openintro)

# load data
load("korean_survey.Rdata")

# histogram
myPDF("korean_survey_hist.pdf", width = 6, height = 3,
      mar = c(3.5, 3.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))

histPlot(korean.survey$dtscore, xlab = "dietary concern score", ylab = "", col = COL[1], axes = TRUE)

dev.off()
