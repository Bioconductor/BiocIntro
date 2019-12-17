#' @importFrom stats median
.filtered_median <- function(x)
    median(x[is.finite(x)])

#' @title Calculate geometric mean-centered median scaled cell scaling
#'     factors.
#'
#' @description `size_factors()` centers the log counts of each row
#'     (gene) by the row mean of the log counts. The finite centered
#'     values are then used to compute column-wise geometric median
#'     scaling factors.
#'
#' @param counts matrix() of gene x cell RNA-seq counts.
#'
#' @return `size_factors()` returns a `numeric(ncol(counts))` vector
#'     of scaling factors.
#'
#' @examples
#' set.seed(123)
#' counts <- simulate()
#' size_factors <- size_factors(counts)
#' median(size_factors)      # approximately 1
#'
#' @export
size_factors <-
    function(counts)
{
    log_counts <- log(counts)
    centered <- log_counts - rowMeans(log_counts)
    exp(apply(centered, 2, .filtered_median))
}
