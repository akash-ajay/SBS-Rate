### correlation heatmap
### corrplot function

library(corrplot)

### increaing font size of title
par(cex.main = 1.1)

### plotting via corrplot
corrplot::corrplot(cor(imputed),main = "Unicellular Eukaryotes",
                   method = 'shade',type = 'full',
                   tl.cex = 0.7,mar = c(1.5,1.5,1.5,1.5))
