#' Gets the last beacon response
#'
#' @return An nrb_response object
#' @examples
#' nrb_get_last()
#' @export

nrb_get_last <- function() {
  nrb_get_response("last")
}
