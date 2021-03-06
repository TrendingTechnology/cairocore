# This file was auto-generated from C headers

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_create
#'
#' Creates an image surface of the specified format and
#' dimensions. Initially the surface contents are set to 0.
#' (Specifically, within each pixel, each color or alpha channel
#' belonging to format will be 0. The contents of bits within a pixel,
#' but not belonging to the given format are undefined).
#'
#' Return value: a pointer to the newly created surface. The caller
#' owns the surface and should call cairo_surface_destroy() when done
#' with it.
#'
#' This function always returns a valid pointer, but it will return a
#' pointer to a "nil" surface if an error such as out of memory
#' occurs. You can use cairo_surface_status() to check for this.
#'
#' Since: 1.0
#'
#' C function prototype: \code{cairo_surface_t * cairo_image_surface_create (cairo_format_t format, int width, int height)}
#'
#' @param format [\code{int}] format of pixels in the surface to create
#' @param width [\code{int}] width of the surface, in pixels
#' @param height [\code{int}] height of the surface, in pixels
#'
#' @return [\code{cairo_surface_t *}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_create <- function(format, width, height) {
  .Call("cairo_image_surface_create_", format, width, height)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_format_stride_for_width
#'
#' This function provides a stride value that will respect all
#' alignment requirements of the accelerated image-rendering code
#' within cairo. Typical usage will be of the form:
#'
#' <informalexample><programlisting>
#' int stride;
#' unsigned char *data;
#' cairo_surface_t *surface;
#'
#' stride = cairo_format_stride_for_width (format, width);
#' data = malloc (stride * height);
#' surface = cairo_image_surface_create_for_data (data, format,
#' width, height,
#' stride);
#' </programlisting></informalexample>
#'
#' Return value: the appropriate stride to use given the desired
#' format and width, or -1 if either the format is invalid or the width
#' too large.
#'
#' Since: 1.6
#'
#' C function prototype: \code{int cairo_format_stride_for_width (cairo_format_t format, int width)}
#'
#' @param format [\code{int}] A #cairo_format_t value
#' @param width [\code{int}] The desired width of an image surface to be created.
#'
#' @return [\code{int}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_format_stride_for_width <- function(format, width) {
  .Call("cairo_format_stride_for_width_", format, width)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_create_for_data
#'
#' Creates an image surface for the provided pixel data. The output
#' buffer must be kept around until the #cairo_surface_t is destroyed
#' or cairo_surface_finish() is called on the surface.  The initial
#' contents of data will be used as the initial image contents; you
#' must explicitly clear the buffer, using, for example,
#' cairo_rectangle() and cairo_fill() if you want it cleared.
#'
#' Note that the stride may be larger than
#' width*bytes_per_pixel to provide proper alignment for each pixel
#' and row. This alignment is required to allow high-performance rendering
#' within cairo. The correct way to obtain a legal stride value is to
#' call cairo_format_stride_for_width() with the desired format and
#' maximum image width value, and then use the resulting stride value
#' to allocate the data and to create the image surface. See
#' cairo_format_stride_for_width() for example code.
#'
#' Return value: a pointer to the newly created surface. The caller
#' owns the surface and should call cairo_surface_destroy() when done
#' with it.
#'
#' This function always returns a valid pointer, but it will return a
#' pointer to a "nil" surface in the case of an error such as out of
#' memory or an invalid stride value. In case of invalid stride value
#' the error status of the returned surface will be
#' \%CAIRO_STATUS_INVALID_STRIDE.  You can use
#' cairo_surface_status() to check for this.
#'
#' See cairo_surface_set_user_data() for a means of attaching a
#' destroy-notification fallback to the surface if necessary.
#'
#' Since: 1.0
#'
#' C function prototype: \code{cairo_surface_t * cairo_image_surface_create_for_data (unsigned char *data, cairo_format_t format, int width, int height, int stride)}
#'
#' @param data [\code{unsigned char *}] a pointer to a buffer supplied by the application in which to write contents. This pointer must be suitably aligned for any kind of variable, (for example, a pointer returned by malloc).
#' @param format [\code{int}] the format of pixels in the buffer
#' @param width [\code{int}] the width of the image to be stored in the buffer
#' @param height [\code{int}] the height of the image to be stored in the buffer
#' @param stride [\code{int}] the number of bytes between the start of rows in the buffer as allocated. This value should always be computed by cairo_format_stride_for_width() before allocating the data buffer.
#'
#' @return [\code{cairo_surface_t *}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_create_for_data <- function(data, format, width, height, stride) {
  .Call("cairo_image_surface_create_for_data_", data, format, width, height, stride)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_get_data
