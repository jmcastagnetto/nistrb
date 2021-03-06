% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nrb_call_service.r
\name{nrb_call_service}
\alias{nrb_call_service}
\title{Generic function that does the calling and processes the beacon's response}
\usage{
nrb_call_service(type, ts = .TS_NOW)
}
\arguments{
\item{type}{Indicates which of the beacon services is called}

\item{ts}{The timestamp to be used, by default the current one}
}
\value{
An nrb_response object
}
\description{
This functions is intended to be called by the wrapper functions
}

