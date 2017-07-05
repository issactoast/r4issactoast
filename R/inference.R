#' Method of Moments Estimator for gamma dist.
#'
#' mom_gamma function will calculate mom estimate for the shape parameter
#' "k" and the scale parameter "theta" by using given sample.
#'
#' @param sample_g the given sample to calculate the estimate of the parameters.
#' @return A 2 by 1 vector containing estimate of parameters k and theta: c(k, theta)
#' @examples
#'   my_sample <- rgamma(50, shape = 2, scale = 3)
#'   mom_gamma(my_sample)
#' @export
mom_gamma <- function(sample_g){
    x_bar  <- mean(sample_g)
    x2_bar <- mean(sample_g^2)

    mom_theta <- (x2_bar - x_bar^2) / x_bar
    mom_k <- x_bar / mom_theta

    c(k_hat = mom_k, theta_hat = mom_theta)
}
