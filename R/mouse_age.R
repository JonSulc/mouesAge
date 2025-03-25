mref <- c(0, 28, 42, 70, 450, 720)
href <- c(0, .5 * 365, 11.5 * 365, 20 * 365, 51 * 365, 84 * 365)
slopes <- sapply(seq_along(mref)[-1], \(x) {
  (href[x] - href[x-1]) / (mref[x] - mref[x-1])
})

to_human_age <- function(
  mouse_age,
  thresholds = mref[-1],
  aging_speed = slopes
) {
  if (1 < length(mouse_age))
    return(
      sapply(mouse_age,
             to_human_age,
             thresholds = thresholds,
             aging_speed = aging_speed)
    )

  stopifnot(is.numeric(mouse_age))
  if (mouse_age < 0) {
    stop("Mouse age cannot be negative.")
  }

  if (mouse_age <= thresholds[1] |
      # Past the last reference point, aging is assumed to be linear
      length(thresholds) == 1) {
    return(aging_speed[1] * mouse_age)
  }
  thresholds[1] * aging_speed[1] +
    to_human_age(mouse_age - thresholds[1],
              thresholds[-1] - thresholds[1],
              aging_speed[-1])
}

#' Convert mouse age to human age equivalent
#'
#' General functions to convert mouse age to equivalent human age based on
#' https://doi.org/10.1016/j.lfs.2015.10.025. The function suffixes indicate the
#' units of the age in input and output, e.g., `to_human_age_my` converts a
#' mouse's age in months to human age in years. The unit abbreviations are d, w,
#' m, and y, for day, week (7 d), month (365 / 12 = 30.42 d), and year (365 d),
#' respectively.
#'
#' @param mouse_age Mouse age
#'
#' @return Corresponding human age
#'
#' @examples
#' to_human_age_dy(42)
#' to_human_age_yy(2)
#'

#' @rdname to_human_age
#' @export
to_human_age_dd <- function(mouse_age) {
  to_human_age(mouse_age)
}
#' @rdname to_human_age
#' @export
to_human_age_dw <- function(mouse_age) {
  to_human_age(mouse_age) / 7
}
#' @rdname to_human_age
#' @export
to_human_age_dm <- function(mouse_age) {
  to_human_age(mouse_age) / (365/12)
}
#' @rdname to_human_age
#' @export
to_human_age_dy <- function(mouse_age) {
  to_human_age(mouse_age) / 365
}

#' @rdname to_human_age
#' @export
to_human_age_wd <- function(mouse_age) {
  to_human_age(mouse_age * 7)
}
#' @rdname to_human_age
#' @export
to_human_age_ww <- function(mouse_age) {
  to_human_age(mouse_age * 7) / 7
}
#' @rdname to_human_age
#' @export
to_human_age_wm <- function(mouse_age) {
  to_human_age(mouse_age * 7) / (365/12)
}
#' @rdname to_human_age
#' @export
to_human_age_wy <- function(mouse_age) {
  to_human_age(mouse_age * 7) / 365
}

#' @rdname to_human_age
#' @export
to_human_age_md <- function(mouse_age) {
  to_human_age(mouse_age * (365/12))
}
#' @rdname to_human_age
#' @export
to_human_age_mw <- function(mouse_age) {
  to_human_age(mouse_age * (365/12)) / 7
}
#' @rdname to_human_age
#' @export
to_human_age_mm <- function(mouse_age) {
  to_human_age(mouse_age * (365/12)) / (365/12)
}
#' @rdname to_human_age
#' @export
to_human_age_my <- function(mouse_age) {
  to_human_age(mouse_age * (365/12)) / 365
}

#' @rdname to_human_age
#' @export
to_human_age_yd <- function(mouse_age) {
  to_human_age(mouse_age * 365)
}
#' @rdname to_human_age
#' @export
to_human_age_yw <- function(mouse_age) {
  to_human_age(mouse_age * 365) / 7
}
#' @rdname to_human_age
#' @export
to_human_age_ym <- function(mouse_age) {
  to_human_age(mouse_age * 365) / (365/12)
}
#' @rdname to_human_age
#' @export
to_human_age_yy <- function(mouse_age) {
  to_human_age(mouse_age * 365) / 365
}
