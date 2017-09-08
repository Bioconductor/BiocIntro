#' @export
nrisk <- function (x, times = pretty(x$time)) 
{
    if (!is.null(x$strata)) {
        ns <- length(x$strata)
        idx <- rep.int(1:ns, x$strata)
        if (is.matrix(x$n.risk) == TRUE) {
            str.n.risk <- split(x$n.risk[, length(x$n.risk[1, 
                ])], idx)
        }
        else {
            str.n.risk <- split(x$n.risk, idx)
        }
        str.times <- split(x$time, idx)
        m <- sapply(times, function(y) {
            sapply(1:ns, function(i) {
                w <- which(str.times[[i]] >= y)[1]
                ifelse(is.na(w), 0, str.n.risk[[i]][w])
            })
        })
        rownames(m) <- names(x$strata)
        colnames(m) <- times
    }
    else {
        if (is.matrix(x$n.risk) == TRUE) {
            str.n.risk <- x$n.risk[, length(x$n.risk[1, ])]
        }
        else {
            str.n.risk <- x$n.risk
        }
        str.times <- x$time
        m <- sapply(times, function(y) {
            w <- which(str.times >= y)[1]
            ifelse(is.na(w), 0, str.n.risk[w])
        })
    }
    m
}
