
<!-- README.md is generated from README.Rmd. Please edit that file -->
r4issactoast
============

The goal of r4issactoast is to provide users of this package with various functions used in the posts from [issactoast.com](www.issactoast.com), so that users can easily reload the functions without copying and paste.

Installation
------------

You can install r4issactoast from github with:

``` r
# install.packages("devtools")
devtools::install_github("issactoast/r4issactoast")
```

List of functions
-----------------

Here is the list of functions in the packages and related blogpost numbers. You can visit the post by adding the post number after the "www.issactoast.com". For example: www.issactoast.com/100

``` r
library(r4issactoast)
```

### mom\_gamma()

-   Related posts: [www.issactoast.com/95](www.issactoast.com/95)~97

Calculate the method of moment estimator of gamma distribution parameters for given sample.

``` r
my_sample <- rgamma(50, shape = 2, scale = 3)
mom_gamma(my_sample)
#>     k_hat theta_hat 
#>  1.870048  3.015523
```

### mle\_gamma()

-   Related posts: [www.issactoast.com/95](www.issactoast.com/95)~97

Calculate the maximum likelihood estimator of gamma distribution parameters for given sample.

``` r
my_sample <- rgamma(50, shape = 2, scale = 3)
mle_gamma(my_sample)
#>     k_hat theta_hat 
#>  2.955463  1.761099
```

### newton\_method()

-   Related posts: [Optimization with R: 1. Newton's method](www.issactoast.com/92)

Finding root of the function f using f and its derivative.

``` r
x_cu <- function(x){x^3}
x_sq <- function(x){3*x^2}
newton_method(f = x_cu, df = x_sq, x_0 = 3)
#> Final value of function: 9.9616e-17
#> [1] 4.63564e-06
```
