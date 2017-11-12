#' Title, e.g., Say 'hi' to friends.
#'
#' Short description of this help page. `hi("Martin")` returns a greeting.
#'
#' @details A more extensive description of the functions or other objects
#'    documented on this help page. Use `how=` to determine the nature of
#'    the greeting.
#'
#' @param who character() The name(s) of the person / people to greet.
#'
#' @param how character(1) Whether to shout (uppercase) or whisper 
#'     (lowercase) the greeting.
#'
#' @return character() of greetings, with length equal to `who`.
#'
#' @examples
#' hi(c("Martin", "Jenny"), "whisper")
#'
#' @export
hi <- function(who, how = c("asis", "shout", "whisper")) {
    stopifnot(
        is.character(who),
        is.character(how), missing(how) || length(how) == 1
    )
    transform <- switch(
        match.arg(how),
        asis = identity, shout = toupper, whisper = tolower
    )

    greet <- paste("hi", who)
    transform(greet)
}
