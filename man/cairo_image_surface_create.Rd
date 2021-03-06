% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-image-surface.R
\name{cairo_image_surface_create}
\alias{cairo_image_surface_create}
\title{cairo_image_surface_create}
\usage{
cairo_image_surface_create(format, width, height)
}
\arguments{
\item{format}{[\code{int}] format of pixels in the surface to create}

\item{width}{[\code{int}] width of the surface, in pixels}

\item{height}{[\code{int}] height of the surface, in pixels}
}
\value{
[\code{cairo_surface_t *}]
}
\description{
Creates an image surface of the specified format and
dimensions. Initially the surface contents are set to 0.
(Specifically, within each pixel, each color or alpha channel
belonging to format will be 0. The contents of bits within a pixel,
but not belonging to the given format are undefined).
}
\details{
Return value: a pointer to the newly created surface. The caller
owns the surface and should call cairo_surface_destroy() when done
with it.

This function always returns a valid pointer, but it will return a
pointer to a "nil" surface if an error such as out of memory
occurs. You can use cairo_surface_status() to check for this.

Since: 1.0

C function prototype: \code{cairo_surface_t * cairo_image_surface_create (cairo_format_t format, int width, int height)}
}
\seealso{
Other cairo-image-surface: 
\code{\link{cairo_format_stride_for_width}()},
\code{\link{cairo_image_surface_create_for_data}()},
\code{\link{cairo_image_surface_get_data}()},
\code{\link{cairo_image_surface_get_format}()},
\code{\link{cairo_image_surface_get_height}()},
\code{\link{cairo_image_surface_get_stride}()},
\code{\link{cairo_image_surface_get_width}()}
}
\concept{cairo-image-surface}
