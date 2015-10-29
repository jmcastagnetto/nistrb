#' Gets the previos beacon response to the given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return A NISTBeaconResponse object
#' @examples
#' ts <- as.POSIXct("2014-01-01 12:00:00", tz="UTC")
#' get_previous(ts)
#' @export


get_previous = function(ts) {
  get_response("previous", ts)
}
