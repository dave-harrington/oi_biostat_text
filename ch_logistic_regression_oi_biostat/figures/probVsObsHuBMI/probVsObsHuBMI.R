
library(openintro)
library(dplyr)

a <- hyperuricemia.samp
d <- data.frame(
  hu = a$hu,
  bmi = a$bmi,
  sex = a$sex,
  age = a$age,
  magnesium.intake = a$magnesium.intake
)

m <- glm(hu ~ bmi, data = d, family = binomial)
summary(m)
p <- predict(m, type = "response")

ns1 <- 4
myPDF("probVsObsHuBMI.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))
noise <- rnorm(nrow(d), sd = 0.05)


plot(p, d$hu + noise,
     xlim = 0:1,
     ylim = c(-0.15, 1.15),
     axes = FALSE,
     xlab = "Predicted Probability",
     ylab = "Hyperurcemia",
     col = fadeColor(COL[1], "33"),
     pch = 20)
axis(1)
axis(2,
     at = c(0,1),
     labels = c("No", "Yes"))
dev.off()

