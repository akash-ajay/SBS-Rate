### data imputation

### random forest , missForest Package

library(missForest)

### numeric matrix/dataframe

### unified error for whole matrix
uek_imp = missForest(uek_num)

### variable wise errors 
uek_imp1 = missForest(uek_num,variablewise = TRUE)

## error given by nrmse values

### imputed matrix
uek_imp_df = uek_imp$ximp


