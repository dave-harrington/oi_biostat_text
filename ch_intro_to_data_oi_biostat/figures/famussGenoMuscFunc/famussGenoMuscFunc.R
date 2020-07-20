library(openintro)
#data(famuss)
data(COL)

myPDF("famussGenoMuscFunc.pdf", 7.5, 5,
      mar = c(3.6, 3.6, 1, 0.5),
      mgp = c(2.4, 0.7, 0),
      mfrow = 1:2)
boxPlot(famuss$ndrm.ch, famuss$actn3.r577x,
        xlab = 'Genotype',
        ylab = 'Percent Change in Non-Dominant Arm Strength',
        lcol = "#00000000",
        col = "#00000000")
boxPlot(famuss$ndrm.ch[famuss$actn3.r577x == "CC"],
        lcol = COL[1],
        col = COL[1,3],
        add = 1)
boxPlot(famuss$ndrm.ch[famuss$actn3.r577x == "CT"],
        lcol = COL[4],
        col = COL[4,3],
        add = 2)
boxPlot(famuss$ndrm.ch[famuss$actn3.r577x == "TT"],
        lcol = COL[2],
        col = COL[2,3],
        add = 3)

par(mar = c(3.6, 0.5, 1, 1))

histPlot(famuss$ndrm.ch[famuss$actn3.r577x == "CC"],
         breaks = 20,
         col = '#ffffff00',
         border = COL[1],
         probability = TRUE,
         xlab = 'Percent Change in Non-Dominant Arm Strength',
         ylab = '',
         hollow = TRUE,
         axes = FALSE,
         lty = 3,
         lwd = 3,
         xlim = range(famuss$ndrm.ch))
histPlot(famuss$ndrm.ch[famuss$actn3.r577x == "CC"],
         breaks = 20,
         col = '#ffffff00',
         border = COL[1],
         probability = TRUE,
         add = TRUE,
         hollow = TRUE,
         lty = 3,
         lwd = 1)
histPlot(famuss$ndrm.ch[famuss$actn3.r577x == "CT"],
         breaks = 20,
         col = '#ffffff00',
         border = COL[4],
         probability = TRUE,
         add = TRUE,
         hollow = TRUE,
         lty = 2,
         lwd = 1)
histPlot(famuss$ndrm.ch[famuss$actn3.r577x == "TT"],
         breaks = 20,
         col = '#ffffff00',
         border = COL[2],
         probability = TRUE,
         add = TRUE,
         hollow = TRUE,
         lty = 3,
         lwd = 3)

axis(1)
legend('topright',
       col = COL[c(1, 4, 2)],
       lty = c(3, 2, 3),
       lwd = c(3, 1, 3),
       legend = c('CC', 'CT', 'TT'))
legend('topright',
       col = c(COL[1], rgb(0,0,0,0), rgb(0,0,0,0)),
       lty = c(3, 2, 3),
       lwd = c(2 , 1, 3),
       legend = c('CC', 'CT', 'TT'),
       bg = rgb(0,0,0,0),
       box.col = rgb(0,0,0,0),
       text.col = rgb(0,0,0,0))

dev.off()
