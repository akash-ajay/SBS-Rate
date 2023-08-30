## umap customised final
library(umap)
library(tidyverse)
library(ggplot2)

### the last col has label, removing the label

rf = as.data.frame(repeat_fraction)

rf.data <- rf[,c(2:4)]

### scale if required
rf.data <- scale(rf.data)

## log trans form if required
rf.data$`Genome size`=log10(rf.data$`Genome size`)

## label vector
rf.labels <- rf[, "Label"]

### applying uMAP transformation
rf.umap <- umap(rf.data)

### generating dataframe

rf.umap_df = as.data.frame(rf.umap$layout)
rf.umap_df = cbind(rf.umap_df,rf.labels)
colnames(rf.umap_df) = c("UMAP1","UMAP2","Label")

### another function that makes use of ggplot
p = rf.umap_df %>%
  ggplot(aes(x = UMAP1, 
             y = UMAP2, 
             color = Label))+
  geom_point(size = 1.1)+
  labs(x = "UMAP1",
       y = "UMAP2",
       subtitle = "UMAP plot Genomic Parameters")+
  theme(title = element_text(hjust = 0.5,size = 15),
        legend.title = element_text(color = "black", size = 05.5),
        legend.text = element_text(color = "black", size = 05.5,face = "italic"),
        legend.position = "top")

