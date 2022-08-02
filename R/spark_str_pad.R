#'  Pad a string from a Spark DataFrame's column.
#'
#' @description Pad string in a Spark DataFrame's column to constant width.
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param width Minimum width of padded strings.
#' @param side Side on which padding character is added (left, right or both).
#' @param pad Single padding character (default is a space).
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_pad(iris_tbl, 'Species', 20, 'right', 'a')

spark_str_pad = function(base, column, width, side = c("left", "right", "both"), pad = " "){

  library(dplyr)

  width = width
  side = side
  pad = pad

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      stringr::str_pad(row[[column]], context$width, context$side, context$pad)

    }, context = list(width = width, side = side, pad = pad)) %>%

    sdf_bind_cols(base, .)

}
