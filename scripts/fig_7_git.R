# load libraries and data
library(ggplot2)

data_12 <- read.table("data_12.txt", header=TRUE, sep = "\t")
data_12$sp <- factor(data_12$sp, levels = c("HUM","PTE", "PTS", "PTT", "PTV", "PPA", "GGG", "PAB", "PPY"))

# plot Figure 7
p1 <- ggplot(subset(data_12, mType!="TV (CpG+)"), aes(x=mType, y=B)) +
  geom_boxplot(outlier.size = 0.5,shape=21) + 
  facet_wrap(.~sp, ncol = 9, nrow = 1) +
  theme_bw() + 
  theme(legend.position = "none", axis.title.x = element_blank(), axis.text.x = element_text(angle = 90, hjust = 1)) +
  ylab(expression(italic(B)))+ geom_point(aes(x=mType,y=B_full), shape=18, size = 2)
p1
