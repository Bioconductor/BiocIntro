files <- local({
    acc <- c(es_1="SRR074398", es_2="SRR074399", tn_1="SRR074417",
             tn_2="SRR074418")
    data.frame(Treatment=sub("_.*", "", names(acc)),
               Replicate=sub(".*_", "", names(acc)),
               sra=sprintf("%s.sra", acc),
               fastq=sprintf("%s.fastq.gz", acc),
               bam=sprintf("%s.fastq.gz.subread.BAM", acc),
               row.names=acc, stringsAsFactors=FALSE)
})
