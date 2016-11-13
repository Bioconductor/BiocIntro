# Introduction to _R_ / _Bioconductor_

This is part of a three-day course introducing _[R][]_ and
_[Bioconductor][]_ for the analysis and comprehension of
high-throughput genomic (sequencing, microarray, ...) data. There are
no pre-requisites. The course will be offered November 20 - 22 at
Technicon, Haifa, Isreal.

The [course web site][] includes the following _Bioconductor_
components covered by the material in this repository

## [Session 3][]: Introduction to _Bioconductor_

Introduction to Bioconductor

- Classes, methods, packages, and vignettes
- What _Bioconductor_ does (and does not!) do
- [software][], [annotation][], and [experiment data][] pacakges

Working with high-throughput sequencing data

[Session 3]: https://github.com/Bioconductor/BiocIntro/blob/Technicon-2016/vignettes/S3_Bioconductor_Intro.Rmd

## Session 4: A typical work flow

RNA-seq: Analysis and important statistical issues

- Introduction to RNA-seq
- Overview of upstream processing (non-_R_)
- Exploring statistical issues

[DESeq2][] extended lab

Time-course and other sophisticated experimental designs

## Session 6: Annotation, communication, and performance

Using 'annotation' resources to place results in biological context

- _Bioconductor_ [annotation][] packages -- `TxDb.*`, `org.*`, ...
- [AnnotationHub][]

Strategies for effectively communicating results

- visualization, report generation, and interactive applications

Writing efficient R scripts

[R]: https://r-project.org
[Bioconductor]: https://bioconductor.org
[course web site]: http://rbioc.net.technion.ac.il

[software]: https://bioconductor.org/packages/release/BiocViews.html#___Softwar
[annotation]: https://bioconductor.org/packages/release/BiocViews.html#___AnnotationData
[experiment data]: https://bioconductor.org/packages/release/BiocViews.html#___ExperimentData

[Biostrings]: https://bioconductor.org/packages/Biostrings
[GenomicRanges]: https://bioconductor.org/packages/GenomicRanges
[SummarizedExperiment]: https://bioconductor.org/packages/SummarizedExperiment
[rtracklayer]: https://bioconductor.org/packages/rtracklayer
[ShortRead]:  https://bioconductor.org/packages/ShortRead
[GenomicAlignments]: https://bioconductor.org/packages/GenomicAlignments
[VariantAnnotation]: https://bioconductor.org/packages/VariantAnnotation
[AnnotationHub]: https://bioconductor.org/packages/AnnotationHub
[DESeq2]: https://bioconductor.org/packages/DESeq2
