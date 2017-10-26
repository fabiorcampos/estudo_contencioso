### Load data
df = read.csv("./dataset/predict_2017_full.csv", header = TRUE, sep = ",", dec = ".", numerals = "no.loss")
sec = "A'=B'+C"
countries = c("United Kingdom", "Brazil", "United States", "South Korea", "China")
ts_year_emp = c(2000:2014)

### Filter data
emp_df = filter(df, variablecode == "EMP", 
                countrycode %in% c("BR", "UK", "US", "KR", "CN"), 
                sectorcode == sec, year %in% c(2000:2014))

emp_df = emp_df[,-c(1,2,5,6,7,8,9,10)]

### International Benchmark
int_emp = emp_df
### Brazil tseries
br_ts_emp = filter(int_emp, countrycode == "BR")
br_ts_emp = br_ts_emp$value
### uk tseries
uk_ts_emp = filter(int_emp, countrycode == "UK")
uk_ts_emp = uk_ts_emp$value
### us tseries
us_ts_emp = filter(int_emp, countrycode == "US")
us_ts_emp = us_ts_emp$value
### kr tseries
kr_ts_emp = filter(int_emp, countrycode == "KR")
kr_ts_emp = kr_ts_emp$value
### cn tseries
cn_ts_emp = filter(int_emp, countrycode == "CN")
cn_ts_emp = cn_ts_emp$value


### config plot
color = c("blue", "red", "black", "orange", "brown")
types = c('l', "b", "l", "o", "b")

plot_empint = plot(ts_year_emp, br_ts_emp, type = 'b', col = "red",
                   main = "International emp", cex.axis=0.8, ylab = "100 persons", xlab = "Years", ylim = c(500, 15000), xlim=c(2000, 2015))
lines(ts_year_emp, uk_ts_emp, type = 'l', col = "blue")
lines(ts_year_emp, us_ts_emp, type = 'l', col = "black")
lines(ts_year_emp, kr_ts_emp, type = 'o', col = "orange")
lines(ts_year_emp, cn_ts_emp, type = 'b', col = "brown")
legend("topleft", countries, col = color, pch = c(1,1,1,1,1), cex = .8)


### Boxplot
boxp_emp_int = boxplot(uk_ts_emp, br_ts_emp, us_ts_emp, kr_ts_emp, cn_ts_emp, names = countries, main = "International emp Comparision", ylab = "persons", cex = .7)

### Pie
slices_emp = c(1022, 1259, 4138, 1087, 14693)
pct_emp <- round(slices_emp/sum(slices_emp)*100)
countries_pie_emp <- paste(countries, pct_emp) # add percents to labels
countries_pie_emp <- paste(countries_pie_emp,"%",sep="") # ad % to labels
pie_emp = pie(slices_emp,labels = countries_pie_emp, main="International emp - 2014") 