#'
#' Get a pointer to the data of the image surface, for direct
#' inspection or modification.
#'
#' A call to cairo_surface_flush() is required before accessing the
#' pixel data to ensure that all pending drawing operations are
#' finished. A call to cairo_surface_mark_dirty() is required after
#' the data is modified.
#'
#' Return value: a pointer to the image data of this surface or \%NULL
#' if surface is not an image surface, or if cairo_surface_finish()
#' has been called.
#'
#' Since: 1.2
#'
#' C function prototype: \code{unsigned char * cairo_image_surface_get_data (cairo_surface_t *surface)}
#'
#' @param surface [\code{cairo_surface_t *}] a #cairo_image_surface_t
#'
#' @return [\code{unsigned char *}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_get_data <- function(surface) {
  stopifnot(inherits(surface, "cairo_surface_t"))
  .Call("cairo_image_surface_get_data_", surface)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_get_format
#'
#' Get the format of the surface.
#'
#' Return value: the format of the surface
#'
#' Since: 1.2
#'
#' C function prototype: \code{cairo_format_t cairo_image_surface_get_format (cairo_surface_t *surface)}
#'
#' @param surface [\code{cairo_surface_t *}] a #cairo_image_surface_t
#'
#' @return [\code{int}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_get_format <- function(surface) {
  stopifnot(inherits(surface, "cairo_surface_t"))
  .Call("cairo_image_surface_get_format_", surface)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_get_width
#'
#' Get the width of the image surface in pixels.
#'
#' Return value: the width of the surface in pixels.
#'
#' Since: 1.0
#'
#' C function prototype: \code{int cairo_image_surface_get_width (cairo_surface_t *surface)}
#'
#' @param surface [\code{cairo_surface_t *}] a #cairo_image_surface_t
#'
#' @return [\code{int}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_get_width <- function(surface) {
  stopifnot(inherits(surface, "cairo_surface_t"))
  .Call("cairo_image_surface_get_width_", surface)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_get_height
#'
#' Get the height of the image surface in pixels.
#'
#' Return value: the height of the surface in pixels.
#'
#' Since: 1.0
#'
#' C function prototype: \code{int cairo_image_surface_get_height (cairo_surface_t *surface)}
#'
#' @param surface [\code{cairo_surface_t *}] a #cairo_image_surface_t
#'
#' @return [\code{int}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_get_height <- function(surface) {
  stopifnot(inherits(surface, "cairo_surface_t"))
  .Call("cairo_image_surface_get_height_", surface)
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' cairo_image_surface_get_stride
#'
#' Get the stride of the image surface in bytes
#'
#' Return value: the stride of the image surface in bytes (or 0 if
#' surface is not an image surface). The stride is the distance in
#' bytes from the beginning of one row of the image data to the
#' beginning of the next row.
#'
#' Since: 1.2
#'
#' C function prototype: \code{int cairo_image_surface_get_stride (cairo_surface_t *surface)}
#'
#' @param surface [\code{cairo_surface_t *}] a #cairo_image_surface_t
#'
#' @return [\code{int}]
#'
#' @family cairo-image-surface
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cairo_image_surface_get_stride <- function(surface) {
  stopifnot(inherits(surface, "cairo_surface_t"))
  .Call("cairo_image_surface_get_stride_", surface)
}
