selectionSort <- function(arr) {
  smallest <- min(arr)
  rest <- arr[arr != smallest]
  
  if (length(rest) > 1) {
    rest <- selectionSort(arr[arr != smallest])
  }
  
  c(smallest, rest)
}
x <- c(23,43,2122,3132,12,21,44,12,99,12,4,77) 
selectionSort(x)