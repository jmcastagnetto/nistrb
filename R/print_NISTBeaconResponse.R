#' Pretty prints a beacon response
#'
#' @param response a NISTBeaconResponse object
#' @return A string representation of the response
#' @examples
#' response <- get_last()
#' print(response)
#' @export

print.NISTBeaconResponse <- function(response, ...) {
  if(!inherits(response, "NISTBeaconResponse")) {
    stop("An object of type NISTBeaconResponse was expected")
  }
  breakline <- function(longline) {
    lines <- gsub('(.{1,50})', '\\1\n', longline)
    lines <- gsub('\n', '\n\t\t', lines, fixed=TRUE)
    lines
  }
  output <- "NIST Randomness Beacon Response\n===============================\n\n"
  output <- paste0(output, "* version:\t", response$version, "\n")
  output <- paste0(output, "* frequency:\t", response$frequency, " seconds\n")
  output <- paste0(output, "* seed:\t\t", breakline(response$seedValue), "\n")
  output <- paste0(output, "* timestamp:\t", as.POSIXct(response$timeStamp, origin="1970-01-01"),
                   " (", response$timeStamp,")\n")
  output <- paste0(output, "* output:\t", breakline(response$outputValue), "\n")
  output <- paste0(output, "* prev value:\t", breakline(response$previousOutputValue), "\n")
  output <- paste0(output, "* signature:\t", breakline(response$signatureValue), "\n")
  output <- paste0(output, "* status:\t", response$statusCode , " (", response$statusDesc,")\n")
  cat(output)
}
