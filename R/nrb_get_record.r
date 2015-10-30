#' Gets the NIST beacon record for a given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return An nrb_response object
#' @examples
#' ts <- as.POSIXct("2014-01-01 12:00:00", tz="UTC")
#' nrb_get_record(ts)
#' @export

nrb_get_record = function(ts) {
  nrb_get_response("record", ts)
}
