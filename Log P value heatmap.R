### heatmap with for Log P values 

### ggplot

library(ggplot2)
library(hrbrthemes)

muek = as.data.frame(Multicellular_correlation_table)

x1 = rownames(muek)
y2 = colnames(muek)


y2 = as.vector(y2)
y2p = setdiff(y2,y2[1])
x1 = y2p

###converting to vector form
muek1 = muek[,-1]
z1 = as.vector(muek1)
muek1_df = as.data.frame(muek1)
a1 = nrow(z1)
a2 = ncol(z1)
a1a2 = a1*a2

### now unlisting and creating a new dataframe

z2 = matrix(unlist(z1), byrow=T,a1a2,1)

### marking P values greater than 0.05 as equal to 0.05 to reduce scaling issues

z2vec = as.vector(z2)
m1 = which(z2vec >= 0.05)
z2vec[m1]= 0.05


### creating dataframe

data2 = expand.grid(X = x1, Y = y2p)
data2$Z = log10(z2vec)
Z_val = data2$Z
colnames(data2) = c("Taxons","Parameters","Log_P")



### plotting histgram with ggplot2 and viridis


library(viridis)
p = ggplot(data2, aes(Taxons, Parameters, fill= Log_P)) + 
  geom_tile()+
  scale_fill_gradient(low="dark blue", high="white") +
  theme_classic()+
  scale_x_discrete(position = "top")+
  ggtitle(label = "Log P value heatmap", subtitle = "Multicellular Eukaryotes")+
  theme(plot.title = element_text(hjust = 0.5,face = "bold"),
        plot.subtitle = element_text(hjust = 0.5))
p + theme(axis.text.x = element_text(size=9 ,angle = 90),
          axis.text.y = element_text(size=9),
          panel.border = element_rect(colour = "black", fill = NA, size = 0.5)) 


