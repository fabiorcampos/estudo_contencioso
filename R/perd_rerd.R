### Load data
library(dplyr)
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
int_cou = c("UK", "BR", "US", "KR", "CN")
euro_lab = "Millions of current euros"
sec_perd = "A=B+SER"
classfication = "261-264, 582, 61, 62, 631, 951"
countries_perd = c("United Kingdom", "Brazil", "China", "South Korea")
countries_rerd = c("United Kingdom", "Brazil", "United States", "South Korea", "China")

perd_df = filter(df, variablecode == "PERD", 
                 countrycode %in% c("BR", "UK", "US", "KR", "CN"), sectorcode == sec,
                 year %in% c(2008, 2011), !is.na(value))

### Perd Analysis (barplot and pie)
perd_df = perd_df[,-c(1,2,5,6,7,8,9,10)]
perd_y2008 = filter(perd_df, year == 2008)
perd_y2011 = filter(perd_df, year == 2011)
perd_df = data.frame("2008" = perd_y2008$value, "2011" = perd_y2011$value, row.names = countries_perd)
perd_df = as.data.frame(t(perd_df))
perd_df_m = as.matrix(perd_df)
perd_barplot = barplot(perd_df_m , beside=T, legend.text = T, col=c("blue" , "red"), ylim=c(0,400000), xlab = "Countries", 
                     ylab = "Full Time Equivalent",
                     main = "R&D Personnel - International Comparasion")

summary(perd_df)

slices_perd = c(33352, 21706, 391214, 115595)
pct_perd <- round(slices_perd/sum(slices_perd)*100)
countries_pie_perd <- paste(countries_perd, pct_perd) # add percents to labels
countries_pie_perd <- paste(countries_pie_perd,"%",sep="") # ad % to labels
pie_perd = pie(slices_perd,labels = countries_pie_perd, main="International PERD Comparision - 2011") 

### Rerd Analysis
rerd_df = filter(df, variablecode == "RERD", 
                 countrycode %in% c("BR", "UK", "US", "KR", "CN"),
                 sectorcode == "TOT",
                 year %in% c(2000:2011),
                 !is.na(value))

### International Benchmark
int_rerd = rerd_df
int_rerd = filter(int_rerd, year %in% c(2000:2011))
### uk tseries
uk_ts_rerd = filter(int_rerd, countrycode == "UK")
uk_ts_rerd = uk_ts_rerd$value
### Brazil Series
br_rerd = filter(rerd_df, countrycode == "BR", !is.na(value))
ts_year_rerd = br_rerd$year
ts_rerd = br_rerd$value
### us tseries
us_ts_rerd = filter(int_rerd, countrycode == "US")
us_ts_rerd = us_ts_rerd$value
### kr tseries
kr_ts_rerd = filter(int_rerd, countrycode == "KR")
kr_ts_rerd = kr_ts_rerd$value
### cn tseries
cn_ts_rerd = filter(int_rerd, countrycode == "CN")
cn_ts_rerd = cn_ts_rerd$value

### config plot
color = c("blue", "red", "black", "orange", "brown")
types = c('l', "b", "l", "o", "b")
plot_reint = plot(ts_year_rerd, ts_rerd, type = 'l', col = "red",
                  main = "International RERD occupations", ylab = "Researchers", xlab = "Years", ylim = c(40000, 1500000), xlim = c(2000, 2011))
lines(ts_year_rerd, uk_ts_rerd, type = 'b', col = "blue")
lines(ts_year_rerd, us_ts_rerd, type = 'l', col = "black")
lines(ts_year_rerd, kr_ts_rerd, type = 'o', col = "orange")
lines(ts_year_rerd, cn_ts_rerd, type = 'b', col = "brown")
legend("topright", countries, col = color, pch = c(1,1,1,1,1), cex = 0.7)

### pie analysis
slices_rerd = c(89043, 67427, 853000, 223513, 818811)
pct_rerd <- round(slices_rerd/sum(slices_rerd)*100)
countries_pie_rerd <- paste(countries_rerd, pct_rerd) # add percents to labels
countries_pie_rerd <- paste(countries_pie_rerd,"%",sep="") # ad % to labels
pie_rerd = pie(slices_rerd,labels = countries_pie_rerd, main="International RERD Comparision - 2011") 