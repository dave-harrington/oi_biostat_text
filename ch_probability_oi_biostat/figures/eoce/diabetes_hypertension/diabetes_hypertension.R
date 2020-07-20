# load openintro package for colors ---------------------------------
library(openintro)
data(COL)
library(grid)
library(VennDiagram)

# draw venn diagram -------------------------------------------------
venn.plot <- draw.pairwise.venn(
  area1 = 9,
  area2 = 30,
  cross.area = 6,
  category = c("Diabetes", "Hypertension"),
  fill = c(COL[1,3], COL[2,3]),
  lty = "blank",
  cex = 2,
  cat.cex = 2,
  cat.pos = c(20, -30),
  cat.dist = 0.09,
  cat.just = list(c(-1, -1), c(1, 1)),
  ext.pos = 30,
  ext.dist = -0.05,
  ext.length = 0.85,
  ext.line.lwd = 2,
  ext.line.lty = "dashed"
);
grid.draw(venn.plot)

tiff(filename = "diabetes_hypertension.tiff", compression = "lzw");
grid.draw(venn.plot);
dev.off();
