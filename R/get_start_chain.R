#' Gets the start of the chain for the given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return A NISTBeaconResponse object
#' @examples
#' ts <- as.POSIXct(Sys.time(), tz="UTC")
#' get_start_chain(ts)
#' @export

get_start_chain = function(ts) {
  get_response("start-chain", ts)
}
