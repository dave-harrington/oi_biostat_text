library(openintro)

# load data
load("nursing_home.Rdata")

# histogram
myPDF("nursing_home_hist.pdf", width = 6, height = 3,
    mar = c(3.5, 3.5, 0.5, 1),
    mgp = c(2.4, 0.7, 0))

histPlot(nursing.home$resident, xlab = "adjusted number of residents", ylab = "", col = COL[1], axes = TRUE)

dev.off()

# boxplot

myPDF("nursing_home_boxplot.pdf", width = 3, height = 3,
      mar = c(0.5, 5.5, 0.5, 1),
      mgp = c(2.4, 0.7, 0))

boxPlot(nursing.home$resident, xlab = "adjusted number of residents",
        lcol = COL[1],
        col = COL[1,3],
        ylab = "",
        axes = TRUE)

dev.off()
