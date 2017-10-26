### Model noli - GERD
source("./R/gerd.R")
model_gerd = ts_gerd * .20
plot_gebr = plot(ts_year, ts_gerd, type = 'l', col = "blue",
                 main = "Brazilian GERD Expenditures", ylab = euro_lab, 
                 xlab = "Years", ylim = c(0, 30000), xlim = c(2000, 2013))
lines(ts_year, model_gerd, type = 'b', col = "red")
legend("topleft", c("LI", "noLI"), col = color, pch = c(1,1,1,1,1))


### Model noli - GVA
source("./R/gva.R")
model_gva = br_ts_gva * .25
plot_gvaint = plot(ts_year_gva, br_ts_gva, type = 'l', col = "blue",
                   main = "International GVA", cex.axis=0.8, 
                   ylab = euro_lab, xlab = "Years", 
                   xlim=c(1995, 2015), ylim = c(4000, 80000))
lines(ts_year_gva, model_gva, type = 'b', col = "red")
legend("topleft", c("LI", "noLI"), col = color, pch = c(1,1,1,1,1))

### Model noli - GVA
source("./R/emp.R")
model_emp = br_ts_emp * .70
plot_empint = plot(ts_year_emp, br_ts_emp, type = 'l', col = "blue",
                   main = "International emp", cex.axis=0.8, ylab = "100 persons", xlab = "Years", ylim = c(0, 1500), xlim=c(2000, 2015))
lines(ts_year_emp, model_emp, type = 'b', col = "red")
legend("topleft", c("LI", "noLI"), col = color, pch = c(1,1,1,1,1))

### Model noli - Productivity
source("./R/lab.R")
model_lab = br_ts_lab * .70
plot_labint = plot(ts_year_lab, br_ts_lab, type = 'l', col = "blue",
                   main = "International lab", cex.axis=0.8, ylab = "100 persons", xlab = "Years", ylim = c(0, 100), xlim=c(2000, 2015))
lines(ts_year_lab, model_lab, type = 'b', col = "red")
legend("topleft", c("LI", "noLI"), col = color, pch = c(1,1,1,1,1))



