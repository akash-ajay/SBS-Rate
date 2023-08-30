### Plotting a regression plot ggplot

### libraries

library(ggplot2)
library(RColorBrewer)
library(viridis)
library(tibble)
library(dplyr)



### remove method lm for polyplot

### straightened plot
ggplot(data = imputed, aes(x = GC, y = log_rt)) + 
  geom_point(color='blue') +
  geom_smooth(method = "lm")+
  ggtitle(label = "Genomic GC vs Log Substitution rate", subtitle = "Linear regression")+
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))+
  xlab(label = "Genomic GC%")+
  ylab(label = "log substitution rate(bp/gen)")+
  scale_x_continuous(breaks = scales::pretty_breaks(n = 8))+
  scale_y_continuous(breaks = scales::pretty_breaks(n = 8))

