
#' Brazil: Prevalence of undernourishment (% of population)
#' ----------------------------------------------------------------------------
#' 
#' Data From:
#' https://www.quandl.com/data/WORLDBANK/BRA_SN_ITK_DEFC_ZS-Brazil-Prevalence-of-undernourishment-of-population#' 
#' -----------
#' DESCRIPTION
#' -----------
#' 
#' Food and Agriculture Organization, 
#' The State of Food Insecurity in the World 
#' (http://www.fao.org/publications/sofi/food-security-indicators/en/). 
#' Prevalence of undernourishment (% of population) 
#'
#' VALIDATE:
#' http://api.worldbank.org/countries/BRA/indicators/SN.ITK.DEFC.ZS?per_page=1000#' 
#' 
#' PERMALINK:
#' https://www.quandl.com/data/WORLDBANK/BRA_SN_ITK_DEFC_ZS#' 
#' ----------------------------------------------------------------------------

# signup at www.quandl.com and get you API KEY
# if not installed,
# install.packages('Quandl')

# I, personally, set the API Key as an environment variable
# So its not shared in text files 

# Sys.setenv(QUANDL_API_AUTH='your Quandl API Key Token')

library(ggplot2)
library(dplyr)
library(Quandl)

d <- Quandl("WORLDBANK/BRA_SN_ITK_DEFC_ZS", 
            authcode = Sys.getenv('QUANDL_API_AUTH'), 
            collapse = "annual", 
            trim_start = "1992-12-15", 
            trim_end   = "2013-02-08")
 
head(d)
#Date Value
#1 2012-12-31   6.9
#2 2011-12-31   6.8
#3 2010-12-31   7.1
#4 2009-12-31   7.5
#5 2008-12-31   8.1
#6 2007-12-31   8.4
str(d)
#'data.frame':  21 obs. of  2 variables:
#  $ Date : Date, format: "2012-12-31" "2011-12-31" "2010-12-31" ...
#  $ Value: num  6.9 6.8 7.1 7.5 8.1 8.4 8.9 8.9 9.1 10 ...

p1 <- ggplot(d, aes(x=Date, y=Value)) +
  geom_point(size = 6, colour='blue') + 
  stat_smooth() +
  xlab('Data (ano)') +
  ylab('Variação da taxa de desemprego (%/tempo)') +
  ggtitle('Brazil: Employment in industry (% of total employment)')

p1
