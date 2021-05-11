# Bài tập ngày 11/05
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data")
owls = read.table(file = "Owls.txt", header = TRUE)
names(owls)
str(owls)

library(dplyr)
#A. Vẽ biểu đồ tương quan giữa (SiblingNegotiation)với(ArrivalTime) cho cùng 1 tổ (Nest)
Allnests = unique(owls$Nest)
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data/image")
for (i in 1:27){
  Nest.i = Allnests[i]
  owls.i = owls[owls$Nest == Nest.i,]
  plot(x = owls.i$ArrivalTime, y = owls.i$SiblingNegotiation,
       xlab = "Arrival Time",
       main = Nest.i,
       ylab = "Sibling Negotiationr")
}


#B. 
ifelse(owls$FoodTreatment == "Satiated", owls$NestNight <- paste(owls$ï..Nest, "1",sep = "_"), owls$NestNight <- paste(owls$ï..Nest, "2",sep = "_"))
# hàm ifelse khi FoodTreatment là satiated thì paste vào cột mới là NestNight 
# dữ liệu là cột Nest và _1 và ngược lại là _2
head(owls)#in ra những cột đầu

AllNestsNights= unique(owls$NestNight)
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
  