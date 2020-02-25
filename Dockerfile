FROM rocker/r-base
MAINTAINER Jeff Allen <docker@trestletech.com>

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

## RUN R -e 'install.packages(c("devtools"))'
## RUN R -e 'devtools::install_github("trestletech/plumber")'
RUN install2.r plumber

RUN install2.r forecast

RUN mkdir /home/auto_arima

## RUN R -e "install.packages(c('forecast', 'plumber'), dependencies=TRUE)"
  
COPY plumber_auto_arima.R /home/auto_arima/plumber_auto_arima.R
COPY plumber.R /home/auto_arima/plumber.R

EXPOSE 8000

CMD R -e "source('/home/auto_arima/plumber.R')"