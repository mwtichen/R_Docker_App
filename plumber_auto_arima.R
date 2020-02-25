# plumber_auto_arima.R

if(!require(forecast)){
  install.packages("forecast")
}
library(forecast)

#* Automatically fit an ARIMA model
#* @param y the time series
#* @param f:numeric the frequency of the time series
#* @post /auto-arima
function(y, f = 12){
  y <- ts(y, frequency = f)
  model <- auto.arima(y)
  order <- arimaorder(model)
  result <- list(p = order[1],
                 d = order[2],
				 q = order[3],
				 P = order[4],
				 D = order[5],
				 Q = order[6],
				 S = order[7])
  return(result)				 
}



