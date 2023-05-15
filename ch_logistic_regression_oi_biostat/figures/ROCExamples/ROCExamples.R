library(openintro)
library(dplyr)
data(COL)


x = seq( 0, 100,  1)
x = x/100
y1 = -(x*(x-2)) 
y2 = y1**(0.5)
y3 = y2**(0.5)

# calculating AUC
# f.1 can easily be integrated directly; AUC = 2/3

f.1 = function(x){
  -x*(x - 2)
}

integrate(f.1, 0, 1)


f.2 = function(x){
  (-x**2 + 2*x)**0.5
}

integrate(f.2, 0 , 1)


f.3 = function(x){
  (-x**2 + 2*x)**0.25
}


integrate(f.3, 0, 1)



myPDF("ROCExamples.pdf", 6.0, 5.0,
      #mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

plot(x,x, type = "l", lty = 1,
     xlab = "False positive rate",
     ylab = "True positive rate")
lines(x, y1, type = "l", lty = 1,
      col = "darkgreen")
lines(x, y2, type = "l", lty = 1,
      col = "darkblue")
lines(x, y3, type = "l", lty = 1,
      col = "darkred")


dev.off()

