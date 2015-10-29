#' Pretty prints a beacon response
#'
#' @param response a NISTBeaconResponse object
#' @return A string representation of the response
#' @examples
#' response <- get_last()
#' print(response)

print.NISTBeaconResponse <- function(response) {
  if(!inherits(response, "NISTBeaconResponse")) {
    stop("An object of type NISTBeaconResponse was expected")
  }
  breakline <- function(longline) {
    lines <- gsub('(.{1,50})', '\\1\n', longline)
    lines <- gsub('\n', '\n\t\t\t', lines, fixed=TRUE)
    lines
  }
  output <- "\tNIST Randomness Beacon Response\n\t===============================\n\n"
  output <- paste0(output, "\t* version:\t", response$version, "\n")
  output <- paste0(output, "\t* frequency:\t", response$frequency, " seconds\n")
  output <- paste0(output, "\t* seed:\t\t", breakline(response$seedValue), "\n")
  output <- paste0(output, "\t* status:\t", response$statusCode, "\n")
  output <- paste0(output, "\t* timestamp:\t", as.POSIXct(response$timeStamp, origin="1970-01-01"),
                   " (", response$timeStamp,")\n")
  output <- paste0(output, "\t* output:\t", breakline(response$outputValue), "\n")
  output <- paste0(output, "\t* prev value:\t", breakline(response$previousOutputValue), "\n")
  output <- paste0(output, "\t* signature:\t", breakline(response$signatureValue), "\n")
  cat(output)
}
