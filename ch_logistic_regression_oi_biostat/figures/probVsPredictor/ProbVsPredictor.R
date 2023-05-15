
library(openintro)
data(COL)


myPDF("probVsPredictor.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

x.start = 0.0
x.end = 10.0
x.step = 1/20

x = seq(from = x.start, to = x.end, by = x.step)

# curve 1

beta.1 = 0.6
beta.0 = -3.0
link.x = beta.0 + beta.1 * x
odds.x = exp(link.x)
prob.x = exp(link.x) / (1 + exp(link.x))
# lines(x, prob.x,  type = "l", lty = 1)
plot(x, prob.x, 
     type = "l",
     xlab = "Predictor x", 
     ylab = "Probability", lty = 1,
     ylim = c(0.0, 1.0),
     axes = FALSE)

# curve 2

beta.1 = 0.8
beta.0 = -3.0

link.x = beta.0 + beta.1 * x
odds.x = exp(link.x)
prob.x = exp(link.x) / (1 + exp(link.x))

lines(x, prob.x,  type = "l", lty = 2)


# curve 3

beta.0 = 3.0
beta.1 = -0.6

link.x = beta.0 + beta.1 * x
odds.x = exp(link.x)
prob.x = exp(link.x) / (1 + exp(link.x))

lines(x, prob.x,  type = "l", lty = 3)

# curve 4

beta.0 = -0.40
beta.1 = 0.0
link.x = beta.0 + beta.1 * x
odds.x = exp(link.x)
prob.x = exp(link.x) / (1 + exp(link.x))

lines(x, prob.x,  type = "l", lty = 4)

axis(1)
labels <- c("0.0  ",
            "0.2  ",
            "0.4  ",
            "0.6  ",
            "0.8  ",
            "1.0  ")
axis(2, at, labels)
dev.off()

