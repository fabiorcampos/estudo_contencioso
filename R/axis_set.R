### Axis set example
x <- 1:10
y <- runif(10) * 1e6

yrange <- c(0, 1e6)
ticks <- pretty(yrange)
labels <- format(ticks, big.mark=",", scientific=FALSE)

plot(y~x, yaxt="n", ylim = yrange)
axis(2, at = ticks, labels = labels, las = 1, cex.axis=0.7) 