#' A class representing the NIST Randomness Beacon response
#'
#' @param response The raw XML response from the service
#' @return A NISTBeaconResponse object
#' @export

NISTBeaconResponse <- function (response) {
  #suppressMessages(require(XML))
  beacon <- structure(
              as.data.frame(
                xmlToList(xmlParse(response, asText=TRUE)),
                stringsAsFactors = FALSE),
              class="NISTBeaconResponse")
  beacon$frequency <- as.integer(beacon$frequency)
  beacon$timeStamp <- as.integer(beacon$timeStamp)
  beacon$statusCode <- as.integer(beacon$statusCode)
  beacon
}
