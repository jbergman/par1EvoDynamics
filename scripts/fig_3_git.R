# load libraries and data
library(ggplot2)
library(cowplot)
library(ggcorrplot)
library(ppcor)

data <- read.table("data_1.txt", header=TRUE)

data$tstv<-(data$ts/data$tv)

data$axh <- c(rep("A", 24), rep("8L", 4), rep("A", 40), rep("16L", 4), rep("16R", 4), rep("A", 24), rep("PAR1", 4))

data$axr <- c("Chr2", rep("A",99), rep("PAR1",4))

nn <- data.frame(gcDiff = data$gcDiff, PY = data$perYearRates, tstv = data$tstv, L = data$len/1000000)
corr <- round(pcor(nn, method = "spearman")$estimate, 2)
p.mat <- pcor(nn, method = "spearman")$p.value

# plot
p1 <- ggplot(data, aes(x = gcDiff, y=perYearRates/1000000,col=ax)) + geom_point() +theme_bw()+ scale_color_manual(values = c("black", "#FFD700")) +
  ylab("Divergence rate (PY)") + xlab(expression("GC* - GC (current)"))+
  theme(legend.title = element_blank(), legend.position = "none",legend.box.background = element_rect(colour = "black"),
        legend.margin =margin(r=5,l=0,t=-5,b=0))
p1

p2 <- ggplot(data, aes(x = gcDiff, y=tstv,col=ax)) + geom_point() +theme_bw()+ scale_color_manual(values = c("black", "#FFD700")) +
  ylab("ts:tv") + xlab(expression("GC* - GC (current)"))+
  theme(legend.title = element_blank(), legend.position = "none",legend.box.background = element_rect(colour = "black"),
        legend.margin =margin(r=5,l=0,t=-5,b=0))
p2

p3 <- ggplot(data, aes(x = gcDiff, y=len/1000000,col=axr)) + geom_point() +theme_bw()+ scale_color_manual(values = c("black", "red","#FFD700")) +
  ylab("Chromosome length (Mb)") + xlab("GC* - GC (current)")+
  theme(legend.title = element_blank(), legend.position = c(0.87,0.2),legend.box.background = element_rect(colour = "black"),
        legend.margin =margin(r=5,l=0,t=-5,b=0))
p3

p4 <-ggcorrplot(corr, p.mat = p.mat,type = "upper",lab = TRUE, colors = c("#377eb8", "white", "#e41a1c"))
p4
