#' The implementation of newton's method for root finding
#'
#' mom_gamma function will calculate mom estimate for the shape parameter
#' "k" and the scale parameter "theta" by using given sample.
#'
#' @param f the function to be applied
#' @param df the first derivative of f
#' @param x_0 the initial point of algorithm
#' @param stop_criteria stopping rule
#' @param max_iter if the iteration is larger than max_iter, loop will be stopped.
#' @param left_b left bound of the solution search
#' @param right_b right bound of the solution search
#' @return the root of the function within the given bound
#' @examples
#'   x_cu <- function(x){x^3}
#'   x_sq <- function(x){3*x^2}
#'   newton_method(x_cu, x_sq, 3)
#' @export
newton_method <- function(f, df, x_0,
                          stop_criteria = .Machine$double.eps,
                          max_iter = 10^3,
                          left_b = -Inf, right_b = Inf){

    # criteria for starting point x_0
    if (left_b > x_0 | right_b < x_0){
        warning("your starting point is out of bound,
                please try point in the bounds")
        return(NA)
    }

    # variable initialization
    iters <- 0
    x_1 <- 0
    distance <- Inf

    # do while until
    # 1) x does not move
    # 2) exceed the maximun iteration
    # 3) the function value become close to zero
    while ((distance > stop_criteria) &
           (iters < max_iter) &
           (abs(f(x_0)) > stop_criteria)){
        # newton method
        x_1 <- x_0 - ( f(x_0) / df(x_0) )

        # out of bound case
        if (x_1 <= left_b) {
            x_1 <- left_b
        }
        if (right_b <= x_1){
            x_1 <- right_b
        }
        distance <- abs(x_0 - x_1)
        iters <- iters + 1
        x_0 <- x_1
    }

    # return the final point
    if (x_0 == left_b | x_0 == right_b){
        warning("\n", "Final point is on the boundary", "\n")
    }
    if (iters > max_iter){
        warning("\n", "Cannot find the root during the iteration.", "\n")
    }
    cat("Final value of function:", f(x_0), "\n")
    x_0
}
