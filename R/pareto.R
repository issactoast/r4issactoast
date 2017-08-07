#' The probability density function of the pareto distribution.
#'
#' dpareto function evaluates the pdf of pareto dist. at given x with parameters.
#'
#' @param x the point where the pdf to be evaluated
#' @param alpha the shape parameter of pareto dist.
#' @param x_m the scale parameter of pareto dist.
#' @param log.p use log.p = TRUE when you want
#'  to get a result in a log scale
#' @return the pdf value of the pareto dist.
#' @examples
#'   dpareto(1:5, 2, 3)
#'   dpareto(1:5, 2, -3:3)
#'   dpareto(1:5, 2:5, 3)
#' @useDynLib r4issactoast paretodens
#' @export
dpareto <- function(x, alpha, x_m, log.p = FALSE){
    if (!is.logical(log.p) || length(log.p) != 1){
        stop("bad input for argument 'log'")
    }

    input_len <- c(length(x), length(alpha), length(x_m))
    max_len <- max(input_len)

    # Input vectorizing
    density <- vector(mode="numeric", length = max_len)

    # Call .C
    result <- .C("paretodens",
                 as.double(x),
                 as.double(alpha),
                 as.double(x_m),
                 as.integer(input_len),
                 as.integer(max_len),
                 as.integer(log.p),
                 value = as.double(density),
                 PACKAGE = "r4issactoast")$value
    result
}
