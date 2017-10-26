### Load data
library(dplyr)
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
int_cou = c("UK", "BR", "US", "KR", "CN")
euro_pps = "Millions of current euros PPS"
euro_lab = "Millions of current euros"
opr = "b) ICT sector (operational definition)"
sec = "A'=B'+C"
classfication = "261-264, 582, 61, 62, 631, 951"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")
berd_y = c(2008, 2011)

gerd_df = filter(df, variablecode == "BERD", 
                  countrycode %in% c("BR", "UK", "US", "KR", "CN"), 
                  sectorcode == 'GERD', unit == euro_pps)

### Brazilian GERD Analysis
br_gerd = filter(gerd_df, countrycode == "BR", !is.na(value))
ts_gerd = br_gerd$value
ts_year = br_gerd$year

plot_gebr = plot(ts_year, ts_gerd, type = 'l', col = "red",
                main = "Brazilian GERD Expenditures", 
                ylab = "Billions of current euros", xlab = "Years", 
                ylim = c(10000, 30000), xlim = c(2000, 2012),
                axes = FALSE)
axis(side = 1)
axis(side = 2, at= c(0, 10000, 15000, 20000, 25000, 30000), labels = c("0", "10", "15",
                                                                            "20", "25", "30"))
boxplot(ts_gerd)
summary(ts_gerd)

### International Benchmark
int_gerd = gerd_df
int_gerd = filter(int_gerd, year %in% c(2000:2013))
### uk tseries
uk_ts_gerd = filter(int_gerd, countrycode == "UK")
uk_ts_gerd = uk_ts_gerd$value
### us tseries
us_ts_gerd = filter(int_gerd, countrycode == "US")
us_ts_gerd = us_ts_gerd$value
### kr tseries
kr_ts_gerd = filter(int_gerd, countrycode == "KR")
kr_ts_gerd = kr_ts_gerd$value
### cn tseries
cn_ts_gerd = filter(int_gerd, countrycode == "CN")
cn_ts_gerd = cn_ts_gerd$value


### config plot
color = c("blue", "red", "black", "orange", "brown")
types = c('l', "b", "l", "o", "b")

plot_geint = plot(ts_year, ts_gerd, type = 'l', col = "red",
                  main = "International GERD Expenditures", 
                  ylab = "Billions of current euros", xlab = "Years", 
                  ylim = c(0, 400000), xlim = c(2000, 2014),
                  axes = FALSE,
                  cex.axis = .7)
axis(side = 1)
axis(side = 2, at= c(0, 100000, 200000, 300000, 400000, 500000), labels = c("0", "100", "200",
                                                                            "300", "400", "500"))
lines(ts_year, uk_ts_gerd, type = 'b', col = "blue")
lines(ts_year, us_ts_gerd, type = 'l', col = "black")
lines(ts_year, kr_ts_gerd, type = 'o', col = "orange")
lines(ts_year, cn_ts_gerd, type = 'b', col = "brown")
legend("topleft", countries, col = color, lwd = .8, cex = .8)


### Boxplot
boxp_gerd_int = boxplot(uk_ts_gerd, 
                        ts_gerd, 
                        us_ts_gerd, 
                        kr_ts_gerd, 
                        cn_ts_gerd, 
                        names = countries, main = "International GERD Comparision", 
                        ylab = euro_lab,
                        cex.axis = .8)

### Pie
slices_gerd = c(30805, 29302, 337256, 50223, 246144)
pct <- round(slices_gerd/sum(slices_gerd)*100)
countries_pie <- paste(countries, pct) # add percents to labels
countries_pie <- paste(countries_pie,"%",sep="") # ad % to labels
pie_gerd = pie(slices_gerd,labels = countries_pie, main="International GERD Expenditures - 2013") 

