#Bieu do:
x = c(10,21, 25,33,45,12,34,61)
par(mfrow= c(1,3))
#scatter plot:
plot(x, type = 'p')
#histogram:
hist(x, breaks=10)
#boxplot:
boxplot(x, main='Boxplot of x')

#Thông so chi tiet cua bieu do
who = read.csv('C:/Users/ADMIN/Documents/R/WHO.csv')
par(mfrow=c(1,1))
plot(who$LifeExpectancy, who$GNI, main="Bieu do phan tan",
     xlab = 'Life Expectancy',
     ylab="GNI",
     xlim=c(40,100),
     ylim=c(0,100000),
     col="red",
     pch = 1)
# if else:
x = 3
if (x > 3) {'x lon hon 3'} else if (x ==3){'X bang 3'}else {'x bé hon'}

# For loop:
count = 0
for (i in 1:length(y)){
  if(y[i] >0){count = count+1}
}
count
for (i in 1:length(y)){
  if(y[i] >0){print(y[i])}
}


# While loop:
a = 10
while(a>1){a = a -1;print(a)}


# Tao ham
count_na = function(vect){
  sum(is.na(vect))
}

count_na(c(1,2,NA,NA,3,5))

check = function(x) {
  if (x > 0) {
    result <- "So duong"
  }
  else if (x < 0) {
    result <- "So âm"
  }
  else {
    result <- "Bang 0"
  }
  return(result)
}


#Su dung các hàm so: apply, lapply, sapply, tapply
mat = matrix(c(1,2,3,4,5,6),3,2)
mat
#Tinh tong theo tung dong
apply(mat,1,sum)

list1 = list(c(1,2,3),3,5,c(2,5,6))
# Tinh do dai cua tung phan tu trong list1
lapply(list1,length)
sapply(list1,length)

# Tinh trung binh Population phan theo Region
tapply(who$Population,who$Region,mean)
