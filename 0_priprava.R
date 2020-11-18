install.packages("rmarkdown")
install.packages("tidyverse")
install.packages("Rcpp")
install.packages("rprojroot")
install.packages("RCzechia")

library(tidyverse)
tf <- tempfile(fileext = ".zip")

download.file("https://www.gstatic.com/covid19/mobility/Region_Mobility_Report_CSVs.zip",
              destfile = tf)

writeLines(
  readLines(
    unz(tf, filename = "2020_CZ_Region_Mobility_Report.csv")
  ),
  "data-zdroje/2020_CZ_Region_Mobility_Report.csv"
)

read_csv("data-zdroje/2020_CZ_Region_Mobility_Report.csv")
