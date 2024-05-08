# library(tidyverse)
library(openintro)

hyperuricemia.samp$Hyperuricemia = as.factor(hyperuricemia.samp$hu)

levels(hyperuricemia.samp$Hyperuricemia) = c("No", "Yes")
hyperuricemia.samp$BMI = hyperuricemia.samp$bmi

myPDF("bmiHuSexDotplot.pdf", 8.0, 5.0,
      mar = c(3.9, 7, 0.5, 0.2),
      mgp = c(2.4, 0.55, 0))


ggplot(data=hyperuricemia.samp, aes(x=sex, y=BMI, color=Hyperuricemia)) +
  geom_point(position=position_dodge(width=.3))

dev.off()
