% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-font-options.R
\name{cairo_font_options_status}
\alias{cairo_font_options_status}
\title{cairo_font_options_status}
\usage{
cairo_font_options_status(options)
}
\arguments{
\item{options}{[\code{cairo_font_options_t *}] a #cairo_font_options_t}
}
\value{
[\code{int}]
}
\description{
Checks whether an error has previously occurred for this
font options object
}
\details{
Return value: \%CAIRO_STATUS_SUCCESS or \%CAIRO_STATUS_NO_MEMORY

Since: 1.0

C function prototype: \code{cairo_status_t cairo_font_options_status (cairo_font_options_t *options)}
}
\seealso{
Other cairo-font-options: 
\code{\link{cairo_font_options_copy}()},
\code{\link{cairo_font_options_create}()},
\code{\link{cairo_font_options_equal}()},
\code{\link{cairo_font_options_get_antialias}()},
\code{\link{cairo_font_options_get_hint_metrics}()},
\code{\link{cairo_font_options_get_hint_style}()},
\code{\link{cairo_font_options_get_subpixel_order}()},
\code{\link{cairo_font_options_get_variations}()},
\code{\link{cairo_font_options_hash}()},
\code{\link{cairo_font_options_merge}()},
\code{\link{cairo_font_options_set_antialias}()},
\code{\link{cairo_font_options_set_hint_metrics}()},
\code{\link{cairo_font_options_set_hint_style}()},
\code{\link{cairo_font_options_set_subpixel_order}()},
\code{\link{cairo_font_options_set_variations}()}
}
\concept{cairo-font-options}
