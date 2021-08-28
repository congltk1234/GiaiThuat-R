
#Thay đổi giá trị thông qua số chỉ index
heapify <- function(array, n, i){
  parent <- i
  leftChild <- 2 * (i - 1) + 1
  rightChild <- 2 * (i - 1) + 2
  
  if ((leftChild < n) & (array[parent] < array[leftChild])){
    parent <- leftChild}
  
  if ((rightChild < n) & (array[parent] < array[rightChild])){
    parent <- rightChild}
  
  if (parent != i){
    array <- replace(array, c(i, parent), array[c(parent, i)])
    array <- heapify(array, n, parent)}
  array}

heapSort <- function(array){
  n <- length(array)
  #Đưa số lớn nhất lên đầu
  if (max(array)==array[n]){array<-replace(array,c(1,n), array[c(n,1)])}
  #Đưa số lớn nhất về cuối và đưa số sau cùng lên đầu
  for (i in floor(n / 2):1) {
    array <- heapify(array, n, i)}
  # Thay thế các số cho đến khi đã lọc qua các phần tử trong dãy
  for (i in n:1){
    array <- replace(array, c(i, 1), array[c(1, i)])
    array <- heapify(array, i, 1)}
  array}

array <- c(5, 14, 3, 70, 64,80)
heapSort(array)
