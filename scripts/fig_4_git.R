# load libraries and data
library(ggplot2)
library (cowplot)

tels <- c("2R","4R","5R","6L","6R","7R","8L","8R","9R","10L","10R","11L","11R",
          "12L","12R","13R","14R","16L","16R","17L","18R","19L","19R","21R","22R")

data_2 <- read.table("data_2.txt", header=TRUE)
data_2$tel[which(data_2$tel=="XGhum")] <- "PAR1"
data_2$tel = factor(data_2$tel, levels=c(tels, "PAR1"))

data_3 <- read.table("data_3.txt", header=TRUE)
data_3$tel = factor(data_3$tel, levels=c("PAR1",rev(tels)))
data_3$sp = factor(data_3$sp, levels=c("H", "C", "G", "O"))

# plot
p1 <- ggplot(subset(data_2), aes(x=tel, y=prop, fill=mType)) + 
  geom_bar(stat = "identity",position = "fill") + 
  facet_wrap(.~sp) + 
  theme_bw() + 
  scale_fill_brewer(palette="Set1") +
  xlab("") + 
  ylab("Proportion") + 
  theme(legend.title = element_blank(), axis.text.x = element_text(angle = 270, vjust = 0.5, hjust=0))
p1

p2 <- ggplot(data_3, aes(x=dif, y = tel, color = sp)) + 
  geom_point() + 
  facet_wrap(.~mType, ncol = 7) + 
  theme_bw() + 
  scale_color_brewer(palette="Set1") +
  theme(legend.title = element_blank(), axis.text.x = element_text(angle = 270, vjust = 0.5, hjust=1)) + ylab("") + xlab("Z-score") + 
  geom_vline(xintercept = 0, lty=2)

p2

tt <- plot_grid(p1, p2, ncol = 1, axis = "lr", align="v", rel_heights = c(1, 1), labels = c("A", "B"))

ggsave("fig4.png", tt, width=22, height=20, units = "cm")