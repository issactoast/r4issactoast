#' Make your base plot
#'
#' emptyPlot simply makes a base for you, when you draw a plot using base package.
#' It has presetting base theme which is suitable for scientific but pretty.
#'
#' @param xrange the x axis range that you want to show in plot
#' @param yrange the y axis range that you want to show in plot
#' @param xlab the x axis lable
#' @param ylab the y axis lable
#' @param ... you can freely use other options from plot function
#' @return the plot with coloring and x and y axis line, plus dash support line
#' @examples
#'   a <- seq(-2, 2, by = 0.1)
#'   b <- a^2
#'   emptyPlot(c(-2, 2), c(-2, 2), main = "title", xlab = "x", ylab = "y")
#'   points(a, b, type = "l", col = "red")
#' @importFrom grDevices axisTicks
#' @import graphics
#' @export
emptyPlot <- function(xrange = c(0, 1), yrange = c(0, 1),
                      xlab = "", ylab = "", ...){
    par(bg = "light cyan")  # 팔레트 색깔 하늘색으로 설정

    # Generate empty plot
    plot(# x, y 그래프 범위 설정
        c(0,0),c(1,1),
        xlab = xlab,        # x 축 제목 생략
        ylab = ylab,        # y 축 제목 생략
        xlim = c(xrange[1], xrange[2]),
        ylim = c(yrange[1], yrange[2]),
        type = 'n',         # '표시 안함'으로 설정
        las = 1,
        ...
    )

    # 배경 노란색으로 설정
    loc <- par("usr")
    rect(loc[1], loc[3], loc[2], loc[4],
         col = "lemonchiffon")

    # 참조선 작업(http://issactoast.com/54 참조)
    abline( v = axisTicks(loc[1:2], log = FALSE),
            h = axisTicks(loc[3:4], log = FALSE),
            col = "black", lty=3)
    abline( v = 0, lty = 1)
    abline( h = 0, lty = 1)

    # 배경색 리셋
    par(bg = "white")
}

#' Add line in the existing plot
#'
#' @param x x position vector
#' @param y y position vector
#' @param ... you can freely use other options from points function
#' @return line in the plot
#' @export
add_line <- function(x, y, ...){
    if (length(x) != length(y)) {
        warning("x and y should be same length vector")
        return(NULL)
    }
    points(x, y, type = "l", ...)
}

#' Add points in the existing plot
#'
#' @param x x position vector
#' @param y y position vector
#' @param ... you can freely use other options from points function
#' @return points in the plot
#' @export
add_points <- function(x, y, ...){
    if (length(x) != length(y)) {
        warning("x and y should be same length vector")
        return(NULL)
    }
    points(x, y, ...)
}

#' Add function in the existing plot
#'
#' @param f function you want to add
#' @param ... you can freely use other options from points function
#' @return line function in the plot
#' @export
add_fcn <- function(f, ...){
    loc <- par("usr")
    x <- seq(loc[1], loc[2], length.out = 101)
    y <- f(x)
    add_line(x, y, ...)
}




