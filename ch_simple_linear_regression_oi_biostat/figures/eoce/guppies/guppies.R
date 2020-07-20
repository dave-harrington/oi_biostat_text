# load packages -----------------------------------------------------
library(openintro)

# load data ---------------------------------------------------------

load("orange_guppies.Rdata")

# plot length vs height ------------------------------------

pdf("guppies_length_height.pdf", 5.5, 4.3)

par(mar = c(3.8, 3.8, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

plot(orange.guppies$length ~ orange.guppies$height, 
     xlab = "Height (cm)", ylab = "Length (cm)", 
     pch = 19, col = COL[1,2])
abline(lm(orange.guppies$length ~ orange.guppies$height))

dev.off()


# plot residuals ------------------------------------------

pdf("guppies_resid.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

guppies = lm(orange.guppies$length ~ orange.guppies$height)

plot(resid(guppies) ~ orange.guppies$height,
     xlab = "Height(cm)", ylab = "Residuals", 
     col = COL[1,2], pch = 19,
     ylim = c(-30, 30), axes = FALSE)
axis(1)
axis(2, at = seq(-20, 20, 20))
box()

abline(h = 0, lty = 2)

dev.off()

pdf("guppies_qq.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

qqnorm(resid(guppies),
     main = "Q-Q Plot of Residuals", 
     col = COL[1,3], pch = 19,
     ylab = "Sample Quantiles")
qqline(resid(guppies))
axis(1)
axis(2)

dev.off()

# MLH and orange color ------------------------------------------

orange.guppies$body.size = orange.guppies$length * orange.guppies$height
orange.guppies$relative.orange = orange.guppies$orange.area/orange.guppies$body.size

pdf("guppies_orange_mlh.pdf", 5.5, 4.3)

par(mar = c(3.8, 3.8, 0.5, 0.5), las = 1, mgp = c(2.7, 0.7, 0), 
    cex.lab = 0.75, cex.axis = 0.75)

plot(relative.orange ~ MLH, data = orange.guppies,
     ylab = "Orange area relative to body size",
     xlab = "MLH", cex = 0.75,
     pch = 19, col = COL[1, 2])
abline(lm(relative.orange ~ MLH, data = orange.guppies),
       col = COL[2])

dev.off()


pdf("guppies_mlh_resid.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

guppies = lm(relative.orange ~ MLH, data = orange.guppies)

plot(resid(guppies) ~ orange.guppies$MLH,
     xlab = "Relative Orange Area", ylab = "Residuals", 
     col = COL[1,2], pch = 19)

abline(h = 0, lty = 2)

dev.off()

pdf("guppies_mlh_qq.pdf", 5.5, 4.3)

par(mar = c(3.5, 4, 1, 0.5), las = 1, mgp = c(2.5, 0.7, 0), 
    cex.lab = 1, cex.axis = 1)

qqnorm(resid(guppies),
       main = "Q-Q Plot of Residuals", 
       col = COL[1,3], pch = 19,
       ylab = "Sample Quantiles")
qqline(resid(guppies))
axis(1)
axis(2)

dev.off()
