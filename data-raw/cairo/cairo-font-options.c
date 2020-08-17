
/**
 * cairo_font_options_create:
 *
 * Allocates a new font options object with all options initialized
 *  to default values.
 *
 * Return value: a newly allocated #cairo_font_options_t. Free with
 *   cairo_font_options_destroy(). This function always returns a
 *   valid pointer; if memory cannot be allocated, then a special
 *   error object is returned where all operations on the object do nothing.
 *   You can check for this with cairo_font_options_status().
 *
 * Since: 1.0
 **/
cairo_font_options_t *
cairo_font_options_create (void)
{
    cairo_font_options_t *options;

    options = _cairo_malloc (sizeof (cairo_font_options_t));
    if (!options) {
	_cairo_error_throw (CAIRO_STATUS_NO_MEMORY);
	return (cairo_font_options_t *) &_cairo_font_options_nil;
    }

    _cairo_font_options_init_default (options);

    return options;
}

/**
 * cairo_font_options_copy:
 * @original: a #cairo_font_options_t
 *
 * Allocates a new font options object copying the option values from
 *  @original.
 *
 * Return value: a newly allocated #cairo_font_options_t. Free with
 *   cairo_font_options_destroy(). This function always returns a
 *   valid pointer; if memory cannot be allocated, then a special
 *   error object is returned where all operations on the object do nothing.
 *   You can check for this with cairo_font_options_status().
 *
 * Since: 1.0
 **/
cairo_font_options_t *
cairo_font_options_copy (const cairo_font_options_t *original)
{
    cairo_font_options_t *options;

    if (cairo_font_options_status ((cairo_font_options_t *) original))
	return (cairo_font_options_t *) &_cairo_font_options_nil;

    options = _cairo_malloc (sizeof (cairo_font_options_t));
    if (!options) {
	_cairo_error_throw (CAIRO_STATUS_NO_MEMORY);
	return (cairo_font_options_t *) &_cairo_font_options_nil;
    }

    _cairo_font_options_init_copy (options, original);

    return options;
}


/**
 * cairo_font_options_destroy:
 * @options: a #cairo_font_options_t
 *
 * Destroys a #cairo_font_options_t object created with
 * cairo_font_options_create() or cairo_font_options_copy().
 *
 * Since: 1.0
 **/
void
cairo_font_options_destroy (cairo_font_options_t *options)
{
    if (cairo_font_options_status (options))
	return;

    _cairo_font_options_fini (options);
    free (options);
}

/**
 * cairo_font_options_status:
 * @options: a #cairo_font_options_t
 *
 * Checks whether an error has previously occurred for this
 * font options object
 *
 * Return value: %CAIRO_STATUS_SUCCESS or %CAIRO_STATUS_NO_MEMORY
 *
 * Since: 1.0
 **/
cairo_status_t
cairo_font_options_status (cairo_font_options_t *options)
{
    if (options == NULL)
	return CAIRO_STATUS_NULL_POINTER;
    else if (options == (cairo_font_options_t *) &_cairo_font_options_nil)
	return CAIRO_STATUS_NO_MEMORY;
    else
	return CAIRO_STATUS_SUCCESS;
}
slim_hidden_def (cairo_font_options_status);

/**
 * cairo_font_options_merge:
 * @options: a #cairo_font_options_t
 * @other: another #cairo_font_options_t
 *
 * Merges non-default options from @other into @options, replacing
 * existing values. This operation can be thought of as somewhat
 * similar to compositing @other onto @options with the operation
 * of %CAIRO_OPERATOR_OVER.
 *
 * Since: 1.0
 **/
void
cairo_font_options_merge (cairo_font_options_t       *options,
			  const cairo_font_options_t *other)
{
    if (cairo_font_options_status (options))
	return;

    if (cairo_font_options_status ((cairo_font_options_t *) other))
	return;

    if (other->antialias != CAIRO_ANTIALIAS_DEFAULT)
	options->antialias = other->antialias;
    if (other->subpixel_order != CAIRO_SUBPIXEL_ORDER_DEFAULT)
	options->subpixel_order = other->subpixel_order;
    if (other->lcd_filter != CAIRO_LCD_FILTER_DEFAULT)
	options->lcd_filter = other->lcd_filter;
    if (other->hint_style != CAIRO_HINT_STYLE_DEFAULT)
	options->hint_style = other->hint_style;
    if (other->hint_metrics != CAIRO_HINT_METRICS_DEFAULT)
	options->hint_metrics = other->hint_metrics;
    if (other->round_glyph_positions != CAIRO_ROUND_GLYPH_POS_DEFAULT)
	options->round_glyph_positions = other->round_glyph_positions;

    if (other->variations) {
      if (options->variations) {
        char *p;

        /* 'merge' variations by concatenating - later entries win */
        p = malloc (strlen (other->variations) + strlen (options->variations) + 2);
        p[0] = 0;
        strcat (p, options->variations);
        strcat (p, ",");
        strcat (p, other->variations);
        free (options->variations);
        options->variations = p;
      }
      else {
        options->variations = strdup (other->variations);
      }
    }
}
slim_hidden_def (cairo_font_options_merge);

