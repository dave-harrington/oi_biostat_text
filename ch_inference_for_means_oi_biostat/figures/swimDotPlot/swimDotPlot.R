library(openintro)
data(COL)

wet.suit.velocity = c(1.57, 1.47, 1.35, 1.35, 1.22, 
                      1.75, 1.64, 1.57, 1.56, 1.53, 
                      1.49, 1.51 )
swim.suit.velocity = c(1.49, 1.37, 1.24, 1.27, 1.12, 
                       1.64, 1.59, 1.52, 1.50, 1.45, 
                       1.44, 1.41)
swimmer.number = c(1:12)
swim.suit.study = as.data.frame(cbind(swimmer.number,
                                      wet.suit.velocity, 
                                      swim.suit.velocity))
diff = wet.suit.velocity - swim.suit.velocity


myPDF("swimDotPlot.pdf",
      7.5,
      1.25,
      mar = c(3.6, 1, 0, 1),
      mgp = c(2.5, 0.7, 0),
      tcl = -0.4)

dotPlot(diff,
        xlab = 'Difference in Swim Velocities (m/s)',
        ylab = '',
        pch = 20,
        col = COL[1, 2],
        cex = 1.5,
        ylim = c(0.95, 1.05),
        axes = FALSE)
axis(1, at = seq(-0.2, 0.2, 0.01))

dev.off()
