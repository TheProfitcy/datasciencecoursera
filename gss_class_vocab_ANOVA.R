load(url("http://bit.ly/dasi_gss_ws_cl"))
source("http://bit.ly/dasi_inference")

summary(gss)
by(gss$wordsum, gss$class, mean)
boxplot(gss$wordsum ~ gss$class)

gss_clean = na.omit(subset(gss, class == "WORKING" | class =="LOWER"))

inference(y = gss_clean$wordsum, x = gss_clean$class, est = "mean", 
          null = 0, type = "ht", alternative = "twosided", method = "theoretical")
