#' Method of Moments Estimator for gamma dist.
#'
#' mom_gamma function will calculate mom estimate for the shape parameter
#' "k" and the scale parameter "theta" by using given sample.
#'
#' @param sample_g the given sample to calculate the estimate of the parameters.
#' @return A 2 by 1 vector containing estimate of parameters k and theta: c(k_hat, theta_hat)
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
#' Maximum Likelihood Estimator for gamma dist.
#'
#' mle_gamma function will calculate mle estimate for the shape parameter
#' "k" and the scale parameter "theta" by using given sample. Since there is no closed form of the mle for gamma distribution, mle_gamma used uniroot function from stats package.
#'
#' @param sample_g the given sample to calculate the estimate of the parameters.
#' @return A 2 by 1 vector containing estimate of parameters k and theta: c(k_hat, theta_hat)
#' @examples
#'   my_sample <- rgamma(50, shape = 2, scale = 3)
#'   mle_gamma(my_sample)
#' @importFrom stats uniroot
#' @export
mle_gamma <- function(sample_g){
    # calculate MOME as an initial value
    x_bar  <- mean(sample_g)
    x2_bar <- mean(sample_g^2)
    mom_theta <- (x2_bar - x_bar^2) / x_bar
    mom_k <- x_bar / mom_theta

    # equation for k
    f <- function(k){ mean(log(sample_g)) -
            (log(mean(sample_g)) - log(k)) - digamma(k)}
    # mle
    my_lower <- 0.5 * mom_k
    my_upper <- 2 * mom_k
    mle_k <- stats::uniroot(f,
                            lower = my_lower,
                            upper = my_upper)
    mle_theta <- mean(sample_g) * (1 / mle_k$root)

    # result
    c(k_hat = mle_k$root, theta_hat = mle_theta)
}
