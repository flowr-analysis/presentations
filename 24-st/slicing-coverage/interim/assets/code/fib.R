invocations <- 0
fib <- function(n) {
  invocations <<- invocations + 1
  if (n <= 1) {
    return(n)
  } else {
    return(fib(n - 1) + fib(n - 2))
  }
}
