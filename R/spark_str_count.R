#'  Count the number of matches in a Spark DataFrame's column.
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param pattern A pattern that must be counted.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_count(iris_tbl, 'Species', 'a')

spark_str_count = function(base, column, pattern){

  library(dplyr)

  pattern = pattern

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      stringr::str_count(row[[column]], pattern)

    }, context = {pattern = pattern}) %>%

    sdf_bind_cols(base, .)

}
