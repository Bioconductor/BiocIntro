# Introduction to _R_ / _Bioconductor_

This is a two-day course introducing _[R][]_ and _[Bioconductor][]_
for the analysis and comprehension of high-throughput genomic
(sequencing, microarray, ...) data. There are no pre-requisites. The
course will be offered January 21 and 22; it is open and free of charge
to students, staff, and faculty at Roswell Park Cancer Institute or
SUNY at Buffalo.

An approximate agenda is:

## Day 1: Introduction to _R_

Overview

- Commands, scripts, and literate documents
- Data input, manipulation, and visualization
- Packages
- Introduction to example data sets
- Getting help

Data input and manipulation

- Input data from text and other files
- Vectors, `data.frame`, and other _R_ data types
- Tidying data

Analysis

- Performing basic (and advanced!) statistical analyses
- Working with _R_ classes and methods

Visualization

- Base graphics for quick visualizations
- [ggplot2][] and other effective ways of visualizing data

## Day 2: Introduction to _Bioconductor_

Project overview

- Packages, methods, and vignettes
- What you can (and can't!) do: sequence analysis (RNA-seq, ChIP-seq,
  variants, ...), microarrays, flow cytometery, ...

Getting familiar with common operations

- [GenomicRanges][] for describing genome-scale data
- Annotation resources for mapping between identifiers, assigning
  pathways, describing genes, and exploring consortium and other
  genome-scale data.

A typical work flow: RNA-seq differential expression of known genes

- Introduction to RNA-seq
- Overview of upstream processing (non-_R_)
- From count matrix to differentially expressed genes

    - Statistical issues
    - Implementation using the [DESeq2][] package
    - Placing results in context

Where to now?

- Improving _R_ skills
- Working with large data
- Getting involved with the community

[R]: https://r-project.org
[Bioconductor]: https://bioconductor.org
[ggplot2]: https://cran.r-project.org/package=ggplot2
[GenomicRanges]: https://bioconductor.org/packages/GenomicRanges
[DESeq2]: https://bioconductor.org/packages/DESeq2
