#' Gets the start of the chain for the given timestamp
#'
#' @param ts timestamp as a unix or POSIXct/POSIXlt value
#' @return An nrb_response object
#' @examples
#' ts <- as.POSIXct(Sys.time(), tz="UTC")
#' nrb_get_start_chain(ts)
#' @export

nrb_get_start_chain = function(ts) {
  nrb_get_response("start-chain", ts)
}
