#' nistrb: A package to access the NIST Randomness Beacon Service
#'
#' This package implements interfaces to access the NIST Randomness Beacon
#' through its REST web service API. The beacon is currently at
#' https://beacon.nist.gov/home, and its implementation is documented at
#' http://www.nist.gov/itl/csd/ct/nist_beacon.cfm
#'
#' The service returns an XML document with several pieces of information:
#' \itemize {
#'    \item {The (seed) value represented as a 64 byte (512-bit) hex string value, and its timestamp}
#'    \item {The SHA-512 hash value for the previous record as a 64 byte hex string}
#'    \item {A digital signature (RSA) computed over (in order): version, frequency, timeStamp, seedValue, previousHashValue, errorCode. Note: Except for version, the hash is on the byte representations and not the string representations of the data values}
#'    \item {The SHA-512 hash of the signature as a 64 byte hex string}
#'    \item {The service version and its update frequency}
#'    \item {The status of the response}
#' }
#'
#' @docType package
#' @name nistrb
NULL
#> NULL
