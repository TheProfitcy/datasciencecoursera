install.packages("lubridate")
install.packages("zoo")
install.packages("xts")
install.packages("Quandl")

require(Quandl)
require(lubridate)
require(zoo)
require(xts)

myData <- load(url("http://bit.ly/dasi_gss_data"))
myData <- myData

year <- gss$year
finSat <- gss$satfin

relativeTable <- data.frame(year, finSat)
relativeTable <- subset(relativeTable, year > "1988" & !is.na(finSat))


spReturns <- Quandl("SANDP/ANNRETS", trim_start="1970-01-11", 
                    trim_end="2012-12-31", authcode="nwy3a_Gmd7TSS9fVirxT", 
                    collapse="annual")

percentChange <- spReturns$"Total Return Change"

spReturns$"Year Ending" <- format((spReturns$"Year Ending"), "%Y")
spReturns$"Year Ending" <- as.numeric(spReturns$"Year Ending")
spReturns$"Year Ending" <- spReturns[,1] + 1 #the following year

