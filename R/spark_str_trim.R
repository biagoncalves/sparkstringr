#'  Trim whitespace in string from a Spark DataFrame's column.
#'
#' @description Trim whitespace from start and end of string in a Spark DataFrame's column.
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param side Side on which to remove whitespace (left, right or both).
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_trim(iris_tbl, 'Species', 'right')


spark_str_trim = function(base, column, side = c("both", "left", "right")){

  library(dplyr)

  side = side

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      stringr::str_trim(row[[column]], side)

    }, context = {side = side}) %>%

    sdf_bind_cols(base, .)

}
