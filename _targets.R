library(targets)
library(tarchetypes)

# source all functions in R/
sapply(dir("R", full.names = TRUE), source)

# Set target-specific options such as packages.
tar_option_set(packages = c("tidyverse",
                            "rvest",
                            "WDI",
                            "countrycode"))

# End this file with a list of target objects.
list(
  tar_target(wdi_raw,
             WDI(indicator = "AG.CON.FERT.ZS") %>% as_tibble()),
  tar_target(oecd_path,
             "data/raw/oecd.csv",
             format = "file"),
  tar_target(wdi,
             wdi_raw %>% 
               rename("fert_consumption" = AG.CON.FERT.ZS) %>% 
               mutate(iso3c = countrycode(iso2c, "iso2c", "iso3c"))
  ),
  tar_target(oecd,
             read_csv(oecd_path) %>%
               mutate(iso3c = countrycode(oecd_name, "country.name.en", "iso3c"))
             ),
  tar_target(final,
             merge_data(oecd, wdi),
             format = "file"),
  tar_render(report,
             "Report.Rmd")
)
