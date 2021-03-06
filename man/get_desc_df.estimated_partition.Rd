% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_estimate.R
\name{get_desc_df.estimated_partition}
\alias{get_desc_df.estimated_partition}
\title{Get descriptive data.frame}
\usage{
\method{get_desc_df}{estimated_partition}(
  obj,
  cont_bounds_inf = TRUE,
  do_str = TRUE,
  drop_unsplit = TRUE,
  digits = NULL,
  unsplit_cat_star = TRUE,
  import_order = FALSE,
  ...
)
}
\arguments{
\item{obj}{partition object}

\item{cont_bounds_inf}{Should "Inf" be used for continuous bounds (otherwise
the bounds from X_range)}

\item{do_str}{If True, use a string like "(a, b]", otherwise have two
separate columns with a and b}

\item{drop_unsplit}{If True, drop columns for variables overwhich the
partition did not split}

\item{digits}{digits Option (default is NULL)}

\item{unsplit_cat_star}{Should unsplit categorical variables be listed as
"*", otherwise all factor labels will be used.}

\item{import_order}{Whether should use importance ordering
(most important on the left) or input ordering (default) for features. Rows
will be ordered so that the right-most will change most frequently.}

\item{...}{Additional arguments.}
}
\value{
data.frame with columns: partitioning columns, {N_est, param_ests,
  pval} per estimate
}
\description{
Get information for each cell
}
