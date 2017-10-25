### Load data
library(dplyr)
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
int_cou = c("UK", "BR", "US", "KR", "CN")
euro_lab = "Millions of current euros"
sec_perd = "A=B+SER"
classfication = "261-264, 582, 61, 62, 631, 951"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")

perd_df = filter(df, variablecode == "PERD", 
                 countrycode %in% c("BR", "UK", "US", "KR", "CN"), sectorcode == sec, !is.na(value))


### Perd Analysis


### Rerd Analysis