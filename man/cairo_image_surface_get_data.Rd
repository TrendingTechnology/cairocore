% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-image-surface.R
\name{cairo_image_surface_get_data}
\alias{cairo_image_surface_get_data}
\title{cairo_image_surface_get_data}
\usage{
cairo_image_surface_get_data(surface)
}
\arguments{
\item{surface}{[\code{cairo_surface_t *}] a #cairo_image_surface_t}
}
\value{
[\code{unsigned char *}]
}
\description{
Get a pointer to the data of the image surface, for direct
inspection or modification.
}
\details{
A call to cairo_surface_flush() is required before accessing the
pixel data to ensure that all pending drawing operations are
finished. A call to cairo_surface_mark_dirty() is required after
the data is modified.

Return value: a pointer to the image data of this surface or \%NULL
if surface is not an image surface, or if cairo_surface_finish()
has been called.

Since: 1.2

C function prototype: \code{unsigned char * cairo_image_surface_get_data (cairo_surface_t *surface)}
}
\seealso{
Other cairo-image-surface: 
\code{\link{cairo_format_stride_for_width}()},
\code{\link{cairo_image_surface_create_for_data}()},
\code{\link{cairo_image_surface_create}()},
\code{\link{cairo_image_surface_get_format}()},
\code{\link{cairo_image_surface_get_height}()},
\code{\link{cairo_image_surface_get_stride}()},
\code{\link{cairo_image_surface_get_width}()}
}
\concept{cairo-image-surface}
