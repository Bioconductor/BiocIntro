library(SummarizedExperiment)

exprs <- read.csv("ALL-expression.csv", row.names=1, check.names=FALSE)
exprs <- as.matrix(exprs)

pdata <- read.csv("ALL-phenoData.csv", row.names=1)
metadata <- read.csv("ALL-metadata.csv", colClasses="character")

pdata <- DataFrame(pdata)
mcols(pdata) <- metadata

ALL <- SummarizedExperiment(list(exprs=exprs), colData=pdata)

## add a new column
ALL$B_or_T <- factor(substr(ALL$BT, 1, 1))
mcols(colData(ALL))[ncol(colData(ALL)),] <-
    list("B_or_T", "B or T cell ALL? (derived from BT)")

## subset
TCellALL = ALL[, ALL$B_or_T %in% "T"]


