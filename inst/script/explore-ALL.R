## fname <- file.choose()
fname <- "~/a/BiocIntro/inst/extdata/ALL-phenoData.csv"
pdata <- read.table(fname, header=TRUE, sep=",")
table(pdata$sex)
mean(pdata$age, na.rm=TRUE)
t.test(age ~ sex, pdata)

table(pdata$BT)
pdata$BT1 <- factor(substr(pdata$BT, 1, 1))

table(pdata$mol.biol)
keep <- pdata$mol.biol %in% c("BCR/ABL", "NEG")
table(keep)
bcrabl <- pdata[keep,]
dim(bcrabl)
xtabs(~mol.biol + BT1, bcrabl)
bcrabl$mol.biol <- factor(bcrabl$mol.biol) 
xtabs(~mol.biol + BT1, bcrabl)

fname <- "~/a/BiocIntro/inst/extdata/ALL-expression.csv"
exprs <- read.csv(fname, header=TRUE, sep=",", row.names=1, check.names=FALSE)
dim(exprs)
exprs[1:5, 1:5]
hist(rowMeans(exprs))
plot(density(rowMeans(exprs)))

cmd <- cmdscale(dist(t(exprs[, keep])))

plot(cmd, pch=20, cex=3)
plot(cmd, col=bcrabl$remission, pch=20, cex=3)
plot(cmd, col=bcrabl$mol.biol, pch=20, cex=3)
plot(cmd, col=bcrabl$BT1, pch=20, cex=3)
