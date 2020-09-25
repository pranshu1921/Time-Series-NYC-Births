# Module 5 Time Series
# Author: Pranshu Kumar

n_birth <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birth_ts <- ts(n_birth, frequency=12, start=c(1946,1))
birth_ts
plot.ts(birth_ts)

birth_comp <- decompose(birth_ts)
birth_comp$seasonal


birth_comp$trend

birth_comp$random

plot(birth_comp)
birth_comp<- decompose(birth_ts)
birth_ts_adj <- birth_ts - birth_comp$seasonal
plot(birth_ts_adj)

birth_diff <- diff(birth_ts, differences = 1)
plot.ts(birth_diff)

acf(birth_diff, lag.max=20) 
acf(birth_diff, lag.max=20, plot = FALSE)

pacf(birth_diff, lag.max = 20)
pacf(birth_diff, lag.max = 20, plot = FALSE)

library(“forecast”)
auto.arima(birth_diff, ic = "bic")

birth_forecast <- forecast(birth_arima, h = 5)
plot(birth_forecast)



