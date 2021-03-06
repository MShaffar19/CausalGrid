% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_estimate.R
\name{fit_estimate_partition}
\alias{fit_estimate_partition}
\alias{is_estimated_partition}
\title{Fit Grid Partition and estimate cell stats}
\usage{
fit_estimate_partition(
  y,
  X,
  d = NULL,
  tr_split = 0.5,
  max_splits = Inf,
  max_cells = Inf,
  min_size = 3,
  cv_folds = 5,
  potential_lambdas = NULL,
  partition_i = NA,
  verbosity = 0,
  breaks_per_dim = NULL,
  bucket_min_n = NA,
  bucket_min_d_var = FALSE,
  ctrl_method = "",
  pr_cl = NULL,
  alpha = 0.05,
  bump_samples = 0,
  bump_ratio = 1,
  importance_type = "",
  ...
)

is_estimated_partition(x)
}
\arguments{
\item{y}{Nx1 matrix of outcome (label/target) data. With multiple core estimates see Details below.}

\item{X}{NxK matrix of features (covariates). With multiple core estimates see Details below.}

\item{d}{(Optional) NxP matrix (with colnames) of treatment data. If all equally important they 
should be normalized to have the same variance. With multiple core estimates see Details below.}

\item{tr_split}{Number between 0 and 1 or vector of indexes. If Multiple effect #3 and using vector then pass in list of vectors.}

\item{max_splits}{Maximum number of splits even if splits continue to improve OOS fit}

\item{max_cells}{Maximum number of cells even if more splits continue to improve OOS fit}

\item{min_size}{Minimum cell size when building full grid, cv_tr will use (F-1)/F*min_size, cv_te doesn't use any.}

\item{cv_folds}{Number of CV Folds or a vector of foldids. 
If m_mode==DS.MULTI_SAMPLE, then a list with foldids per Dataset.
Each must be over the training sample}

\item{potential_lambdas}{potential lambdas to search through in CV}

\item{partition_i}{Default NA. Use this to avoid CV}

\item{verbosity}{0 print no message. 
1 prints progress bar for high-level loops. 
2 prints detailed output for high-level loops. 
Nested operations decrease verbosity by 1.}

\item{breaks_per_dim}{NULL (for all possible breaks); 
 K-length vector with # of break (chosen by quantiles); or 
 K-dim list of vectors giving potential split points for non-categorical 
   variables (can put c(0) for categorical). 
Similar to 'discrete splitting' in CausalTree though their they do separate split-points 
for treated and controls.}

\item{bucket_min_n}{Minimum number of observations needed between different split checks}

\item{bucket_min_d_var}{Ensure positive variance of d for the observations between different split checks}

\item{ctrl_method}{Method for determining additional control variables. Empty ("") for nothing, "all",  "LassoCV", or "RF"}

\item{pr_cl}{Default NULL. Parallel cluster. Used for: \enumerate{
  \item CVing the optimal lambda,
  \item fitting full tree (at each split going across dimensions),
  \item fitting trees over the bumped samples
  \item for importance weights to estimate models over limited X domains
}}

\item{alpha}{Significance threshold for confidence intervals. Default=0.05}

\item{bump_samples}{Number of bump bootstraps (default 0), or list of such length where each items is a bootstrap sample.
If m_mode==DS.MULTI_SAMPLE then each item is a sublist with such bootstrap samples over each dataset.
Each bootstrap sample must be over the train split of the data}

\item{bump_ratio}{For bootstraps the ratio of sample size to sample (between 0 and 1, default 1)}

\item{importance_type}{Options:
single - (smart) redo full fitting removing each possible dimension
interaction - (smart) redo full fitting removing each pair of dimensions
 "" - Nothing}

\item{...}{Additional params.}

\item{x}{an R object}
}
\value{
An object with class \code{"estimated_partition"}.
        \item{partition}{\code{\link{grid_partition}} obj defining cuts}
        \item{cell_stats}{Cell stats from \code{\link{est_cell_stats}$stats} on the est sample}
        \item{importance_weights}{Importance weights for each feature}
        \item{interaction_weights}{Interaction weights for each pair of features}
        \item{lambda}{lambda used}
        \item{is_obj_val_seq}{In-sample objective function values for sequence of partitions}
        \item{complexity_seq}{Complexity #s (# cells-1) for sequence of partitions}
        \item{partition_i}{Index of Partition selected in sequence}
        \item{split_seq}{Sequence of \code{partition_splits}s. Note that split i corresponds to partition i+1}
        \item{index_tr}{Index of training sample (we might have generated it). Order N}
        \item{cv_foldid}{CV foldids for the training sample (Size of N_tr)}
        \item{varnames}{varnames (or c("X1", "X2",...) if X doesn't have colnames)}
        \item{est_plan}{Fitted \code{\link{EstimatorPlan}} used.}
        \item{full_stat_df}{Full sample average stats from \code{\link{est_full_stats}}}

True if x is an estimated_partition
}
\description{
Split the data, one one side train/fit the partition using \code{\link{fit_partition}} and then on the other estimate subgroup effects.

Tests whether the object is an \code{estimated_partition} object.
}
\section{Functions}{
\itemize{
\item \code{is_estimated_partition}: is estimated_partition
}}

\section{Multiple estimates}{

With multiple core estimates (M) there are 3 options (the first two have the same sample across treatment effects).\enumerate{
 \item DS.MULTI_SAMPLE: Multiple pairs of (Y_{m},W_{m}). y,X,d are then lists of length M. Each element then has the typical size
    The N_m may differ across m. The number of columns of X will be the same across m.
 \item DS.MULTI_D: Multiple treatments and a single outcome. d is then a NxM matrix.
 \item DS.MULTI_Y: A single treatment and multiple outcomes. y is then a NXM matrix.
}
}

