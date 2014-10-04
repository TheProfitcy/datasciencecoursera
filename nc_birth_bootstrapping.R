load(url("http://bit.ly/dasi_nc"))
source("http://bit.ly/dasi_inference")
summary(nc)

gained_clean = na.omit(nc$gained)
n = length(gained_clean)

boot_means = rep(NA, 100)

for (i in 1:100) {
  boot_sample = sample(gained_clean, n, replace = TRUE)
  boot_means[i] = mean(boot_sample)
}

hist(boot_means)

actual_mean = mean(boot_means)
seMean = sd(boot_means) / sqrt(n)

confidenceUpper = actual_mean + 1.65 * seMean
confidenceLower = actual_mean - 1.65 * seMean

inference(nc$gained, type = "ci", method = "simulation", 
          conflevel = 0.9, est = "median", boot_method = "se")

inference(nc$fage, type = "ci", method = "simulation", 
          conflevel = 0.95, est = "mean", boot_method = "se")
          
by(nc$weight, nc$habit, mean)

inference(y = nc$weight, x = nc$habit, est = "mean", type = "ht", 
          null = 0, alternative = "twosided", method = "theoretical",
          order = c("smoker","nonsmoker"))

inference(y = nc$weight, x = nc$habit, est = "mean", type = "ci", 
          null = 0, alternative = "twosided", method = "theoretical")

youngermoms <- subset(nc, mature = "younger mom")
          