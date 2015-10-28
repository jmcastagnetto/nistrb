#' Gets the current beacon response
#'
#' @return NISTBeaconResponse

get_current = function() {
  ts <- Sys.time()
  type <- "current"
  get_response("current", Sys.time())
}
