#' Pretty prints a beacon response
#'
#' @param x a nrb_response object
#' @param ... passed to generic print function
#' @return A string representation of the response
#' @examples
#' response <- nrb_get_last()
#' print(response)
#' @export

print.nrb_response <- function(x, ...) {
  if(!inherits(x, "nrb_response")) {
    stop("An object of type nrb_response was expected")
  }
  breakline <- function(longline) {
    lines <- gsub('(.{1,50})', '\\1\n', longline)
    lines <- gsub('\n', '\n                ', lines, fixed=TRUE)
    lines
  }
  output <- "NIST Randomness Beacon Response\n===============================\n\n"
  output <- paste0(output, "* version:      ", x$version, "\n")
  output <- paste0(output, "* frequency:    ", x$frequency, " seconds\n\n")
  output <- paste0(output, "* url:          ", x$url , "\n")
  output <- paste0(output, "* timestamp:    ", as.POSIXct(x$timeStamp,
                                                          origin = "1970-01-01",
                                                          tz = "UTC"),
                   " UTC (", x$timeStamp,")\n")
  output <- paste0(output, "* seed:         ", breakline(x$seedValue), "\n")
  output <- paste0(output, "* prev.:        ", breakline(x$previousOutputValue), "\n")
  output <- paste0(output, "* signature:    ", breakline(x$signatureValue), "\n")
  output <- paste0(output, "* output:       ", breakline(x$outputValue), "\n")
  output <- paste0(output, "* status:       ", x$statusCode , " (", x$statusDesc,")\n")
  cat(output, ...)
}

