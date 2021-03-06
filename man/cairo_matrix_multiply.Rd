% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-matrix.R
\name{cairo_matrix_multiply}
\alias{cairo_matrix_multiply}
\title{cairo_matrix_multiply}
\usage{
cairo_matrix_multiply(result, a, b)
}
\arguments{
\item{result}{[\code{cairo_matrix_t *}] a #cairo_matrix_t in which to store the result}

\item{a}{[\code{cairo_matrix_t *}] a #cairo_matrix_t}

\item{b}{[\code{cairo_matrix_t *}] a #cairo_matrix_t}
}
\description{
Multiplies the affine transformations in a and b together
and stores the result in result. The effect of the resulting
transformation is to first apply the transformation in a to the
coordinates and then apply the transformation in b to the
coordinates.
}
\details{
It is allowable for result to be identical to either a or b.

Since: 1.0

C function prototype: \code{void cairo_matrix_multiply (cairo_matrix_t *result, const cairo_matrix_t *a, const cairo_matrix_t *b)}
}
\seealso{
Other cairo-matrix: 
\code{\link{cairo_matrix_init_rotate}()},
\code{\link{cairo_matrix_init_scale}()},
\code{\link{cairo_matrix_init_translate}()},
\code{\link{cairo_matrix_init}()},
\code{\link{cairo_matrix_invert}()},
\code{\link{cairo_matrix_rotate}()},
\code{\link{cairo_matrix_scale}()},
\code{\link{cairo_matrix_transform_distance}()},
\code{\link{cairo_matrix_transform_point}()},
\code{\link{cairo_matrix_translate}()}
}
\concept{cairo-matrix}
