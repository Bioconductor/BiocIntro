library(cgdsr)
q()
read_csv("extdata/airway_colData.csv")
library(tidyverse)
read_csv("extdata/airway_colData.csv")
read_csv("extdata/airway_colData.csv")
read_csv("extdata/airway_colData.csv")
exprs = read_csv("extdata/airway_counts.csv")
exprs
gather(exprs, "Run", "Count", -1)
exprs = gather(exprs, "Run", "Count", -1)
exprs
exprs %>% group_by(Run) %>% count()
exprs %>% group_by(Run) %>% summarize(mean(Expression))
exprs %>% group_by(Run) %>% summarize(mean(Count))
exprs %>% group_by(Run) %>% summarize(sum(Count))
exprs %>% group_by(Gene) %>% summarize(sum(Count))
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% range()
library(magrittr)
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% range()
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% range(na.rm=TRUE)
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% Count %>% range(na.rm=TRUE)
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% Count %>% hist()
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% Count %>% hist(1 + .)
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% Count + 1 %>% hist()
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% Count %>% log(hist())
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) %$% Count %>% log() %>% hist()
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count))
exprs %>% group_by(Gene) %>% summarize(Count=sum(Count)) -> xx
xx
ggplot(xx aes(Count)) + geom_boxplot()
ggplot(xx, aes(Count)) + geom_boxplot()
ggplot(xx aes(y=Count)) + geom_boxplot()
ggplot(xx, aes(y=Count)) + geom_boxplot()
ggplot(xx, aes(y=Count)) + geom_boxplot()
ggplot(xx, aes(x=Gene, y=Count)) + geom_boxplot()
ggplot(xx) + geom_boxplot(count)
ggplot(xx) + geom_boxplot(aes(Count)
)
xx
ggplot(xx, aes(y=count)) + geom_density()
ggplot(xx, aes(y=Count)) + geom_density()
ggplot(xx, aes(x=Count)) + geom_density()
ggplot(xx, aes(x=Count)) + geom_density() + scale_x_log10()
ggplot(xx, aes(x=1 + Count)) + geom_density() + scale_x_log10()
csv
pdata = read_csv("extdata/airway_colData.csv")
pdata
exprs
left_join(pdata, exprs)
all = left_join(pdata, exprs)
all %>% group_by(Gene) %>% summarize(A = mean(Count), M = mean(Count[dex == "untrt"]) - mean(Count[dex == "trt"]))
MA = all %>% group_by(Gene) %>% summarize(A = mean(Count), M = mean(Count[dex == "untrt"]) - mean(Count[dex == "trt"]))
ggplot(MA, aes(A, M)) + geom_point()
ggplot(MA, aes(A, M)) + geom_point() + scale_x_log10()
ggplot(MA, aes(A, M)) + geom_point() + scale_x_log10() + scale_y_log10()
MA = all %>% group_by(Gene) %>% mutate(Count = log10(1 + Count) %>% summarize(A = mean(Count), M = mean(Count[dex == "untrt"]) - mean(Count[dex == "trt"]))
MA = all %>% group_by(Gene) %>% mutate(Count = log10(1 + Count)) %>% summarize(A = mean(Count), M = mean(Count[dex == "untrt"]) - mean(Count[dex == "trt"]))
MA
ggplot(MA, aes(A, M)) + geom_point() + scale_x_log10() + scale_y_log10()
ggplot(MA, aes(A, M)) + geom_point()
ggplot(MA, aes(A, M)) + geom_point() + geom_abline(slope=0, intercept=1)
ggplot(MA, aes(A, M)) + geom_point() + geom_abline(slope=0, intercept=0)
ggplot(MA, aes(A, M)) + geom_point() + geom_abline(slope=0, intercept=0, color="red")
MA = all %>% group_by(Gene) %>% mutate(Count = log2(1 + Count)) %>% summarize(A = mean(Count), M = mean(Count[dex == "untrt"]) - mean(Count[dex == "trt"]))
ggplot(MA, aes(A, M)) + geom_point() + geom_abline(slope=0, intercept=0, color="red")
q()
suppressPackageStartupMessages({
library(tidyverse)
library(magrittr)
})
suppressPackageStartupMessages({
library(tidyverse)
library(magrittr)
})
pdata <- read_csv("extdata/ALL-phenoData.csv")
exprs <- read_csv("extdata/ALL-expression.csv")
exprs <- read_csv("extdata/ALL-expression.csv")
exprs %<>% gather("Sample", "Expression", -Gene)
mdstbl <-
function(data, id, key, value)
mdstbl <-
function(data, id, key, value)
{
stopifnot(
is.character(id), length(id) == 1, nzchar(id),
id %in% names(data),
is.character(key),  length(key) == 1, nzchar(key),
key %in% names(data),
is.character(value),  length(value) == 1, nzchar(value),
value %in% names(data)
)
## from tibble to classic data structures...
classic <- exprs %>% spread(key, value)
df <- classic %>% select(-starts_with(id)) %>% as.data.frame()
rownames(df) <- classic[[id]]
## MDS
cmd <- cmdscale(dist(as.matrix(df)))
## ... and back to tibble
cmd %<>% as.data.frame() %>% rownames_to_column(id) %>% as_tibble()
cmd
}
mdstbl
mdstbl <-
function(data, id, key, value)
{
stopifnot(
is.character(id), length(id) == 1, nzchar(id),
id %in% names(data),
is.character(key),  length(key) == 1, nzchar(key),
key %in% names(data),
is.character(value),  length(value) == 1, nzchar(value),
value %in% names(data)
)
## from tibble to classic data structures...
classic <- exprs %>% spread(key, value)
df <- classic %>% select(-starts_with(id)) %>% as.data.frame()
rownames(df) <- classic[[id]]
## MDS
cmd <- cmdscale(dist(as.matrix(df)))
## ... and back to tibble
cmd %<>% as.data.frame() %>% rownames_to_column(id) %>% as_tibble()
cmd
}
names(exprs)
setdiff(c("Sample", "Gene", "Expression"), names(exprs))
length(setdiff(c("Sample", "Gene", "Expression"), names(exprs))) == 0
mdstbl <-
function(data, id, key, value)
{
stopifnot(
is.character(id), length(id) == 1, nzchar(id),
is.character(key),  length(key) == 1, nzchar(key),
is.character(value),  length(value) == 1, nzchar(value),
length(setdiff(c(id, key, value), names(data))) == 0
)
## from tibble to classic data structures...
classic <- exprs %>% spread(key, value)
df <- classic %>% select(-starts_with(id)) %>% as.data.frame()
rownames(df) <- classic[[id]]
## MDS
cmd <- cmdscale(dist(as.matrix(df)))
## ... and back to tibble
cmd %<>% as.data.frame() %>% rownames_to_column(id) %>% as_tibble()
cmd
}
exprs %>% mdstbl("Sample", "Sample", "Sample")
debugonce(mdstbl)
exprs %>% mdstbl("Sample", "Sample", "Sample")
setdiff(c(id, key, value), names(data))
setdiff("Sample", names(data))
setequal(c(id, key, value), names(data))
mdstbl <-
function(data, id, key, value)
{
stopifnot(
is.character(id), length(id) == 1, nzchar(id),
is.character(key),  length(key) == 1, nzchar(key),
is.character(value),  length(value) == 1, nzchar(value),
setequal(c(id, key, value), names(data))
)
## from tibble to classic data structures...
classic <- exprs %>% spread(key, value)
df <- classic %>% select(-starts_with(id)) %>% as.data.frame()
rownames(df) <- classic[[id]]
## MDS
cmd <- cmdscale(dist(as.matrix(df)))
## ... and back to tibble
cmd %<>% as.data.frame() %>% rownames_to_column(id) %>% as_tibble()
cmd
}
debugonce(mdstbl)
exprs %>% mdstbl("Sample", "Sample", "Sample")
exprs %>% mdstbl("Sample", "Gene", "Expression")
f0 <- function(n) {
x <- 1:n
sum(sqrt(x))
}
f0(10)
f1 <- function(n) {
x <- 1:n
result <- 0
for (i in 1:n) {
result <- result + sqrt(x[i])
}
result
}
f1(10)
n = 10; identical(f0(n), f1(n))
f2 <- function(n) {
sqrt_x <- numeric()
for (i in 1:n)
sqrt_x <- c(sqrt_x, sqrt(i))
##    sqrt_x[i] <- sqrt(i)
sum(sqrt_x)
}
f2(10)
n = 10; identical(f0(n), f2(n))
f2(10)
f2(100)
f2(1000)
f2(10000)
f2(10000)
f2(10000)
f2(10000)
f0(10000)
n = 10000
system.time(f0(n))
system.time(f2(n))
n = 100000
system.time(f0(n))
system.time(f2(n))
f3 <- function(n) {
sqrt_x <- sapply(1:n, function(i) sqrt(i))
sum(sqrt_x)
}
n = 10; identical(f0(n), f3(n))
n = 10000
system.time(f3(n))
n = 100000
system.time(f3(n))
f0
f0(10)
f0(2)
f0(1)
f0(0)
1:0
seq_len(10)
seq_len(1)
seq_len(-)
seq_len(0)
f4 <- function(n) {
x <- seq_len(n)
sum(sqrt(x))
}
f4(0)
f4(10)
identical(f0(10), f4(10))
n = 100000
system.time(f0(n))
system.time(f4(n))
savehistory("~/BiocIntro/vignettes/history-day-5.R")
