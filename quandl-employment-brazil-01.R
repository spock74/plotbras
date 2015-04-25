
#' Brazil Employment/unemployment
#' ----------------------------------------------------------------------------
#' 
#' Data From:
#' https://www.quandl.com/data/WORLDBANK/BRA_SL_IND_EMPL_ZS-Brazil-Employment-in-industry-of-total-employment
#' 
#' -----------
#' DESCRIPTION
#' -----------
#' Employees are people who work for a public or private employer and receive 
#' remuneration in # wages, salary, commission, tips, piece rates, or pay in 
#' kind. Industry corresponds to # divisions 2-5 (ISIC revision 2) or 
#' tabulation categories C-F (ISIC revision 3) and includes mining and 
#' quarrying (including oil production), manufacturing, construction, 
#' and public utilities (electricity, gas, and water). Employment 
#' in industry (% of total employment)
#'
#' VALIDATE:
#' http://api.worldbank.org/countries/BRA/indicators/SL.IND.EMPL.ZS?per_page=1000
#' 
#' PERMALINK:
#' https://www.quandl.com/data/WORLDBANK/BRA_SL_IND_EMPL_ZS
#' 
#' ----------------------------------------------------------------------------

# signup at www.quandl.com and get you API KEY
# if not installed,
# install.packages('Quandl')

# I prefer, personally, set the API Key as an environment variable
# So its not shared in text files 

# Sys.setenv(QUANDL_API_AUTH='your Quandl API Key Token')

library(Quandl)

API_AUTH <- Sys.getenv('QUANDL_API_AUTH')

d <- Quandl("WORLDBANK/BRA_SL_IND_EMPL_ZS", 
            authcode = API_AUTH, 
            transformation = "rdiff", 
            collapse = "annual")

p1 <- ggplot(d, aes(x=Date, y=Value)) +
      geom_point(size = 6, colour='blue') + 
      ylim(-.5, .5) +
      stat_smooth() +
      xlab('Data (ano)') +
      ylab('Variação da taxa de desemprego (%/tempo)') +
      ggtitle('Brazil: Employment in industry (% of total employment)')
p1


