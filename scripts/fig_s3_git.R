# load libraries and data
library(ggplot2)

data_s3 <- read.table("data_s3.txt", header=TRUE, sep="\t")
data_s3$param <- factor(data_s3$param, levels = c("N", "Period", "Copies","TL", "M", "I"))

# plot
s3 <- ggplot(data_s3, aes(x=factor(param), y=value, fill=chrType, color=chrType)) +  
  geom_dotplot(binaxis='y', stackdir='center', dotsize = 1.5) + 
  facet_wrap(.~param, scales = "free") +
  theme_bw() + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), axis.title.x = element_blank(), legend.title = element_blank()) +
  scale_color_manual(values = c("black", "#FFD700")) + 
  scale_fill_manual(values = c("black", "#FFD700")) + 
  ylab("Value")
s3