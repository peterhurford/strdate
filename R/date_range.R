#' Enumerate a range of days starting from one time to another time.
#'
#' @param beginning character. A relative time character expression (e.g., "4 days ago").
#' @param end character. A relative time character expression (e.g., "now").
#' @importFrom checkr ensure
#' @export
date_range <- checkr::ensure(
  pre = list(beginning %is% simple_string, end %is% simple_string),
  function(beginning, end) {
    seq.Date(as.Date(strdate(beginning)), as.Date(strdate(end)), by = "1 day")
  })
