load("low_bwt.Rdata")

library(openintro)
data(COL)

#residual vs predictor

pdf("low_bwt_pred.pdf", 5.5, 4.3)

model <- lm(birthwt ~ toxemia + gestage, data = low.bwt)

par(mar = c(3.8, 3.8, 1, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

#check linearity with gestage
plot(resid(model) ~ low.bwt$gestage,
     main = "Residual vs Gestage",
     xlab = "Gestage (wks)", ylab = "Residual",
     pch = 21, col = COL[1], bg = COL[1, 4], cex = 0.8)
abline(h = 0, col = "red", lty = 2)

dev.off()





#residual vs predicted

pdf("low_bwt_predicted.pdf", 5.5, 4.3)

model <- lm(birthwt ~ toxemia + gestage, data = low.bwt)

par(mar = c(3.8, 3.8, 1, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)


#residual plot for constant variability
plot(resid(model) ~ predict(model),
     main = "Residual vs Fitted",
     xlab = "Predicted Birthweight (g)", ylab = "Residual",
     pch = 21, col = COL[1], bg = COL[1, 4], cex = 0.8)
abline(h = 0, col = "red", lty = 2)

dev.off()



#qq plot

pdf("low_bwt_qq.pdf", 5.5, 4.3)

model <- lm(birthwt ~ toxemia + gestage, data = low.bwt)

par(mar = c(3.8, 3.8, 1, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

qqnorm(resid(model), pch = 21, col = COL[1], bg = COL[1, 4])
qqline(resid(model))

dev.off()

