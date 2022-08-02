#'  Truncate a character string from a Spark DataFrame's column.
#'
#' @description Truncate a character string in a Spark DataFrame's column.
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param width Maximum width of string.
#' @param side,ellipsis Location and content of ellipsis that indicates content has been removed.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_trunc(iris_tbl, 'Species', 5, 'right', '...')


spark_str_trunc = function(base, column, width, side = c("right", "left", "center"), ellipsis = "..."){

  library(dplyr)

  width = width
  side = side
  ellipsis = ellipsis

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      stringr::str_trunc(row[[column]], context$width, context$side, context$ellipsis)

    }, context = list(width = width, side = side, ellipsis = ellipsis)) %>%

    sdf_bind_cols(base, .)

}
