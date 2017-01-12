# Introduction to _R_

This is a course introducing the _[R][]_ programming language for
statistical analysis.  The course is meant for beginners; there are no
prerequisites. You MUST bring a laptop with WiFi access. You must be
able to install software on your laptop. There are five one-hour
sessions, from 4 to 5 pm on January 9, 10, 11, 12, 13. Participants
are expected to attend the majority of sessions. All sessions are in
the Gaylord-Cary Meeting Room of the Research Studies Center [map][].

The instructors are Martin Morgan, Nitesh Turaga, Lori Shepherd, Yubo Cheng.

Registration closed.

## Day 1: Installation

Notes: [Installation instructions][]

Day 1 ensures that all participants have a working installation of
_[R][]_ and _[RStudio][]_. Remember to bring your WiFi-enabled
laptop. This session will not involve instruction, but will instead
involve instructors helping participants to download and install
relevant software. Instructions are available at the following links;
try to install the software yourself, and come to this session if you
need further help.

- [Download and Install R][]
- [Download and Install RStudio][]

We also briefly introduces

- Using _RStudio_
- Functions and help pages
- Scripts

## Day 2: Using _R_

Notes: [Using _RStudio_ and _R_][]

Day 2 introduces the basics of _RStudio_ and _R_.

- Using _RStudio_
- Vectors and lists
- Classes: data.frames and beyond
- Help!

## Day 3: Data import and manipulation

Download: [BRFSS-subset.csv][] and [ALL-phenoData.csv][] (e.g.,
right-click and "Save as..."  `ALL-phenoData.csv`)
<br />Notes: [Data import and manipulation][]

Day 3 inputs and manipulates two data sets. The first is a subset of
data collected by the CDC through its extensive Behavioral Risk Factor
Surveillance System ([BRFSS][]) telephone survey. The second is a
small data set describing 128 patients from a classic microarray
experiment.

- `read.csv()` and other _R_ functions for data input.
- Introspection -- `class()`, `dim()`, `head()`, `summary()`.
- Subsetting -- `[`, `subset()`, `is.na()`, `%in%`; `$` and `[[`.
- `table()`, `with()`, `aggregate()`, 
- Descriptive and basic statistics: `length()`, `mean()`, `median()`,
  `t.test()`.
- 'Formula' notation
- Visualization: `plot()`, `boxplot()`, `hist()`
- Working with factors: `levels()`, `droplevels()`.

## Day 4: Statistics

Download: [BRFSS-subset.csv][], [ALL-phenoData.csv][], and
[ALL-expression.csv][] (e.g., right-click and "Save as..."
`ALL-phenoData.csv`)
<br />Notes: [Statistics][]

Day 4 introduces _R_ facilities for univariate and multivariate
statistical analysis. We continue to use the microarray experiment
data to illustrate these concepts.

- Data cleaning -- `factor()`, `as.matrix()`, `t()`
- Summarizing / exploration -- `summary()`, `mean()`, `plot()`, `hist()`, ...
- Univariate -- `t.test()`, `chisq.test()`, `lm()`, ...
- Clustering -- `dist()`, `cmdscale()` (multi-dimensional scaling)
- Packages -- `library()`

## Day 5: Visualization

Day 5 introduces two approaches to visualizing data -- base _R_
graphics, and [ggplot2][]

- Base _R_'s `plot()` and friends
- [ggplot2][] grammar of graphics

[Installation instructions]: https://github.com/Bioconductor/BiocIntro/blob/R-Intro-RPCI-Jan-2017/vignettes/A1_Installation.Rmd
[Using _RStudio_ and _R_]: https://github.com/Bioconductor/BiocIntro/blob/R-Intro-RPCI-Jan-2017/vignettes/A2_Using_R.Rmd
[Data import and manipulation]: https://github.com/Bioconductor/BiocIntro/blob/R-Intro-RPCI-Jan-2017/vignettes/A3_IO.Rmd
[Statistics]: https://github.com/Bioconductor/BiocIntro/blob/R-Intro-RPCI-Jan-2017/vignettes/A4_Statistics.Rmd

[BRFSS]: http://www.cdc.gov/brfss/about/index.htm
[BRFSS-subset.csv]: https://raw.githubusercontent.com/Bioconductor/BiocIntro/master/inst/extdata/BRFSS-subset.csv
[ALL-phenoData.csv]: https://raw.githubusercontent.com/Bioconductor/BiocIntro/R-Intro-RPCI-Jan-2017/inst/extdata/ALL-phenoData.csv
[ALL-expression.csv]: https://raw.githubusercontent.com/Bioconductor/BiocIntro/R-Intro-RPCI-Jan-2017/inst/extdata/ALL-expression.csv

[map]: https://www.roswellpark.org/sites/default/files/rpci-campus-map-july-15.pdf
[R]: https://r-project.org
[RStudio]: https://rstudio.org
[Download and Install R]: https://cran.rstudio.com/
[Download and Install RStudio]: https://www.rstudio.com/products/rstudio/download/

[ggplot2]: https://cran.r-project.org/package=ggplot2
