test_that("date_range enumerates days", {
  now <- as.Date(Sys.time())
  four_days_ago <- as.Date(strdate("4 days ago"))
  range <- date_range("4 days ago", "now")
  expect_equal(range, seq.Date(four_days_ago, now, by = "1 day"))
})
