### Load data
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
int_cou = c("UK", "BR", "US", "KR", "CN")
euro_pps = "Millions of current euros PPS"
opr = "b) ICT sector (operational definition)"
sec = "A'=B'+C"
classfication = "261-264, 582, 61, 62, 631, 951"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")
berd_y = c(2008, 2011)

int_gerd = filter(df, variablecode == "BERD", 
                 countrycode %in% c("BR", "UK", "US", "KR", "CN"), 
                 sectorcode == 'GERD', unit == euro_pps)


### International Benchmark


### No LI effect Model  




### Forecast Model