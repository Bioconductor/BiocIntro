## source("preprocess_NFYA.R", echo=TRUE)
source("setup.R")

library(csaw)
library(edgeR)

## ext: fragment length
system.time({
    data <- windowCounts(files$bam, width=10, ext=110)
})                                      # 156 seconds
acc <- sub(".fastq.*", "", data$bam.files)
colData(data) <- cbind(files[acc,], colData(data))

## filter low count windows
keep <- aveLogCPM(assay(data)) >= -1
data <- data[keep,]

## normalization factor
system.time({
    binned <- windowCounts(files$bam, bin=TRUE, width=10000)
})                                      #139 second
normfacs <- normalize(binned)

## Experimmental design
design <- model.matrix(~Treatment, colData(data))

## DB windows
y <- asDGEList(data, norm.factors=normfacs)
y <- estimateDisp(y, design)
fit <- glmQLFit(y, design, robust=TRUE)
results <- glmQLFTest(fit, contrast=c(0, 1))

## Correct for multiple testing
merged <- mergeWindows(rowRanges(data), tol=1000L)
tabcom <- combineTests(merged$id, results$table)
