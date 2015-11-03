## ------------------------------------------------------------------------
library(nistrb)
ts <- as.POSIXct("2015-01-01 10:00:00", tz = "UTC")
rec <- nrb_get_record(ts)
rec

## ------------------------------------------------------------------------
prev_ts <- as.POSIXct("2015-01-01 09:59:00", tz = "UTC")
prev_rec <- nrb_get_record(prev_ts)
prev_rec$output == rec$previousOutputValue

## ------------------------------------------------------------------------
next_ts <- as.POSIXct("2015-01-01 10:01:00", tz = "UTC")
next_rec <- nrb_get_record(next_ts)
rec$output == next_rec$previousOutputValue

## ------------------------------------------------------------------------
library(nistrb)

# get the number of numeric chars in the seed
# more than a bit contrived as examples go
gen_seed <- function(timestamp) {
  rec <- nrb_get_record(timestamp)
  chrs <- strsplit(rec$seedValue, NULL)
  sum(sapply(chrs, FUN = function(x) {
      grepl(pattern = "[0-9]", x = x)
    }))
}

ts <- as.POSIXct("2015-07-28 00:00:00", tz = "UTC")
gen_seed(ts)

ts <- as.POSIXct("2014-12-25 12:00:00", tz = "UTC")
gen_seed(ts)

