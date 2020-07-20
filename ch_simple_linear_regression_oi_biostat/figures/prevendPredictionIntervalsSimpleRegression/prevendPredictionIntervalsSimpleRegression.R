library(oibiostat)
library(openintro)
data(COL)
data('prevend')
data("prevend.samp")


lm = lm(RFFT ~ Age, data = prevend.samp)
summary(lm)

myPDF("prevendPredictionIntervalsSimpleRegression.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))
plot(prevend.samp$Age,
     prevend.samp$RFFT,
     pch = 19,
     cex = 0.8,
     col = COL[1, 4],
     xlab = "",
     ylab = "RFFT Score")
points(prevend.samp$Age,
       prevend.samp$RFFT,
       cex = 0.8,
       col = COL[1, 4])
mtext("Age (yrs)", 1, 1.9)
abline(lm, col = COL[1], lwd = 2)

new.x = seq(min(prevend.samp$Age), max(prevend.samp$Age), length.out = 100)
new.yhat = predict(lm, newdata = data.frame(Age = new.x),
                   interval = "confidence")

lines(new.x, new.yhat[ ,2], col = COL[4], lty = 1, lwd = 1.5)
lines(new.x, new.yhat[ ,3], col = COL[4], lty = 1, lwd = 1.5)

#plot prediction bands
new.yhat.pred = predict(lm, newdata = data.frame("Age" = new.x),
                        interval = "prediction")

lines(new.x, new.yhat.pred[,2], col= COL[4], lty = "longdash", lwd = 1.5)
lines(new.x, new.yhat.pred[,3], col= COL[4], lty = "longdash", lwd = 1.5)

dev.off()
