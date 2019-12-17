#' @title Simulate single-cell data
#'
#' @description `simulate()` produces a genes x cells count matrix of
#'     simulated single-cell RNA-seq data. Gene expression is modelled
#'     using a gamma distribution. Counts are simulated using a
#'     negative binomial distribution.
#'
#' @param n_genes integer(1) the number of genes (rows) to simulate.
#'
#' @param n_cells integer(1) the number of cells (columns) to simulate.
#'
#' @param rate numeric(1) rate parameter of the `rgamma()` distribution.
#'
#' @param shape numeric(1) shape parameter of the `rgamma()` distribution.
#'
#' @param dispersion numeric(1) size (`1 / dispersion`) parameter of
#'     the `rnbinom()` distribution.
#'
#' @return `simulate() returns a `n_genes x n_cells` matrix of
#'     simulated single-cell RNA-seq counts.
#'
#' @examples
#' counts <- simulate()
#' dim(counts)
#' mean(counts == 0)  # fraction of '0' cells
#' range(counts)
#'
#' @importFrom stats rgamma rnorm rnbinom
#'
#' @export
simulate <-
    function(n_genes = 20000, n_cells = 100,
             rate = 0.1, shape = 0.1, dispersion = 0.1)
{
    gene_means <- rgamma(n_genes, shape = shape, rate = rate)
    cell_size_factors <- 2 ^ rnorm(n_cells, sd = 0.5)
    cell_means <- outer(gene_means, cell_size_factors, `*`)
    matrix(
        rnbinom(n_genes * n_cells, mu = cell_means, size = 1 / dispersion),
        nrow = n_genes, ncol = n_cells
    )
}
