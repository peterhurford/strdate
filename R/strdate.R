#' Convert a relative time character expression into an absolute date expression.
#'
#' @param time character. The time character expression to convert.
#' @import checkr
#' @export
strdate <- checkr::ensure(pre = time %is% simple_string,
function(time) {
  if (identical(time, "now")) { return(Sys.time()) }

  # http://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/
  regex <- "[[:space:]]*([[:digit:]]+)[[:space:]]*([[:alpha:]]+)[[:space:]]*(from now|ago)[[:space:]]*"

  matches <- regexpr(regex, time, perl = TRUE, ignore.case = TRUE)
  if (matches == -1) {
    stop("testthatsome::pretend_now_is: Could not parse ",
         sQuote(time), " into a time.", call. = FALSE)
  }
  list2env(extract_time(matches, time), environment())

  number <- as.integer(number)
  unit   <- normalize_unit(tolower(unit))
  op     <- if (tolower(tense) == "from now") `+` else `-`

  list2env(legal_unit_number_pair(unit, number), environment())
  op(Sys.time(), as.difftime(number, units = unit))
})

normalize_unit <- function(unit) {
  if (substring(unit, nchar(unit)) != "s") {
    unit <- paste0(unit, "s")
  }

  if (unit == "seconds") "secs"
  else if (unit == "minutes") "mins"
  else unit
}

legal_unit_number_pair <- function(unit, number) {
  if (unit == "months") {
    unit   <- "days"
    number <- 30 * number
  } else if (unit == "years") {
    unit   <- "days"
    number <- 365 * number
  } else if (unit == "eons") {
    unit   <- "days"
    number <- 99999999 * number
  }
  list(unit = unit, number = number)
}

extract_time <- function(matches, time) {
  setNames(nm = c("number", "unit", "tense"),
    Map(substring, time, s <- attr(matches, "capture.start"),
        s + attr(matches, "capture.length") - 1))
}
