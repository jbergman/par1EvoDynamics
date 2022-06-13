# load libraries and data
library(ggplot2)

data_s4<- read.table("data_s4.txt", header=TRUE, sep="\t")
data_s4$ax = factor(data_s4$ax, levels=c("non-DSB", "DSB"))
data_s4$sp = factor(data_s4$sp, levels=c("H","C","G","O"))

# plot
s4 <- ggplot(data_s4, aes(x=ax, y=prop, fill=mType)) + 
  geom_bar(stat = "identity",position = "fill") + 
  facet_wrap(.~sp, ncol=4) +
  theme_bw() + 
  scale_fill_brewer(palette="Set1") +
  xlab("") + 
  ylab("Proportion") + 
  theme(legend.title = element_blank(), axis.text.x = element_text(angle = 270, vjust = 0.5, hjust=0))
s4