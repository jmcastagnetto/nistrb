library(nistrb)

context("Response class")

test_that("We can get an object of class nrb_response",{
  expect_is(nrb_get_last(), "nrb_response")
})
