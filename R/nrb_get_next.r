#' Gets the next beacon response to the given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return An nrb_response object
#' @examples
#' ts <- as.POSIXct("2014-01-01 12:00:00", tz="UTC")
#' nrb_get_next(ts)
#' @export

nrb_get_next = function(ts) {
  nrb_call_service("next", ts)
}
