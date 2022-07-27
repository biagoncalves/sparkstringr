#'  Extract substrings from a Spark DataFrame's column.
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param start Integer vector that gives the position of the first character.
#' @param end Integer vector that gives the position of the last character.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_sub(iris_tbl, 'Species', 1, 3)

spark_str_sub = function(base, column, start, end){

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
