### Load data
source("./R/exploratory.R")
int_cou = c("UK", "US", "BR", "KR", "CN")
euro_pps = "Millions of current euros PPS"
gerd_int = filter(df, classificationcode == "GERD" & countrycode == int_cou, !is.na(value))

### International Benchmark
br_test = filter(df, variablecode == "BERD", countrycode == "BR")


### No LI effect Model  




### Forecast Model