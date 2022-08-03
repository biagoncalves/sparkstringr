#'  Extract matched groups from a Spark DataFrame's column.
#'
#' @description Return the first pattern match found in each string, originally as a matrix with a column for each () group in pattern. `spark_str_extract` returns the result as a Spark DataFrame's column.
#' @param base A Spark DataFrame.
#' @param column A column in the Spark DataFrame.
#' @param pattern Pattern to look for.
#' @return A new column called 'result' in the same Spark DataFrame with the changes desired upon the column given previously.
#' @examples
#' iris_tbl <- copy_to(sc, iris, overwrite = TRUE)
#'
#' spark_str_match(iris_tbl, 'Species', 'a')

spark_str_match = function(base, column, pattern){

  library(dplyr)

  pattern = pattern

  base %>%

    dplyr::select(all_of(column)) %>%

    sparklyr::spark_apply(., function(row, context){

      as.data.frame(stringr::str_match(row[[column]], pattern))

    }, context = {pattern = pattern}) %>%

    rename(result = V1) %>%

    sdf_bind_cols(base, .)

}
