#'  Extract substrings from a Spark DataFrame's column.
#'
#' @description str_sub will recycle all arguments to be the same length as the longest argument. If any arguments are of length 0, the output will be a zero length character vector.
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param start,end Two integer vectors that give the position of the first character (defaults to first) and the last (defaults to last character), respectively.
#'
#' Negative values count backwards from the last character.
#'
#' @details Substrings are inclusive - they include the characters at both start and end positions. `spark_str_sub(string, 1, -1)` will return the complete substring, from the first character to the last.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_sub(iris_tbl, 'Species', 1, 3)

spark_str_sub = function(base, column, start = 1L, end = -1L){

  start = start
  end = end

  library(dplyr)

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      stringr::str_sub(row[[column]], context$start, context$end)

    }, context = list(start = start, end = end)) %>%

    sdf_bind_cols(base, .)

}
