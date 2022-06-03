# load libraries and data
library(ggplot2)
data_13 <- read.table("/Users/au612643/Desktop/par/data/data_13.txt", header=TRUE, sep="\t")
data_13$sp <- factor(data_13$sp, levels = c("N","D", "H"))

data_14 <- read.table("/Users/au612643/Desktop/par/data/data_14.txt", header=TRUE, sep="\t")
data_14$spAbbr2 <- factor(data_14$spAbbr2, levels = c("NEA (N=637)","DEN (N=704)", "HUM (N=29172)"))

data_15 <- read.table("/Users/au612643/Desktop/par/data/data_15.txt", header=TRUE, sep="\t")
data_16 <- read.table("/Users/au612643/Desktop/par/data/data_16.txt", header=TRUE, sep="\t")

# plot
p1 <- ggplot(data_13, aes(x=tel, y=prop, fill=mType)) + 
  geom_bar(stat = "identity",position = "fill") + 
  facet_wrap(.~sp, ncol=4) + 
  theme_bw() + 
  scale_fill_brewer(palette="Set1") +
  xlab("") + ylab("Proportion") + 
  theme(legend.title = element_blank(), axis.text.x = element_blank(),axis.ticks = element_blank())
p1

p2 <- ggplot(data_14, aes(x=POS/1000000, y = pi/nCall))+ theme_bw() + geom_step() + xlab("Position (Mb)") + ylab("") +
  facet_wrap(.~spAbbr2, ncol=2) + ylab(expression(italic(H)))
p2

p3 <- ggcorrplot(as.matrix(data_15), p.mat = as.matrix(data_16), type = "upper",lab = TRUE, colors = c("#377eb8", "white", "#e41a1c"), lab_size =6, pch.cex = 10)
p3