# load libraries and data
library(ggplot2)
library (cowplot)

data <- read.table("data_1.txt", header=TRUE)

# plot
p1 <- ggplot(data, aes(x = sp, y=perYearRates/1000000)) +
  geom_violin(draw_quantiles = c(0.5)) + geom_jitter(height = 0, width = 0.1, aes(col=ax))+
  ylab("Divergence rate (PY)") +
  theme_bw() + 
  theme(axis.title.x = element_blank(), legend.position = c(0.86,0.15), legend.title = element_blank(),
        legend.box.background = element_rect(colour = "black"),
        legend.margin =margin(r=5,l=0,t=-5,b=0)) + 
  scale_color_manual(values = c("black", "#FFD700")) 

p2 <- ggplot(data, aes(x = sp, y=(atgc/gcat))) +
  geom_violin(draw_quantiles = c(0.5)) + geom_jitter(height = 0, width = 0.1, aes(col=ax))+
  ylab(expression("#(AT"%->%"GC)/#(GC"%->%"AT)"))+
  theme_bw() + 
  theme(axis.title.x = element_blank(), legend.position = "none") + 
  geom_hline(yintercept = 1, color="red", lty=2)+
  scale_color_manual(values = c("black", "#FFD700")) 

p3 <- ggplot(data, aes(x = sp, y=gcCurr-gcStar)) +
  geom_violin(draw_quantiles = c(0.5)) + geom_jitter(height = 0, width = 0.1, aes(col=ax))+
  ylab("GC* - GC (current)")+
  theme_bw() +
  theme(axis.title.x = element_blank(), legend.position = "none") + 
  geom_hline(yintercept = 0, color="red", lty=2)+
  scale_color_manual(values = c("black", "#FFD700")) 

tt <- plot_grid(p1, p2, p3, ncol = 1, align="v", labels = c("A", "B", "C"))

ggsave("fig2.png", tt, width=10, height=20, units = "cm")