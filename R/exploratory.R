library(dplyr)

### Load data
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",")
head(df)
str(df) ### check the variables codes

### Variables and countries
variables = table(df$variablecode)
countries = table(df$country)
cod_country = table(df$countrycode)

### Filter variables - Brazil Analysis 
BR_BERD = filter(df, variablecode == 'BERD' & countrycode == 'BR', !is.na(value))
BR_EMP = filter(df, variablecode == 'EMP' & countrycode == 'BR', !is.na(value))
BR_ERTEUR = filter(df, variablecode == 'ERTEUR' & countrycode == 'BR', !is.na(value))
BR_GBARD = filter(df, variablecode == 'GBARD' & countrycode == 'BR', !is.na(value))
BR_GO = filter(df, variablecode == 'GO' & countrycode == 'BR', !is.na(value))
BR_GVA = filter(df, variablecode == 'GVA' & countrycode == 'BR', !is.na(value))
BR_HEMP = filter(df, variablecode == 'HEMP' & countrycode == 'BR', !is.na(value))
BR_ICTGBARD = filter(df, variablecode == 'ICTGBARD' & countrycode == 'BR', !is.na(value))
BR_PERD = filter(df, variablecode == 'PERD' & countrycode == 'BR', !is.na(value))
BR_PPP = filter(df, variablecode == 'PPP' & countrycode == 'BR', !is.na(value))
BR_PRICE = filter(df, variablecode == 'PRICE' & countrycode == 'BR', !is.na(value))
BR_PRODEMP = filter(df, variablecode == 'PRODEMP' & countrycode == 'BR', !is.na(value))
BR_PRODHEMP = filter(df, variablecode == 'PRODHEMP' & countrycode == 'BR', !is.na(value))
BR_RERD = filter(df, variablecode == 'RERD' & countrycode == 'BR', !is.na(value))

### Names
BERD_n = 'Business Expenditure in R&D'
GBARD_n = 'Government budget allocations for R&D'
