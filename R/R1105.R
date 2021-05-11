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
# Exercise 2
ifelse(owls$FoodTreatment == "Satiaded", owls$NestNight <- paste(owls$Nest, "1",sep = "_"),
       owls$NestNight <- paste(owls$Nest, "2",sep = "_"))
head(owls)                             
#You can also do this with: owls$NestNight <- paste(owls$Nest, owls$FoodTreatment,sep = "_") 

AllNestsNights <- unique(owls$NestNight)
N <- length(AllNestsNights)
for (i in 1:N) {
  NestNight.i <- as.character(AllNestsNights[i])
  print(NestNight.i)
  owlsi <- owls[owls$NestNight == NestNight.i ,]
  YourFileName <- paste(NestNight.i, ".jpg", sep = "") 
  #jpeg(file = YourFileName)
  plot(x = owlsi$ArrivalTime , y = owlsi$NegPerChick, 
       xlab = "Arrival Time",
       ylab = "Sibling negotiation",
       main = NestNight.i)
}
  