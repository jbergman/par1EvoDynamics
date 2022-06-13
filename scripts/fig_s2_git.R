# load libraries and data
library(ggplot2)
data_s2_1 <- read.table("data_s2_1.txt", header=TRUE, sep="\t")
data_s2_1$spAbbr2 <- factor(data_s2_1$spAbbr2, levels = c("HUM (N=29575)","PTE (N=5998)", "PTS (N=6998)", "PTT (N=10618)", "PTV (N=3561)", "PPA (N=3192)", "GGG (N=6215)", "PAB (N=9149)", "PPY (N=5777)"))

data_s2_2 <- read.table("data_s2_2.txt", header=TRUE, sep="\t")
data_s2_2$spAbbr <- factor(data_s2_2$spAbbr, levels = c("HUM","PTE", "PTS", "PTT", "PTV", "PPA", "GGG", "PAB", "PPY"))

# plot
s2a <- ggplot(data_s2_1, aes(x = POS/1000000, y = abs(diff))) + 
  geom_point(col="gray") +
  facet_wrap(.~spAbbr2, ncol=3) +
  theme_bw() + 
  xlab("Position (Mb)") + 
  ylab(expression(abs(italic(f)[F]-italic(f)[M])))
s2a

s2b <- ggplot(data_s2_1) + 
  geom_point(aes(x = POS/1000000, y = -log10(pval)), col="gray") +
  geom_hline(aes(yintercept = -log10(bfCorr0.05)), lty=1) + 
  geom_hline(aes(yintercept = -log10(bfCorr0.1)), lty=2) + 
  facet_wrap(.~spAbbr2, ncol=3) +
  theme_bw() + 
  xlab("Position (Mb)") + 
  ylab(expression(-log[10](italic(p))))
s2b

s2c <- ggplot(data_s2_2, aes(x = posCM, y = abs(diff))) + 
  geom_point(col="gray") + 
  facet_wrap(.~spAbbr, ncol=3) +
  theme_bw() + 
  xlab("Genetic length (cM)") + 
  ylab(expression(abs(italic(f)[F]-italic(f)[M])))
s2c

s2d <- ggplot(data_s2_2) + 
  geom_point(aes(x = posCM, y = -log10(pval)), col="gray") +
  geom_hline(aes(yintercept = -log10(bfCorr0.05)), lty=1) + 
  geom_hline(aes(yintercept = -log10(bfCorr0.1)), lty=2) + 
  facet_wrap(.~spAbbr, ncol=3) +
  theme_bw() + 
  xlab("Genetic length (cM)") + 
  ylab(expression(-log[10](italic(p))))
s2d