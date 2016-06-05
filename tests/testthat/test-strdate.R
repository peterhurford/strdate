describe("it can parse every format in the world", {
  grid <- expand.grid(1:10, c("day", "days", "second", "secs", "minutes", "month", "years", "eons"), c("+", "-"))
  apply(grid, 1, function(row) {
    string <- sprintf("%s %s %s", row[1], row[2], if (row[3] == "+") "from now" else "ago")
    list2env(legal_unit_number_pair(normalize_unit(row[2]), as.integer(row[1])), environment())
    test_that(paste("parse", string), {
      expect_equal(strdate(string),
        getFunction(row[3])(Sys.time(), as.difftime(number, units = unit)), tolerance = 0.1)
    })
  })
})
