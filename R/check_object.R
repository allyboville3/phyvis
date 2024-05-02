# Extra checks in addition to the ones in import-standalone-types-check.R

# Usage:
# check_object(x, is.data.frame, "a data.frame)
check_object <- function(x,
                         check_fun,
                         what,
                         ...,
                         allow_null = FALSE,
                         arg = caller_arg(x),
                         call = caller_env()) {

  if (!missing(x)) {
    if (check_fun(x)) {
      return(invisible(NULL))
    }
    if (allow_null && is_null(x)) {
      return(invisible(NULL))
    }
  }

  stop_input_type(
    x,
    as_cli(what),
    ...,
    allow_null = allow_null,
    arg = arg,
    call = call
  )
}
