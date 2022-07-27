#'  Detect the presence of a pattern match in a Spark DataFrame's column
#'
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param pattern A pattern that must be detected.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' spark_str_detect(iris_tbl, 'Species', 'a')

spark_str_detect = function(base, column, pattern){

  library(dplyr)

  pattern = pattern

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      stringr::str_detect(row[[column]], pattern)

    }, context = {pattern = pattern}) %>%

    sdf_bind_cols(base, .)

}
