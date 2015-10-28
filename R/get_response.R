get_response <- function(type, ts=Sys.time()) {
  if (!type %in% c("current", "next", "previous", "last", "start-chain")) {
    stop("Unsupported beacon service operation")
  }
  op <- ifelse(type == "current", "/", paste0(type,"/"))
  if(!is.integer(ts) &
     !inherits(ts, "POSIXct") &
     !inherits(ts, "POSIXlt")) {
    stop("We expected a unix timestamp as an integer or a POSIXct or POSIXlt value")
  }
  endpoint <- paste0(BEACON_URL, op, ifelse(type=="last", "", ts))
  headers <- basicTextGatherer()  # might be a good idea to use this to check the HTTP status code
  response <- getURI(endpoint, headerfunction=headers$update)
  parsed_header <- parseHTTPHeader(headers$value())
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


