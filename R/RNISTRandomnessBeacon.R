#' RNISTRandomnessBeacon: A package to access the NIST Randomness Beacon Service
#'
#' This package implements interfaces to access the NIST Randomness Beacon
#' through its REST web service API. The beacon is currently at
#' https://beacon.nist.gov/home, and its impelementation is documented at
#' http://www.nist.gov/itl/csd/ct/nist_beacon.cfm
#'
#'
#' @docType package
#' @name RNISTRandomnessBeacon
NULL
#> NULL
require(RCurl)
require(XML)
