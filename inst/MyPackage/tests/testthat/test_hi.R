test_that("hi() says hi", {
    expect_true(startsWith(hi("X"), "hi "))
    expect_true(all(startsWith(hi(LETTERS), "hi ")))
})

test_that("hi() length of 'who' equals length of output", {
    x <- "X"
    expect_equal(length(x), length(hi(x)))

    x <- c("X", "Y")
    expect_equal(length(x), length(hi(x)))

    x <- character()
    expect_equal(length(x), length(hi(x)))
})

test_that("hi() obeys 'how='", {
    expect_equal("HI X", hi("x", "shout"))
    expect_equal("hi x", hi("X", "whisper"))
    expect_equal("hi Xx", hi("Xx"))
    expect_equal("hi Xx", hi("Xx", "asis"))
})

test_that("hi() checks inputs", {
    expect_error(hi(123), "is.character\\(who\\) is not TRUE")

    expect_error(
        hi("X", character()),
        "missing\\(how\\) || length\\(how\\) == 1 is not TRUE"
    )

    expect_error(
        hi("X", "Funky"),
        "'arg' should be one of \"asis\", \"shout\", \"whisper\""
    )
})
