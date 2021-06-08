clean_wdi <- function(df) {
  # Rename variable
  df <- df %>%
    dplyr::rename("fert_consumption" = AG.CON.FERT.ZS)

  # add iso3 codes
  df1 <- df %>% 
    mutate(iso3c = countrycode(iso2c, "iso2c", "iso3c"))
  
  # new comment for dev branch
  
  return(df1)
}