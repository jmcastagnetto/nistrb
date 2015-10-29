#' Gets the last beacon response
#'
#' @return A NISTBeaconResponse object
#' @examples
#' get_last()
#' @export

get_last <- function() {
  get_response("last")
}
