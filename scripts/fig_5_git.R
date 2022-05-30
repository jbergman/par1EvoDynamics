# load libraries and data
library(ggplot2)
library (cowplot)

data_4 <- read.table("data_4.txt", header=TRUE, sep = "\t")
data_5 <- read.table("data_5.txt", header=TRUE, sep = "\t")
data_6 <- read.table("data_6.txt", header=TRUE, sep = "\t")
data_7 <- read.table("data_7.txt", header=TRUE, sep = "\t")
data_8 <- read.table("data_8.txt", header=TRUE, sep = "\t")
data_9 <- read.table("data_9.txt", header=TRUE, sep = "\t")
data_10 <- read.table("data_10.txt", header=TRUE, sep = "\t")

# plot
p1 <- ggplot(data_4, aes(x=POS/1000000, y = cMmbAvgREC)) + 
  theme_bw() + 
  geom_step() + 
  xlab("Position (Mb)") + 
  ylab("cM/Mb") + 
  facet_wrap(.~spAbbr2, ncol=3)
p1

p2 <-ggcorrplot(as.matrix(data_5), p.mat = as.matrix(data_6), type = "upper",lab = TRUE, colors = c("#377eb8", "white", "#e41a1c"))
p2

p3 <- ggplot(data_7, aes(x=POS/1000000, y = param, col=pType)) +
  theme_bw() + 
  geom_step() + 
  xlab("Position (Mb)") + 
  ylab("Nucleotide diversity") +
  facet_wrap(.~spAbbr3, ncol=3) + 
  scale_color_manual(values = c("#e41a1c","#377eb8")) + 
  theme(legend.title = element_blank(),legend.box.background = element_rect(colour = "black"))
p3

p4 <- ggcorrplot(as.matrix(data_8), p.mat = as.matrix(data_9) ,type = "upper",lab = TRUE, colors = c("#377eb8", "white", "#e41a1c"))
p4

tt <- plot_grid(p1, p2, p3, p4, ncol = 2, align = "v", axis = "lr", rel_widths = c(1.5,1), labels = c("A", "B", "C", "D"))

ggsave("fig_5.png", tt, width=35, height=25, units = "cm")

# plot Figure S1
s1 <- ggplot(data_10, aes(x=log(cMmbAvgREC), y=log(pi/nCall))) + 
  geom_point(size=0.5) + 
  facet_wrap(.~spAbbr, ncol=3)+
  theme_bw()+
  geom_smooth(method = "lm", col="red", lty=2)+
  xlab(expression(italic(log[2])(cM/Mb))) + 
  ylab(expression(italic(log[2])(pi)))
s1

ggsave("fig_s1.png", s1, width=20, height=15, units = "cm")
