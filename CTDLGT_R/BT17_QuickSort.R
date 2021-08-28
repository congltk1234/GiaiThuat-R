quick_sort<-function(x){
  if(length(x)<=1) return(x)
  pivot<-x[1] #Lấy phần tử đầu tiên
  rest<-x[-1]  #Lấy phần còn lại trừ phần tử đầu tiên
  
  # rest[rest<pivot] Lấy những giá trị trong rest mà bé hơn pivot
  pivot_less<-quick_sort(rest[rest<pivot]) #Dãy gồm các phần tử < pivot (mỗi lần chạy sẽ thêm phần tử nhỏ nhất vào dãy)
  pivot_greater<-quick_sort(rest[rest>=pivot]) #Dãy gồm các phần tử > pivot (mỗi lần chạy sẽ thêm phần tử lớn nhất vào dãy)
  return(c(pivot_less,pivot,pivot_greater))
}

x <- c(99,5,4,12,13,3,8,88)
quick_sort(x)
