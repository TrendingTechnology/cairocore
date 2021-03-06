% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-svg-surface.R
\name{cairo_svg_surface_get_document_unit}
\alias{cairo_svg_surface_get_document_unit}
\title{cairo_svg_surface_get_document_unit}
\usage{
cairo_svg_surface_get_document_unit(surface)
}
\arguments{
\item{surface}{[\code{cairo_surface_t *}] a SVG #cairo_surface_t}
}
\value{
[\code{int}]
}
\description{
Get the unit of the SVG surface.
}
\details{
If the surface passed as an argument is not a SVG surface, the function
sets the error status to CAIRO_STATUS_SURFACE_TYPE_MISMATCH and returns
CAIRO_SVG_UNIT_USER.

Return value: the SVG unit of the SVG surface.

Since: 1.16

C function prototype: \code{cairo_svg_unit_t cairo_svg_surface_get_document_unit (cairo_surface_t *surface)}
}
\seealso{
Other cairo-svg-surface: 
\code{\link{cairo_svg_surface_create}()},
\code{\link{cairo_svg_surface_restrict_to_version}()},
\code{\link{cairo_svg_surface_set_document_unit}()},
\code{\link{cairo_svg_version_to_string}()}
}
\concept{cairo-svg-surface}
