# library(tidyverse)
library(openintro)

hyperuricemia.samp$Hyperuricemia = as.factor(hyperuricemia.samp$hu)


levels(hyperuricemia.samp$Hyperuricemia) = c("No", "Yes")
hyperuricemia.samp$BMI = hyperuricemia.samp$bmi

myPDF("bmiHUDotplot.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))

ggplot(hyperuricemia.samp, aes(x = Hyperuricemia, y = BMI,
                               color = Hyperuricemia)) +
  geom_jitter(alpha = 0.50, width = 0.05, height = 0) +
  stat_summary(fun = "mean", col = "purple", shape = 4) +
  guides(color = "none") +
  #geom_smooth(aes(group = -1), method = "lm", se = FALSE, col = "purple") +
  theme_classic()

dev.off()






