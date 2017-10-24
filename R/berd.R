### Load data
source("./R/exploratory.R")

### Brazil Berd analysis
bba = filter(BR_BERD, definition == 'b) ICT sector (operational definition)')
bba = bba[1:2, ]
plot_bba = barplot(bba$value, main="Brazil BERD Expenditure", 
                   xlab="Years",
                   ylab="Millions of current euros",
                   names.arg = bba$year,
                   col = "red",
                   ylim = c(0, 1500)) 

### International Benchmark



### No LI effect Model  


### Forecast Model