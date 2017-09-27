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
library(tidyverse)
pdata = read_csv("~/extdata/ALL-phenoData.csv")
pdata
summary(pdata)
library(magrittr)
pdata %<>% mutate(sex = factor(sex))
summary(pdata)
ggplot(pdata, aes(x=sex, y=age))
ggplot(pdata, aes(x=sex, y=age)) + geom_boxplot()
pdata %>% t.test( age ~ sex, .)
?t.test
pdata %>% t.test( age ~ sex, ., var.equal=TRUE)
result = pdata %>% t.test( age ~ sex, ., var.equal=TRUE)
result
library(broom)
pdata %>% t.test( age ~ sex, ., var.equal=TRUE) %>% tidy()
pdata %>% t.test( age ~ sex, ., var.equal=TRUE) %>% tidy() %>% as_tibble()
pdata
pdata %<>% filter(mol.biol %in% c("BCR/ABL", "NEG")) %>% mutate(mol.biol = factor(mol.biol))
pdata %>% select(sex, mol.biol)
pdata %>% xtabs( ~ sex + mol.biol, . )
pdata %>% chisq.test(  sex ~  mol.biol, . )
?chisq.test
chisq.test( pdata$sex, pdata$mol.biol)
pdata %>% chisq.test(  sex ~  mol.biol, .,  )
?chisq.test.formula
?chisq.test
clean = read_csv("extdata/skcm_tcga_rna_seq_v2_mrna_median_Zscores.csv")
clean
clean %<>% mutate(SAMPLE_TYPE = factor(SAMPLE_TYPE), OS_STATUS = factor(OS_STATUS))
clean
clean %>% summary()
clean %>% xtabs( ~ SAMPLE_TYPE + OS_STATUS, .)
library(survival)
surv <- clean %>% with(Surv(OS_MONTHS, OS_STATUS == "DECEASED"))
clean %>% coxph( surv ~ CD63, . )
clean %>% coxph( surv ~ CD63, . ) %>% tidy()
clean %>% coxph( surv ~ CD9, . ) %>% tidy()
clean %>% coxph( surv ~ CD81, . ) %>% tidy()
fits <- bind_rows(
clean %>% coxph(surv ~ CD63, data = .) %>% tidy(),
clean %>% coxph(surv ~ CD9, data = .)  %>% tidy(),
clean %>% coxph(surv ~ CD81, data = .) %>% tidy()
) %>% as_tibble()
fits
library(survminer)
install.packages(survminer)
install.packages("survminer")
library(survminer)
genes <- c("CD63", "CD9", "CD81")
cutpoints <- clean %>%
mutate(OS_STATUS = OS_STATUS == "DECEASED") %>%
surv_cutpoint("OS_MONTHS", "OS_STATUS", genes)
cutpoints
cats <- cutpoints %>% surv_categorize() %>% as_tibble()
cats
surv <- cats %>% with(Surv(OS_MONTHS, OS_STATUS))
fit <- survfit(surv ~ CD81, data = cats)
fit %>% tidy()
fit
ggsurvplot(fit, conf.int=TRUE)
ggsurvplot(fit, conf.int=TRUE)
exprs = read_csv("extdata/ALL-expression.csv")
exprs
exprs %>% gather("Sample", "Expression", -1)
# cmdscale
# dist
exprs %<>% gather("Sample", "Expression", -1)
exprs %>% spread("Gene", "Expression")
d = exprs %>% spread("Gene", "Expression") %>% select(-1) %>% dist()
d
mds = d %>% cmdscale()
plot(mds)
savehistory("~/BiocIntro/vignettes/history-day-3.R")
