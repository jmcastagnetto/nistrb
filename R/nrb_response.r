#' A class representing the NIST Randomness Beacon response
#'
#' @param response The raw XML response from the service
#' @return An nrb_response object
#' @export

nrb_response <- function (response) {
  doc <- XML::xmlParse(response, asText=TRUE)
  # code for future use, at the moment their response does not validate
  # against their own schema
#   xsd <- XML::xmlSchemaParse("misc/beacon-0.1.0.xsd")
#   valid <- XML::xmlSchemaValidate(xsd, xml)
#   if (valid$status != 0) {
#     cat(response)
#     str(valid$errors)
#     stop("The NIST Randomness Beacon response does not validate against its XSD!")
#   }
  beacon <- structure(
              as.data.frame(XML::xmlToList(doc), stringsAsFactors = FALSE),
              class="nrb_response")
  beacon$frequency <- as.integer(beacon$frequency)
  beacon$timeStamp <- as.integer(beacon$timeStamp)
  beacon$statusCode <- as.integer(beacon$statusCode)
  beacon$statusDesc <- with (
    beacon,
    if (statusCode == 0) {  # values from the published XSD
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
