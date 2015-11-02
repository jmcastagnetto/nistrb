## ----echo=FALSE, results='asis'------------------------------------------

df <- data.frame(
  Function = c(
    "`nrb_get_last()`",
    "`nrb_get_next(timestamp)`",
    "`nrb_get_previous(timestamp)`",
    "`nrb_get_record(timestamp)`",
    "`nrb_get_start_chain(timestamp)`"
  ),
  Endpoint = c(
    "`https://beacon.nist.gov/rest/record/last`",
    "`https://beacon.nist.gov/rest/record/next/<timestamp>`",
    "`https://beacon.nist.gov/rest/record/previous/<timestamp>`",
    "`https://beacon.nist.gov/rest/record/<timestamp>`",
    "`https://beacon.nist.gov/rest/record/start-chain/<timestamp>`"
  ),
  Description = c(
    "Last Record",
    "Next Record",
    "Previous Record",
    "Current Record (or next closest)",
    "Start Chain Record"
  )
      )

knitr::kable(df)

## ----comment=""----------------------------------------------------------
library(nistrb)
lval <- nrb_get_last()
lval
