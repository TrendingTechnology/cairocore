% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-matrix.R
\name{cairo_matrix_init_translate}
\alias{cairo_matrix_init_translate}
\title{cairo_matrix_init_translate}
\usage{
cairo_matrix_init_translate(matrix, tx, ty)
}
\arguments{
\item{matrix}{[\code{cairo_matrix_t *}] a #cairo_matrix_t}

\item{tx}{[\code{double}] amount to translate in the X direction}

\item{ty}{[\code{double}] amount to translate in the Y direction}
}
\description{
Initializes matrix to a transformation that translates by tx and
ty in the X and Y dimensions, respectively.
}
\details{
Since: 1.0

C function prototype: \code{void cairo_matrix_init_translate (cairo_matrix_t *matrix, double tx, double ty)}
}
\seealso{
Other cairo-matrix: 
\code{\link{cairo_matrix_init_rotate}()},
\code{\link{cairo_matrix_init_scale}()},
\code{\link{cairo_matrix_init}()},
\code{\link{cairo_matrix_invert}()},
\code{\link{cairo_matrix_multiply}()},
\code{\link{cairo_matrix_rotate}()},
\code{\link{cairo_matrix_scale}()},
\code{\link{cairo_matrix_transform_distance}()},
\code{\link{cairo_matrix_transform_point}()},
\code{\link{cairo_matrix_translate}()}
}
\concept{cairo-matrix}
