### Load data
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
int_cou = c("UK", "BR", "US", "KR", "CN")
euro_pps = "Millions of current euros PPS"
opr = "b) ICT sector (operational definition)"
sec = "A'=B'+C"
classfication = "261-264, 582, 61, 62, 631, 951"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")
berd_y = c(2008, 2011)

### Brazil Berd analysis
br_berd = filter(df, countrycode == "BR", variablecode == 'BERD', unit == euro_pps, classificationcode == classfication, !is.na(value))
plot_bba = barplot(br_berd$value, main="Brazil BERD Expenditure", 
                   xlab="Years",
                   ylab="Millions of current euros",
                   names.arg = br_berd$year,
                   col = "red",
                   ylim = c(0, 2000)) 

### International Benchmark
df_berd =  filter(df, countrycode %in% c("BR", "UK", "US", "KR", "CN"), 
                  variablecode == 'BERD', unit == euro_pps, 
                  classificationcode == classfication, year %in% c(2008, 2011), !is.na(value))

df_berd = df_berd[,-c(1,2,5,6,7,8,9,10)]
y2008 = filter(df_berd, year == 2008)
y2011 = filter(df_berd, year == 2011)
df_berd = data.frame("2008" = y2008$value, "2011" = y2011$value, row.names = countries)
df_berd = as.data.frame(t(df_berd))
df_berd_m = as.matrix(df_berd)
be_barplot = barplot(df_berd_m , beside=T, legend.text = T, col=c("blue" , "red"), ylim=c(0,70000), xlab = "Countries", 
                     ylab = "Millions of current euros",
                     main = "International BERD Expenditure Comparision")

### No LI effect Model
