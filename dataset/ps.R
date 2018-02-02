library(MatchIt)

### Read data
df = read.csv("test.csv")

### Check
head(df)
names(df)
summary(df)

### PS 
ps.out = matchit(group ~ emp.ino + disp.ino + rh + rh_ped + rec.liq, data = df, method = "nearest", ratio = 1)

summary(ps.out)
plot(ps.out, type = "jitter")
plot(ps.out, type = "hist")

