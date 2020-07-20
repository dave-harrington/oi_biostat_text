NormalHist <- function(obs, hold, M, SD, col) {
  plot(0, 0,
       type = 'n',
       xlab = 'Height',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = M + c(-3, 3) * SD,
       ylim = c(0, max(hold$density)))
  for (i in 1:length(hold$counts)) {
    rect(hold$breaks[i], 0,
         hold$breaks[i + 1], hold$density[i],
         col = col)
  }
  axis(1)
  x <- seq(min(obs) - 2, max(obs) + 2, 0.01)
  y <- dnorm(x, M, SD)
  lines(x, y, lwd = 1.5)
}

NormalHist2 <- function(obs, hold, M, SD, col) {
  plot(0, 0,
       type = 'n',
       xlab = 'log(weight)',
       ylab = '',
       axes = FALSE,
       main = '',
       xlim = M + c(-3, 3) * SD,
       ylim = c(0, max(hold$density)))
  for (i in 1:length(hold$counts)) {
    rect(hold$breaks[i], 0,
         hold$breaks[i + 1], hold$density[i],
         col = col)
  }
  axis(1)
  x <- seq(min(obs) - 2, max(obs) + 2, 0.01)
  y <- dnorm(x, M, SD)
  lines(x, y, lwd = 1.5)
}
