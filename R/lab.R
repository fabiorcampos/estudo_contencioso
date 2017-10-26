### Load data
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
sec = "A'=B'+C"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")
ts_year_lab = c(2000:2014)
unit_lab = "Thousands of current euros PPS per person"


### Filter data
lab_df = filter(df, variablecode == "PRODEMP", 
                countrycode %in% c("BR", "UK", "US", "KR", "CN"), 
                sectorcode == sec, year %in% c(2000:2014), unit == unit_lab)

lab_df = lab_df[,-c(1,2,5,6,7,8,9,10)]

### International Benchmark
int_lab = lab_df
### Brazil tseries
br_ts_lab = filter(int_lab, countrycode == "BR")
br_ts_lab = br_ts_lab$value
### uk tseries
uk_ts_lab = filter(int_lab, countrycode == "UK")
uk_ts_lab = uk_ts_lab$value
### us tseries
us_ts_lab = filter(int_lab, countrycode == "US")
us_ts_lab = us_ts_lab$value
### kr tseries
kr_ts_lab = filter(int_lab, countrycode == "KR")
kr_ts_lab = kr_ts_lab$value
### cn tseries
cn_ts_lab = filter(int_lab, countrycode == "CN")
cn_ts_lab = cn_ts_lab$value

### config plot
color = c("blue", "red", "black", "orange", "brown")
types = c('l', "b", "l", "o", "b")

plot_labint = plot(ts_year_lab, br_ts_lab, type = 'b', col = "red",
                   main = "International lab", cex.axis=0.8, ylab = "100 persons", xlab = "Years", ylim = c(10, 200), xlim=c(2000, 2015))
lines(ts_year_lab, uk_ts_lab, type = 'l', col = "blue")
lines(ts_year_lab, us_ts_lab, type = 'l', col = "black")
lines(ts_year_lab, kr_ts_lab, type = 'o', col = "orange")
lines(ts_year_lab, cn_ts_lab, type = 'b', col = "brown")
legend("topleft", countries, col = color, pch = c(1,1,1,1,1), cex = .8)


### Boxplot
boxp_lab_int = boxplot(uk_ts_lab, br_ts_lab, us_ts_lab, kr_ts_lab, cn_ts_lab, names = countries, main = "International lab Comparision", ylab = "persons", cex.axis=0.8)

### Pie
slices_lab = c(83, 56, 165, 102, 43)
pct_lab <- round(slices_lab/sum(slices_lab)*100)
countries_pie_lab <- paste(countries, pct_lab) # add percents to labels
countries_pie_lab <- paste(countries_pie_lab,"%",sep="") # ad % to labels
pie_lab = pie(slices_lab,labels = countries_pie_lab, main="International lab - 2014") 
