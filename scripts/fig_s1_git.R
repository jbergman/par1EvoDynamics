# load libraries and data
library(ggplot2)

data_s1 <- read.table("data_s1.txt", header=TRUE, sep = "\t")
data_s1$spAbbr2 <- factor(data_s1$spAbbr2, levels = c("HUM","PTE", "PTS", "PTT", "PTV", "PPA", "GGG", "PAB", "PPY"))

# plot
s1 <- ggplot(data_s1, aes(x=log(cMmbAvgREC), y=log(pi/nCall))) + 
  geom_point(size=0.5) + 
  geom_smooth(method="lm", lty=2, col="red") +
  facet_wrap(.~spAbbr, ncol=3)+
  theme_bw()+
  xlab(expression(italic(log[2])(cM/Mb))) + 
  ylab(expression(italic(log[2])(pi)))
s1