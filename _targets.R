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
  tar_target(wdi_raw, get_wdi()),
  tar_target(oecd_path, "data/raw/oecd.csv", format = "file"),
  tar_target(wdi, clean_wdi(wdi_raw)),
  tar_target(oecd, clean_oecd(oecd_path)),
  tar_target(final, merge_data(oecd, wdi), format = "file"),
  tar_render(report, "Report.Rmd")
)