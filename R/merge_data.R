merge_data <- function(oecd, wdi) {
  # merge
  final_dataset <- inner_join(oecd, wdi, by = "iso3c")
  
  # save dataset
  write_csv(final_dataset, "data/final/merged_dataset.csv")
  
  return("data/final/merged_dataset.csv")
}