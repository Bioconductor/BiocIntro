## SystemRequirements: ascp; fastq-dump

source("setup.R")
library(SRAdb)
library(Rsubread)
library(Rsamtools)
library(BiocParallel)

sradb <- "SRAmetadb.sqlite"
key <- "/app/aspera-connect/3.1.1/etc/asperaweb_id_dsa.openssh"
cmd = sprintf("ascp -TT -l300m -i %s", key)
source("setup.R")

if (!file.exists(sradb))
    getSRAdbFile()
con = dbConnect(dbDriver("SQLite"), sradb)

accs <- rownames(files)[!file.exists(files$sra)]
for (acc in accs)
    sraFiles = ascpSRA(acc, con, cmd, fileType="sra", destDir=getwd())

sras <- files$sra[!file.exists(files$fastq)]
bplapply(sras, function(sra) system(sprintf("fastq-dump --gzip %s", sra)))


fastqs <- files$fastq[!file.exists(files$bam)]
if (length(fastqs))
    Rsubread::align("../mm10/mm10.Rsubread.index", fastqs,
                    nthreads=parallel::detectCores() / 2L)

bams <- files$bam[!file.exists(sprintf("%s.bai", files$bam))]
bams_sorted <- sub(".BAM", ".sorted.bam", bams)
sorted <- bpmapply(sortBam, bams, bams_sorted)
## oops! didn't mean to do the next line
file.rename(sorted, names(sorted))
bplapply(sorted, indexBam)    
