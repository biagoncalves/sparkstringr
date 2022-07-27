#'  The width of string in a Spark DataFrame's column.
#'
#' @description The width of string (i.e. number of code points, which generally equals the number of characters) in a Spark DataFrame's column.
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_length(iris_tbl, 'Species')

spark_str_length = function(base, column){

  library(dplyr)

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row) stringr::str_length(row[[column]])) %>%

    sdf_bind_cols(base, .)

}
