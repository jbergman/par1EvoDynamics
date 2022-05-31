# load libraries and data
library(ggplot2)

data_11 <- read.table("data_11.txt", header=TRUE, sep = "\t")
data_11$sp <- factor(data_11$sp, levels = c("S", "M", "M (PTE)", "M (PTS)", "M (PTT)", "M (PTV)", "M (PPA)", "M (PAB)", "M (PPY)"))
data_11$gr <- factor(data_11$gr, levels = c("H", "C", "G", "O"))
data_11$rb <- factor(data_11$rb, levels = c("≤4.25 cM/Mb", "4.25-11.29 cM/Mb" ,">11.29 cM/Mb"))

# plot Figure 6
p1 <- ggplot(data_11, aes(x=sp, y=prop, fill=mType)) + 
  geom_bar(stat = "identity",position = "fill") + 
  facet_grid(rb~gr,scale="free_x", space = "free") + 
  theme_bw() + 
  scale_fill_brewer(palette="Set1") +
  xlab("") + 
  ylab("Proportion") + 
  theme(legend.title = element_blank(), axis.text.x = element_text(angle = 270, vjust = 0.5, hjust=0))
p1

ggsave("fig_6.png", p1, width=13, height=15, units = "cm")