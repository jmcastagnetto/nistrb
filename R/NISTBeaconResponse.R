#' A class representing the NIST Randomness Beacon response
#'
#' @param response The raw XML response from the service
#' @return A NISTBeaconResponse object

NISTBeaconResponse <- function (response) {
  require(XML)
  beacon <- structure(as.data.frame(xmlToList(xmlParse(response, asText=TRUE))),
                      class="NISTBeaconResponse")
  beacon$frequency <- as.integer(as.character(beacon$frequency))
  beacon$timeStamp <- as.integer(as.character(beacon$timeStamp))
  beacon$statusCode <- as.integer(as.character(beacon$statusCode))
  beacon
}
