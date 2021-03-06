% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cairo-pdf-surface.R
\name{cairo_pdf_surface_add_outline}
\alias{cairo_pdf_surface_add_outline}
\title{cairo_pdf_surface_add_outline}
\usage{
cairo_pdf_surface_add_outline(surface, parent_id, utf8, link_attribs, flags)
}
\arguments{
\item{surface}{[\code{cairo_surface_t *}] a PDF #cairo_surface_t}

\item{parent_id}{[\code{int}] the id of the parent item or \%CAIRO_PDF_OUTLINE_ROOT if this is a top level item.}

\item{utf8}{[\code{char *}] the name of the outline}

\item{link_attribs}{[\code{char *}] the link attributes specifying where this outline links to}

\item{flags}{[\code{int}] outline item flags}
}
\value{
[\code{int}]
}
\description{
Add an item to the document outline hierarchy with the name utf8
that links to the location specified by link_attribs. Link
attributes have the same keys and values as the [Link Tag][link],
excluding the "rect" attribute. The item will be a child of the
item with id parent_id. Use \%CAIRO_PDF_OUTLINE_ROOT as the parent
id of top level items.
}
\details{
Return value: the id for the added item.

Since: 1.16

C function prototype: \code{int cairo_pdf_surface_add_outline (cairo_surface_t *surface, int parent_id, const char *utf8, const char *link_attribs, cairo_pdf_outline_flags_t flags)}
}
\seealso{
Other cairo-pdf-surface: 
\code{\link{cairo_pdf_surface_create}()},
\code{\link{cairo_pdf_surface_restrict_to_version}()},
\code{\link{cairo_pdf_surface_set_metadata}()},
\code{\link{cairo_pdf_surface_set_page_label}()},
\code{\link{cairo_pdf_surface_set_size}()},
\code{\link{cairo_pdf_surface_set_thumbnail_size}()},
\code{\link{cairo_pdf_version_to_string}()}
}
\concept{cairo-pdf-surface}
