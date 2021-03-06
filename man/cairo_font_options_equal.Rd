% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-font-options.R
\name{cairo_font_options_equal}
\alias{cairo_font_options_equal}
\title{cairo_font_options_equal}
\usage{
cairo_font_options_equal(options, other)
}
\arguments{
\item{options}{[\code{cairo_font_options_t *}] a #cairo_font_options_t}

\item{other}{[\code{cairo_font_options_t *}] another #cairo_font_options_t}
}
\value{
[\code{int}]
}
\description{
Compares two font options objects for equality.
}
\details{
Return value: \%TRUE if all fields of the two font options objects match.
Note that this function will return \%FALSE if either object is in
error.

Since: 1.0

C function prototype: \code{cairo_bool_t cairo_font_options_equal (const cairo_font_options_t *options, const cairo_font_options_t *other)}
}
\seealso{
Other cairo-font-options: 
\code{\link{cairo_font_options_copy}()},
\code{\link{cairo_font_options_create}()},
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
\code{\link{cairo_font_options_set_variations}()},
\code{\link{cairo_font_options_status}()}
}
\concept{cairo-font-options}