/**
 * cairo_font_options_equal:
 * @options: a #cairo_font_options_t
 * @other: another #cairo_font_options_t
 *
 * Compares two font options objects for equality.
 *
 * Return value: %TRUE if all fields of the two font options objects match.
 *	Note that this function will return %FALSE if either object is in
 *	error.
 *
 * Since: 1.0
 **/
cairo_bool_t
cairo_font_options_equal (const cairo_font_options_t *options,
			  const cairo_font_options_t *other)
{
    if (cairo_font_options_status ((cairo_font_options_t *) options))
	return FALSE;
    if (cairo_font_options_status ((cairo_font_options_t *) other))
	return FALSE;

    if (options == other)
	return TRUE;

    return (options->antialias == other->antialias &&
	    options->subpixel_order == other->subpixel_order &&
	    options->lcd_filter == other->lcd_filter &&
	    options->hint_style == other->hint_style &&
	    options->hint_metrics == other->hint_metrics &&
	    options->round_glyph_positions == other->round_glyph_positions &&
            ((options->variations == NULL && other->variations == NULL) ||
             (options->variations != NULL && other->variations != NULL &&
              strcmp (options->variations, other->variations) == 0)));
}
slim_hidden_def (cairo_font_options_equal);

/**
 * cairo_font_options_hash:
 * @options: a #cairo_font_options_t
 *
 * Compute a hash for the font options object; this value will
 * be useful when storing an object containing a #cairo_font_options_t
 * in a hash table.
 *
 * Return value: the hash value for the font options object.
 *   The return value can be cast to a 32-bit type if a
 *   32-bit hash value is needed.
 *
 * Since: 1.0
 **/
unsigned long
cairo_font_options_hash (const cairo_font_options_t *options)
{
    unsigned long hash = 0;

    if (cairo_font_options_status ((cairo_font_options_t *) options))
	options = &_cairo_font_options_nil; /* force default values */

    if (options->variations)
      hash = _cairo_string_hash (options->variations, strlen (options->variations));

    return ((options->antialias) |
	    (options->subpixel_order << 4) |
	    (options->lcd_filter << 8) |
	    (options->hint_style << 12) |
	    (options->hint_metrics << 16)) ^ hash;
}
slim_hidden_def (cairo_font_options_hash);

/**
 * cairo_font_options_set_antialias:
 * @options: a #cairo_font_options_t
 * @antialias: the new antialiasing mode
 *
 * Sets the antialiasing mode for the font options object. This
 * specifies the type of antialiasing to do when rendering text.
 *
 * Since: 1.0
 **/
void
cairo_font_options_set_antialias (cairo_font_options_t *options,
				  cairo_antialias_t     antialias)
{
    if (cairo_font_options_status (options))
	return;

    options->antialias = antialias;
}
slim_hidden_def (cairo_font_options_set_antialias);

/**
 * cairo_font_options_get_antialias:
 * @options: a #cairo_font_options_t
 *
 * Gets the antialiasing mode for the font options object.
 *
 * Return value: the antialiasing mode
 *
 * Since: 1.0
 **/
cairo_antialias_t
cairo_font_options_get_antialias (const cairo_font_options_t *options)
{
    if (cairo_font_options_status ((cairo_font_options_t *) options))
	return CAIRO_ANTIALIAS_DEFAULT;

    return options->antialias;
}

/**
 * cairo_font_options_set_subpixel_order:
 * @options: a #cairo_font_options_t
 * @subpixel_order: the new subpixel order
 *
 * Sets the subpixel order for the font options object. The subpixel
 * order specifies the order of color elements within each pixel on
 * the display device when rendering with an antialiasing mode of
 * %CAIRO_ANTIALIAS_SUBPIXEL. See the documentation for
 * #cairo_subpixel_order_t for full details.
 *
 * Since: 1.0
 **/
void
cairo_font_options_set_subpixel_order (cairo_font_options_t   *options,
				       cairo_subpixel_order_t  subpixel_order)
{
    if (cairo_font_options_status (options))
	return;

    options->subpixel_order = subpixel_order;
}
slim_hidden_def (cairo_font_options_set_subpixel_order);

