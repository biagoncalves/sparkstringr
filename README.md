
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sparkstringr

<!-- badges: start -->

<!-- badges: end -->

The **sparkstringr** package provides a set of functions that allow the
use of [stringr](https://github.com/tidyverse/stringr/) functionalities
in [Spark](https://spark.apache.org/) DataFrames.

The functions are built on top of
[stringr](https://github.com/tidyverse/stringr/) main functions adapted
with the help of spark\_apply command from
[sparklyr](https://github.com/sparklyr/sparklyr) package.

The functions from [stringr](https://github.com/tidyverse/stringr/)
adapted in this package are:

  - str\_detect
  - str\_count
  - str\_sub
  - str\_extract
  - str\_match
  - str\_length
  - str\_pad
  - str\_trunc
  - str\_trim
  - str\_replace
  - str\_replace\_all (conferir)
  - str\_to\_lower
  - str\_to\_upper
  - str\_to\_title
  - str\_to\_sentence
  - str\_c
  - str\_dup
  - str\_split\_fixed
  - str\_order (conferir)

## Installation

You can install the development version of **sparkstringr** from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("biagoncalves/sparkstringr")
```

## Using sparkstringr

Functions in sparkstringr expect a Spark DataFrame and return a new
column (similar to dplyr::mutate) in the same Spark DataFrame with the
changes desired. The first arguments in all sparkstringr functions are a
Spark DataFrame and a column in the Spark DataFrame that will receive
the operations.

All functions in sparkstringr start with `spark_str_` and take `(base,
'column', ...)` as arguments. They work as follows:

  - `spark_str_detect(base, column, pattern)` detects the presence of a
    pattern match in a string:

<!-- end list -->

``` r
# spark_str_detect(iris_tbl, 'Species', 'a')
```

  - `spark_str_count(base, column, pattern)` counts the number of
    matches in a string:

<!-- end list -->

``` r
# spark_str_count(iris_tbl, 'Species', 'a')
```

  - str\_sub
  - str\_extract
  - str\_match
  - str\_length
  - str\_pad
  - str\_trunc
  - str\_trim
  - str\_replace
  - str\_replace\_all (conferir)
  - str\_to\_lower
  - str\_to\_upper
  - str\_to\_title
  - str\_to\_sentence
  - str\_c
  - str\_dup
  - str\_split\_fixed
  - str\_order (conferir)

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.
