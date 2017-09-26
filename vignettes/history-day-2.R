library(cgdsr)
q()
library(tidyverse)
library(magrittr)
pdata = read_csv("~/extdata/ALL-phenoData.csv")
pdata
pdata %>% select(mol.biol)
pdata %>% group_by(mol.biol) %>% summarize(n=n())
pdata %>% filter(mol.biol %in% c("BCR/ABL", "NEG"))
pdata %>% filter(mol.biol %in% c("BCR/ABL", "NEG")) %>% mutate(mol.biol = factor(mol.biol))
pdata %<>% filter(mol.biol %in% c("BCR/ABL", "NEG")) %>% mutate(mol.biol = factor(mol.biol))
pdata
t.test( age ~ mol.biol, pdata )
pdata %>% t.test( age ~ mol.biol, . )
exprs = read_csv("~/extdata/ALL-expression.csv")
exprs
exprs %>% gather("Sample", "Expression", -1)
exprs %<>% gather("Sample", "Expression", -1)
exprs
exprs %>% group_by(Gene) %>% summarize(Expression=mean(Expression))
exprs %>% group_by(Gene) %>% summarize(Expression=mean(Expression)) %$% Expression %>% hist()
exprs
exprs %>% spread("Gene", "Expression")
exprs
pdata
pdata %>% select(Sample, sex, age, BT, mol.biol)
pdata %<>% select(Sample, sex, age, BT, mol.biol)
left_join(pdata, exprs)
## install.packages("cgdsr")
library(cgdsr)
url <- "http://www.cbioportal.org/public-portal/"
cbiop <- CGDS(url)
cbiop
getCancerStudies(cbiop)
studies <- getCancerStudies(cbiop) %>% as_tibble()
studies
View(studies)
study <- "skcm_tcga"
cases <- getCaseLists(cbiop, study) %>% as.tibble()
cases
allcases <- "skcm_tcga_all"
mRNAcases <- "skcm_tcga_rna_seq_v2_mrna"
profiles <- getGeneticProfiles(cbiop, study) %>% as.tibble()
profile = "skcm_tcga_rna_seq_v2_mrna_median_Zscores"
genes <- c('CD63', 'CD9', 'CD81')
mRNA <- getProfileData(cbiop, genes, profile, mRNAcases) %>%
rownames_to_column("id") %>% as.tibble()
mRNA
clinical <- getClinicalData(cbiop, allcases) %>%
rownames_to_column("id") %>% as.tibble()
clinical
dim(clinical)
dim(mRNA)
data <- full_join(clinical, mRNA)
data
clean <- data %>%
filter(!is.na(CD63), !is.na(CD9), !is.na(CD81)) %>%
select(
id, SAMPLE_TYPE,
OS_STATUS, OS_MONTHS,
DFS_STATUS, DFS_MONTHS,
CD63, CD9, CD81
) %>%
mutate(
SAMPLE_TYPE = factor(SAMPLE_TYPE),
OS_STATUS = factor(OS_STATUS),
DFS_STATUS = factor(DFS_STATUS)
)
clean
clean %>% summary()
clean$OS_STATUS
data$OS_STATUS
nzchar(data$OS_STATUS)
clean <- data %>%
filter(
!is.na(CD63), !is.na(CD9), !is.na(CD81),
SAMPLE_TYPE %in% c("Metastatic", "Primary Tumor"),
nzchar(OS_STATUS)
) %>%
select(
id, SAMPLE_TYPE,
OS_STATUS, OS_MONTHS,
DFS_STATUS, DFS_MONTHS,
CD63, CD9, CD81
) %>%
mutate(
SAMPLE_TYPE = factor(SAMPLE_TYPE),
OS_STATUS = factor(OS_STATUS),
DFS_STATUS = factor(DFS_STATUS)
)
clean
clean %>% summary()
savehistory("~/BiocIntro/vignettes/history-day-2.R")
