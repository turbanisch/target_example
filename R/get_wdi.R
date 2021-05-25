get_wdi <- function() {
  # Gather agricultural methane emissions data from WDI
  wdi <- WDI(indicator = "AG.CON.FERT.ZS") %>% as_tibble()
  
  return(wdi)
}