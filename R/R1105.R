# Bài tập ngày 11/05
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data")
owls = read.table(file = "owls.txt", header = TRUE)
names(owls)
str(owls)

#library(dplyr)
#A. Vẽ biểu đồ tương quan giữa (SiblingNegotiation)với(ArrivalTime) cho cùng 1 tổ (Nest)
Allnests = unique(owls$Nest)
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data/image")
for (i in 1:27){
  Nest.i = Allnests[i]
  owls.i = owls[owls$Nest == Nest.i,]
  YourFileName = paste(Nest.i,".jpg",sep = "")# tên file lưu vào máy
  jpeg(file = YourFileName)
  plot(x = owls.i$ArrivalTime, y = owls.i$SiblingNegotiation,
       xlab = "Arrival Time",
       main = Nest.i,
       ylab = "Sibling Negotiationr")
  dev.off()
}


#B. 
help("ifelse")
N=length(owls$Nest)
for (i in 1:N){
  ifelse(owls$FoodTreatment[i] == 'Deprived', #Điều kiện
         owls$NestNight[i] <- paste(owls$Nest[i], "Deprived",sep = "_"), #Lệnh thực hiện nếu đúng
         owls$NestNight[i] <- paste(owls$Nest[i], "Satiated",sep = "_")) #Lệnh thực hiện nếu sai
}
# hàm ifelse khi FoodTreatment là satiated thì paste vào cột mới là NestNight 
# dữ liệu là cột Nest và _1 và ngược lại là _2
head(owls)#in ra những cột đầu

AllNestsNights= unique(owls$NestNight)
AllNestsNights
N=length(AllNestsNights)  # Các phần tử trong AllNestsNights
for (i in 1:N){
  NestNight.i = as.character(AllNestsNights[i]) # đưa về dạng character
  print(NestNight.i)
  owlsi = owls[owls$NestNight == NestNight.i ,]
  YourFileName = paste(NestNight.i,".jpg",sep = "")
  jpeg(file = YourFileName)
  plot(x = owlsi$ArrivalTime,y=owlsi$NegPerChick,
       xlab ="Arrival Time",           # tên cột x
       ylab ="Sibling negotiation",    # Tên cột y
       main = NestNight.i)             # Tiêu đề
  dev.off()
}