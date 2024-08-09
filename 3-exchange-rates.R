library(httr2)

# SDMX format: https://sdmx.org/?page_id=5008
url <- "https://data-api.ecb.europa.eu/service/data/EXR/D.USD.EUR.SP00.A?format=csvdata&detail=dataonly&startPeriod=2024-08-08"

# D = daily frequency
# USD = currency being measured
# EUR = the currency against which the above currency is being measured
# SP00 = the type of exchange rates (e.g. foreign exchange reference rates)
# A = the Time series variation (e.g. average)

path <- tempfile()
download.file(url, path)

readr::read_csv(path)
