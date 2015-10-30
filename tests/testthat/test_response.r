library(nistrb)

context("Service response")
ref_ts <- as.integer(1446229680)  # 2015-10-30 13:28:00

record <- nrb_get_record(ref_ts)
prev <- nrb_get_previous(ref_ts)
nxt <- nrb_get_next(ref_ts)
start <- nrb_get_start_chain(ref_ts)

test_that("Seed returned is correct for the given timestamp", {
  expect_equal(record$seedValue, "F706CDB02C2E7AFDF4753B77F092A0A12E52488B76E084EFE2AA8AFA9D9D187987760FF9F069FFB9A38FA558CD950851143ADB431E9C2DA0ED5C97F601B4A339")
})

test_that("Previous value is correct for the given timestamp", {
  expect_equal(prev$seedValue, "5D91D2E4B846423DA2B348569C055F7D8B31F3D78F4E0DAB8D8B7D57A9650A3A89C097BF508DB262BF56F40370C13DEBD1D300CBC18CB58A1D4E9D6D4EF5391D")
})

test_that("Next value is correct for the given timestamp", {
  expect_equal(nxt$seedValue, "65D6447BDA128478F3020C89FA80545049F3BD410481F570068F66984FECE80C3D9CB9E06F3EAB6F87E9419CE6662E63E25DDC573F54DDC9CF11DD33D95DC79B")
})

test_that("Start of chain is correct for the given timestamp", {
  expect_equal(start$seedValue, "87F49DB997D2EED0B4FDD93BAA4CDFCA49095AF98E54B81F2C39B5C4002EC04B8C9E31FA537E64AC35FA2F038AA80730B054CFCF371AB5584CFB4EFD293280EE")
})

test_that("Hash of the previous signature is correct for the given timestamp", {
  expect_equal(record$previousOutputValue, prev$outputValue)
})
