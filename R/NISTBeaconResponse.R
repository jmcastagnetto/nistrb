require(RCurl)
require(XML)

# Let's make a special class
NISTBeaconResponse <- function (ts) {
  if(!is.integer(ts) &
     !inherits(ts, "POSIXct") &
     !inherits(ts, "POSIXlt")) {
    stop("We expected a unix timestamp as an integer or a POSIXct or POSIXlt value")
  }
  tsval <- ifelse(inherits(ts, "POSIXct") | inherits(ts, "POSIXlt"),
                  as.integer(ts), ts)
  url <- paste0("https://beacon.nist.gov/rest/record/", tsval)
  headers <- basicTextGatherer()  # might be a good idea to use this to check the HTTP status code
  response <- getURL(url, headerfunction=headers$update)
  # use the following line instead, if you get cert validation errors
  # response <- getURL(url, .opts = list(ssl.verifypeer = FALSE), headerfunction=headers$update)
  beacon <- structure(as.data.frame(xmlToList(xmlParse(response, asText=TRUE))),
                      class="NISTBeaconResponse")
  beacon$frequency <- as.integer(as.character(beacon$frequency))
  beacon$timeStamp <- as.integer(as.character(beacon$timeStamp))
  beacon$statusCode <- as.integer(as.character(beacon$statusCode))
  beacon
}

# and a way to print it
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

# test the code
ts <- Sys.time()
beacon <- NISTBeaconResponse(as.integer(1445986260))
print(beacon)
