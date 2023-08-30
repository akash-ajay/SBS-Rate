### detecting multivariate outliers using Mahlanobis method
### package - mvoutlier

### import dataframe
### can detect outliers between 2 varaibles at a time

library(mvoutlier)

### input dataframe
### dataframe showing info on prokaryotes
rf = as.data.frame(rf)


### convert rate to log scale 
log_rate = log10(rf$`mutation rate`)

### for example
### finding outliers for repeat fraction
rf1 = cbind(rf$`genomic repeat fraction(%)`,log_rate`)
rf_bi = as.data.frame(rf_bi)
colnames(rf_bi)= c("rfraction","log_rate")

###finding outlier at alpha = 0.01
### generates plot showing the position of bivariate outlier
rf_out = aq.plot(rf1, alpha = 0.01, quan = 1/2)

## identifying species which are outliers
rf_out1 = which(rf_out$outliers == TRUE)

## filtering out outliers
rf2 = rf1[which(rf_out$outliers== FALSE),]
rf2 = as.data.frame(rf2)
colnames(rf2)= c("rfraction","log_rate")

##shapiro test
## checking for normality
a1 = shapiro.test(rf2$rfraction)
a2 = shapiro.test(rf2$log_rate)

## correlation test
if(min(a1$p.value,a2$p.value)<= 0.05){
  c_test = cor.test(rf2$rfraction,rf2$log_rate, method = "spearman")
}else{
  c_test = cor.test(rf2$rfraction,rf2$log_rate, method = "pearson")
}

##check the results of correlation test
c_test






