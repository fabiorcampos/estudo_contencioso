library(dplyr)
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
int_cou = c("UK", "BR", "US", "KR", "CN")
euro_pps = "Millions of current euros PPS"
euro_lab = "Millions of current euros"
opr = "b) ICT sector (operational definition)"
sec = "A'=B'+C"
classfication = "261-264, 582, 61, 62, 631, 951"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")
ts_year_gva = c(1995:2014)

gva_df = filter(df, variablecode == "GVA", 
                 countrycode %in% c("BR", "UK", "US", "KR", "CN"), 
                 sectorcode == sec, unit == euro_pps, year %in% c(1995:2014))

gva_df = gva_df[,-c(1,2,5,6,7,8,9,10)]

### International Benchmark
int_gva = gva_df
### Brazil tseries
br_ts_gva = filter(int_gva, countrycode == "BR")
br_ts_gva = br_ts_gva$value
### uk tseries
uk_ts_gva = filter(int_gva, countrycode == "UK")
uk_ts_gva = uk_ts_gva$value
### us tseries
us_ts_gva = filter(int_gva, countrycode == "US")
us_ts_gva = us_ts_gva$value
### kr tseries
kr_ts_gva = filter(int_gva, countrycode == "KR")
kr_ts_gva = kr_ts_gva$value
### cn tseries
cn_ts_gva = filter(int_gva, countrycode == "CN")
cn_ts_gva = cn_ts_gva$value


### config plot
color = c("blue", "red", "black", "orange", "brown")
types = c('l', "b", "l", "o", "b")

plot_gvaint = plot(ts_year_gva, br_ts_gva, type = 'b', col = "red",
                  main = "International GVA Benchmarrk", cex.axis=0.5, ylab = "Billions of current euros", xlab = "Years", ylim = c(20000, 700000), xlim=c(1995, 2015), axes = FALSE)
axis(side = 1)
axis(side = 2, at= c(0, 200000, 400000, 600000, 700000), labels = c("0", "200", "400",
                                                                            "600", "700"), cex.axis = .8)
lines(ts_year_gva, uk_ts_gva, type = 'l', col = "blue")
lines(ts_year_gva, us_ts_gva, type = 'l', col = "black")
lines(ts_year_gva, kr_ts_gva, type = 'o', col = "orange")
lines(ts_year_gva, cn_ts_gva, type = 'b', col = "brown")
legend("topleft", countries, col = color, pch = c(1,1,1,1,1), cex = .8)


### Boxplot
boxp_gva_int = boxplot(uk_ts_gva, br_ts_gva, us_ts_gva, kr_ts_gva, cn_ts_gva, names = countries, main = "International GVA Comparision", 
                       ylab = "Billions of current euros",
                       cex.axis = .8, axes = FALSE)

axis(side = 1, at= c(1,2,3,4,5), labels = countries, cex.axis = .8)
axis(side = 2, at= c(0, 200000, 400000, 600000, 700000), labels = c("0", "200", "400",
                                                                            "600", "700"), cex.axis = .8)

### Pie
slices_gva = c(85746, 71243, 682883, 111103, 639963)
pct_gva <- round(slices_gva/sum(slices_gva)*100)
countries_pie_gva <- paste(countries, pct_gva) # add percents to labels
countries_pie_gva <- paste(countries_pie_gva,"%",sep="") # ad % to labels
pie_gva = pie(slices_gva,labels = countries_pie_gva, main="International GVA - 2014") 

x1995 = c(uk_ts_gva[1], br_ts_gva[1], us_ts_gva[1], kr_ts_gva[1], cn_ts_gva[1]) 
x2014 = c(uk_ts_gva[20], br_ts_gva[20], us_ts_gva[20], kr_ts_gva[20], cn_ts_gva[20]) 
var = (x2014 - x1995) / x1995

gva_summary = data.frame(x1995, x2014, var, row.names = countries)
