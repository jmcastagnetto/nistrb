#' A class representing the NIST Randomness Beacon response
#'
#' @param response The raw XML response from the service
#' @return A NISTBeaconResponse object
#' @export

NISTBeaconResponse <- function (response) {
  beacon <- structure(
              as.data.frame(
                XML::xmlToList(
                  XML::xmlParse(response, asText=TRUE)),
                stringsAsFactors = FALSE),
              class="NISTBeaconResponse")
  beacon$frequency <- as.integer(beacon$frequency)
  beacon$timeStamp <- as.integer(beacon$timeStamp)
  beacon$statusCode <- as.integer(beacon$statusCode)
  beacon$statusDesc <- with (
    beacon,
    if (statusCode == 0) {
      "Chain intact, values all good"
    } else if (statusCode == 1) {
      "Start of a new chain of values, previous hash value will be all zeroes"
    } else if (statusCode == 2) {
      "Time between values is greater than the frequency, but the chain is still intact"
    } else {
      "Unknown status code, refer to NIST Randomness Beacon documentation"
    }
  )
  beacon
}
