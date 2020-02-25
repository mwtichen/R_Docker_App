if(!require(plumber)){
  install.packages("plumber")
}
library(plumber)

r <- plumb("/home/auto_arima/plumber_auto_arima.R")  
r$run(host='0.0.0.0', port=8000)