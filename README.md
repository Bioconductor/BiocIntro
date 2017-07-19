# Introduction to _R_ / _Bioconductor_

This is a condensed version of the BiocIntro course introducing _[R][]_ and _[Bioconductor][]_ for the analysis and comprehension of high-throughput genomic
(sequencing, microarray, ...) data. 

## Summary of topics:

[Installation][]

 - Windows, Mac, and Linux installation instructions for R and Rstudio.

### Introduction to R

[Introduction][] -- RStudio and R.

 - R Data types and operations: vector, list, factors
 - Classes: data.frame and beyond
 - How to get help!

[Data Input and Manipulation][].

 - Loading a file
 - Investigating an object
 - Access and manipulating data.frame object

[Statistical Analysis][].

 - Load a file
 - Descriptive Statistics
 - Cleaning data
 - Subsetting
 - Visualization
 - Basic analysis and plotting
 
[R Workflows and Visualization][].

 - Packages: what are they and how do you install them
 - Base R Graphics
 - Graphics with ggplot2

### Introduction to Bioconductor

[Bioconductor Introduction][] 

 - About
 - Package installation and use
 - S3 and S4 classes
 - Example Biostrings
 - Example workflow: high-throughput sequence analysis
 
[Bioconductor Common Operations][]

 - Core Infrastructure
    + Biostrings
    + GRanges
    + GenomicAlignments
    + SummarizedExperiment
    + Annotation Resources
 - From files to Bioconductor objects
    + rtracklayer
    + ShortRead
    + GenomicAlignments
    + VariantAnnotation
 - Exercises
    + GenomicAlignments
    + SummarizedExperiment
    + Annotaiton and GenomicFeatures
    + Annotation with Organism.dplyr
    + AnnotationHub
    + biomaRt
    
[RNASeq][] -- introduction and practical.

[ChIPSeq][] -- introduction and example workflow

[Other][]

 - Common Bioconductor workflows
 - Efficient code (See also [Robust and Efficient Code][])
 - Parallel evaluation

[Installation]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/A0_Installation.Rmd
[Introduction]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/A1_Using_R.Rmd
[Data Input and Manipulation]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/A2_IO.Rmd
[Statistical Analysis]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/A3_Statistics.Rmd
[R Workflows and Visualization]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/A4_Graphics.Rmd

[Bioconductor Introduction]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/B1_Bioconductor_intro.Rmd
[Bioconductor Common Operations]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/B2_Common_Operations.Rmd
[RNASeq]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/B3_RNASeq_Workflow.Rmd
[ChIPSeq]: https://github.com/Bioconductor/BiocIntro/blob/OMRF-2017/vignettes/B4_ChIPSeq.Rmd
[Other]: https://github.com/Bioconductor/BiocIntro/blob/Bioc2017/vignettes/B5_Next_Steps.Rmd
[R]: https://r-project.org
[Bioconductor]: https://bioconductor.org
[Robust and Efficient Code]: http://bioconductor.org/developers/how-to/efficient-code/