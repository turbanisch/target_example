clean_oecd <- function(path) {
  # read data
  df <- read_csv(path)
  
  # add iso3 codes
  df <- df %>% 
    mutate(iso3c = countrycode(oecd_name, "country.name.en", "iso3c"))
  
  return(df)
}