/**
 * cairo_font_options_get_subpixel_order:
 * @options: a #cairo_font_options_t
 *
 * Gets the subpixel order for the font options object.
 * See the documentation for #cairo_subpixel_order_t for full details.
 *
 * Return value: the subpixel order for the font options object
 *
 * Since: 1.0
 **/
cairo_subpixel_order_t
cairo_font_options_get_subpixel_order (const cairo_font_options_t *options)
{
    if (cairo_font_options_status ((cairo_font_options_t *) options))
	return CAIRO_SUBPIXEL_ORDER_DEFAULT;

    return options->subpixel_order;
}


/**
 * cairo_font_options_set_hint_style:
 * @options: a #cairo_font_options_t
 * @hint_style: the new hint style
 *
 * Sets the hint style for font outlines for the font options object.
 * This controls whether to fit font outlines to the pixel grid,
 * and if so, whether to optimize for fidelity or contrast.
 * See the documentation for #cairo_hint_style_t for full details.
 *
 * Since: 1.0
 **/
void
cairo_font_options_set_hint_style (cairo_font_options_t *options,
				   cairo_hint_style_t    hint_style)
{
    if (cairo_font_options_status (options))
	return;

    options->hint_style = hint_style;
}
slim_hidden_def (cairo_font_options_set_hint_style);

/**
 * cairo_font_options_get_hint_style:
 * @options: a #cairo_font_options_t
 *
 * Gets the hint style for font outlines for the font options object.
 * See the documentation for #cairo_hint_style_t for full details.
 *
 * Return value: the hint style for the font options object
 *
 * Since: 1.0
 **/
cairo_hint_style_t
cairo_font_options_get_hint_style (const cairo_font_options_t *options)
{
    if (cairo_font_options_status ((cairo_font_options_t *) options))
	return CAIRO_HINT_STYLE_DEFAULT;

    return options->hint_style;
}

/**
 * cairo_font_options_set_hint_metrics:
 * @options: a #cairo_font_options_t
 * @hint_metrics: the new metrics hinting mode
 *
 * Sets the metrics hinting mode for the font options object. This
 * controls whether metrics are quantized to integer values in
 * device units.
 * See the documentation for #cairo_hint_metrics_t for full details.
 *
 * Since: 1.0
 **/
void
cairo_font_options_set_hint_metrics (cairo_font_options_t *options,
				     cairo_hint_metrics_t  hint_metrics)
{
    if (cairo_font_options_status (options))
	return;

    options->hint_metrics = hint_metrics;
}
slim_hidden_def (cairo_font_options_set_hint_metrics);

/**
 * cairo_font_options_get_hint_metrics:
 * @options: a #cairo_font_options_t
 *
 * Gets the metrics hinting mode for the font options object.
 * See the documentation for #cairo_hint_metrics_t for full details.
 *
 * Return value: the metrics hinting mode for the font options object
 *
 * Since: 1.0
 **/
cairo_hint_metrics_t
cairo_font_options_get_hint_metrics (const cairo_font_options_t *options)
{
    if (cairo_font_options_status ((cairo_font_options_t *) options))
	return CAIRO_HINT_METRICS_DEFAULT;

    return options->hint_metrics;
}

/**
 * cairo_font_options_set_variations:
 * @options: a #cairo_font_options_t
 * @variations: the new font variations, or %NULL
 *
 * Sets the OpenType font variations for the font options object.
 * Font variations are specified as a string with a format that
 * is similar to the CSS font-variation-settings. The string contains
 * a comma-separated list of axis assignments, which each assignment
 * consists of a 4-character axis name and a value, separated by
 * whitespace and optional equals sign.
 *
 * Examples:
 *
 * wght=200,wdth=140.5
 *
 * wght 200 , wdth 140.5
 *
 * Since: 1.16
 **/
void
cairo_font_options_set_variations (cairo_font_options_t *options,
                                   const char           *variations)
{
  char *tmp = variations ? strdup (variations) : NULL;
  free (options->variations);
  options->variations = tmp;
}

/**
 * cairo_font_options_get_variations:
 * @options: a #cairo_font_options_t
 *
 * Gets the OpenType font variations for the font options object.
 * See cairo_font_options_set_variations() for details about the
 * string format.
 *
 * Return value: the font variations for the font options object. The
 *   returned string belongs to the @options and must not be modified.
 *   It is valid until either the font options object is destroyed or
 *   the font variations in this object is modified with
 *   cairo_font_options_set_variations().
 *
 * Since: 1.16
 **/
const char *
cairo_font_options_get_variations (cairo_font_options_t *options)
{
  return options->variations;
}
