#' `read_markdown()`
#'
#' @param markdown a Markdown table
#' @param lower_header an optional argument controlling whether or not the header should be lowercase 
#'
#' @returns a data.frame
#' @export
#'
#' @examples
#' # define table
#' markdown<-"
#' fruit| price
#' -----|-----
#' apple|2.05
#' pear|1.37
#' orange|3.09
#' "
#' 
#' # read table
#' read_markdown(markdown)
#' @importFrom utils read.delim
#' @importFrom stats setNames
read_markdown<-function(markdown,lower_header=TRUE){
  
  markdown |>
    (\(x) readLines(textConnection(x)))() |>
    (\(x) if(x[1]!='') { c('',x)} else { x })() |>
    (\(x) read.delim(text=x,sep='|',strip.white=TRUE,skip=2))() |>
    (\(x) if(sum(is.na(x[,1]))==nrow(x)&sum(is.na(x[,ncol(x)]))==nrow(x)) {
      x[,2:(ncol(x)-1)]
    } else {
      x
    })() |>
    setNames(
      markdown |>
        (\(x) readLines(textConnection(x),n=3))() |>
        (\(x) x[x!=''][1])() |>
        (\(x) gsub('^\\s*\\|','',x))() |>
        (\(x) gsub('\\|\\s*$','',x))() |>
        (\(x) strsplit(x,split='|',fixed=TRUE)[[1]])() |>
        trimws() |>
        (\(x) if(lower_header){ tolower(x) } else {x} )()
    )
  
}