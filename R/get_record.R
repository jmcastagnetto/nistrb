#' Gets the NIST beacon record for a given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return A NISTBeaconResponse object
#' @examples
#' ts <- as.POSIXct("2014-01-01 12:00:00", tz="UTC")
#' get_record(ts)

get_record = function(ts) {
  get_response("record", ts)
}
