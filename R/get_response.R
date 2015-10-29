#require(RCurl)

# Base URL for NIST Randomness Beacon
BEACON_URL <- "https://beacon.nist.gov/rest/record"

# Default timestamp value
TS_NOW <- as.POSIXct(Sys.time(), tz = "UTC")

# Operations supported by the NIST Randomness Beacon
BEACON_OPS <- c("record", "next", "previous", "last", "start-chain")

#' Generic function that does the calling and processes the beacon's response
#'
#' This functions is intended to be called by the wrapper functions
#'
#' @param type Indicates which of the beacon services is called
#' @param ts The timestamp to be used, by default the current one
#' @return A NISTBeaconResponse object


get_response <- function(type, ts = TS_NOW) {
  if (!type %in% BEACON_OPS) {
    stop("Unsupported beacon service operation")
  }
  op <- ifelse(type == "record", "/", paste0("/",type,"/"))
  if(!is.integer(ts) &
     !inherits(ts, "POSIXct") &
     !inherits(ts, "POSIXlt")) {
    stop("We expected a unix timestamp as an integer or a POSIXct or POSIXlt value")
  }
  # we need to truncate the timestamp to the closest minute
  ts <- as.numeric(trunc(ts, units = "mins"))
  endpoint <- paste0(BEACON_URL, op, ifelse(type=="last", "", ts))
  # cat(endpoint)
  headers <- RCurl::basicTextGatherer()  # might be a good idea to use this to check the HTTP status code
  response <- RCurl::getURI(endpoint, headerfunction=headers$update)
  parsed_header <- RCurl::parseHTTPHeader(headers$value())
  status <- as.integer(parsed_header["status"])
  if (status == 200) {
    return(NISTBeaconResponse(response))
  } else {
    stop(paste0("NIST Beacon returned an error: ",
               status, " [",
               parsed_header["statusMessage"], "] on ",
               parsed_header["Date"]))
  }
}
