clean_oecd <- function(path) {
  # read data
  df1 <- read_csv(path)
  
  # add iso3 codes
  df1 <- df1 %>% 
    mutate(iso3c = countrycode(oecd_name, "country.name.en", "iso3c"))
  
  return(df1)
}