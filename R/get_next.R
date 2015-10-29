#' Gets the next beacon response to the given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return A NISTBeaconResponse object
#' @examples
#' ts <- as.POSIXct("2014-01-01 12:00:00", tz="UTC")
#' get_next(ts)
#' @export

get_next = function(ts) {
  get_response("next", ts)
}
