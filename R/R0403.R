wing1 <-59
wing2 <-55
wing3 <-53.5
wing4 <-55
wing5 <-52.5
wing6 <-57.5
wing7 <-53
wing8 <-55
sqrt(wing1)
2*wing1
wing1+wing2+wing5
wing1*3-wing6/4+wing8*2
SQ.wing1 <-sqrt(wing1)
SQ.wing1
Wingcrd <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
Wingcrd
#Hàm c là hàm tạo 1 vector
Wingcrd[1] #Truy cập phần tử trong vector theo số thứ
#tự từ 1 trở đi.C/C++/VBA/Java/PHP/C# - 0
Wingcrd[5]
#Liệt kê các phần tử từ 1 đến 5 của vector
Wingcrd[1:5]
Wingcrd[2:8]
Wingcrd[-2]
#Thực hiện các phép toán trên vector
#sum, mean, max, min, median, var, sd
sum(Wingcrd)
59+55+53.5+55+52.5+57.5+53+55
mean(Wingcrd)
max(Wingcrd)
min(Wingcrd)
median(Wingcrd)

Bien <- sum(Wingcrd)
Wingcrd
Tarsus <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Head <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Wt <- c(9.5, 13.8,14.8, 15.2, 15.5, 15.6, 15.6, 15.7)
sum(Head)
# Muốn tính tổng của Head mà loại ra các biến NA
sum(Head,na.rm=TRUE)
#na: not available;
sum(Head,na.rm=FALSE)

#Tạo ra 1 vector có chiều dài là 32 (4x8)
Birdata <-c(Wingcrd, Tarsus, Head, Wt)
Birdata
Id <-c(1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4)
Id <- rep(c(1,2,3,4), each=8)
Id <- rep(1:4, each=8)
a<-seq(from=1, to=4, by=1)
a
rep(a, each=8)
VarNames <- c("Wingcrd", "Tarsus", "Head", "Wt")
VarNames
Id2 <-rep(VarNames, each=8)
Id2
#Hàm c kết nối dữ liệu giữa các biến với nhau
#Biểu diễn theo dạng cột
#cbind để kết nối số liệu theo dạng cột - c - column
Z <- cbind(Wingcrd, Tarsus, Head, Wt)
Z
#lấy số liệu của cột 1
Z[,2]
#Lấy số liệu trong khoảng từ m:n của cột x [m:n,x]
Z[2:5,2]
#Lấy số liệu ở dòng số 2
Z[2,]
# lấy số liệu ở dòng số 2, cột 1 và 2
Z[2,1:2]
Z[2,c(1,4)]
Z[c(1,5,8), c(2,4)]
#Để biết được ma trận Z này có mấy hàng, cột
dim(Z)
nrow<- dim(Z)[1]
nrow
ncol<- dim(Z)[2]
ncol
# Hàm rbind kết nối các vector theo hàng - r - row

Z2 <- rbind(Wingcrd, Tarsus, Head, Wt)
Z2
# Sử dụng hàm vector để kết nối số liệu
W <- vector(length = 8)
W[1] <- 59
W[2] <-55
# Sử dụng hàm ma trận để kết nối dữ liệu
Dmat <- matrix(nrow = 8, ncol = 4)
Dmat
Dmat[,1] <- c(59, 55, 53.5, 55, 52.5, 57.5, 53, 55)
Dmat[,2] <-c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Dmat[,3] <-c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA)
Dmat[,4] <-c(9.5, 13.8,14.8, 15.2, 15.5, 15.6, 15.6, 15.7)
colnames(Dmat) <- c("Wingcrd","Tarsus","Head","Wt")

#Cách 2 để khai báo dữ liệu ma trận
Dmat2 <- as.matrix(cbind(Wingcrd, Tarsus, Head, Wt))
Dmat2


# Sử dụng hàm data.frame để kết nối số liệu
Dfrm <- data.frame(WC= Wingcrd, TS=Tarsus, HD=Head, W=Wt)
Dfrm
Dfrm <- data.frame(WC= Wingcrd, TS=Tarsus, HD=Head, W=Wt, Wsq =sqrt(Wt))
# Kết nối dữ liệu bằng hàm list function
x1 <- c(1,2,3)
x2 <- c("a", "b", "c","d")
x3 <- 3
x4 <- matrix(nrow = 2, ncol = 2)
x4 [,1] <-c(1,2)
x4[,2] <- c(3,4)
Y <- list(x1=x1, x2=x2, x3=x3, x4=x4)
Y



AllData <- list(Birdata= Birdata, Id=Id2, Z=Z, VarNames= VarNames)
AllData

