local({r <- getOption("repos")
r["CRAN"] <- "https://cran.microsoft.com/snapshot/2019-04-15/" 
options(repos=r)
})

library(tidyverse)
library(yfinance)

BERT$UsePackage("NPS", "nps", pattern="nps" );
BERT$UsePackage("yfinance", "yf")


# YFINANCE FUNCTIONS
get_last_price <- function(ticker) {
  yfinance::get_price(ticker)$postMarketPrice
}

get_market_cap <- function(ticker) {
  yfinance::get_price(ticker)$marketCap
}

get_volume <- function(ticker) {
  yfinance::get_price(ticker)$regularMarketVolume
}

get_industry <- function(ticker) {
  yfinance::get_summaries(ticker)$industry
}

get_sector <- function(ticker) {
  yfinance::get_summaries(ticker)$sector
}

get_summary <- function(ticker){
  yfinance::get_summaries(ticker)$longBusinessSummary
}


select <- function(data, columns) {
  range.to.data.frame(rng = data, headers = TRUE) %>% 
    as_tibble %>% 
    dplyr::select(columns)
}