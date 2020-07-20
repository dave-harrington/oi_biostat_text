library(openintro)
library(oibiostat)
data("nhanes.samp.adult.500")
data(COL)

diabetic = subset(nhanes.samp.adult.500, Diabetes == "Yes")
non.diabetic = subset(nhanes.samp.adult.500, Diabetes == "No")

myPDF("nhanesInteractionScatterPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))

#blue and red dots
plot(non.diabetic$TotChol ~ non.diabetic$Age,
     pch = 21,
     cex = 1.2,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "Total Cholesterol (mmol/L)")
points(diabetic$TotChol ~ diabetic$Age,
       pch = 21,
       cex = 1.2,
       bg = COL[4, 3],
       col = COL[4])
mtext("Age (yrs)", 1, 1.9)
abline(lm(diabetic$TotChol ~ diabetic$Age), col = "red", lwd = 2)
abline(lm(non.diabetic$TotChol ~ non.diabetic$Age), col = "blue", lwd = 2)

dev.off()


#all dots blue
plot(nhanes.samp.adult.500$TotChol ~ nhanes.samp.adult.500$Age,
     pch = 21,
     cex = 1.3,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "Total Cholesterol")
abline(lm(diabetic$TotChol ~ diabetic$Age), col = "red")
abline(lm(non.diabetic$TotChol ~ non.diabetic$Age), col = "blue")

mtext("Age (yrs)", 1, 1.9)

dev.off()





#blue and red dots, no interaction

myPDF("nhanesNoInteractionScatterPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))

plot(non.diabetic$TotChol ~ non.diabetic$Age,
     pch = 21,
     cex = 1.2,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "Total Cholesterol (mmol/L)")4.70
points(diabetic$TotChol ~ diabetic$Age,
       pch = 21,
       cex = 1.2,
       bg = COL[4, 3],
       col = COL[4])
mtext("Age (yrs)", 1, 1.9)
abline(a = 4.48, b = 0.0075, col = "red", lwd = 2)
abline(a = 4.80, b = 0.0075, col = "blue", lwd = 2)

dev.off()




myPDF("nhanesInteractionModelScatterPlot.pdf",
      6,
      3.3,
      mar = c(3, 4.5, 0.5, 1.2),
      mgp = c(2.8, 0.5, 0))

plot(non.diabetic$TotChol ~ non.diabetic$Age,
     pch = 21,
     cex = 1.2,
     bg = COL[1, 3],
     col = COL[1],
     xlab = "",
     ylab = "Total Cholesterol (mmol/L)")
points(diabetic$TotChol ~ diabetic$Age,
       pch = 21,
       cex = 1.2,
       bg = COL[4, 3],
       col = COL[4])
mtext("Age (yrs)", 1, 1.9)
abline(a = 6.42, b = -0.024, col = "red", lwd = 2)
abline(a = 4.70, b = 0.0096, col = "blue", lwd = 2)

dev.off()
