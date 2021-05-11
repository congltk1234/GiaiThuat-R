# Bài tập ngày 11/05
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data")
owls = read.table(file = "Owls.txt", header = TRUE)
names(owls)
str(owls)

#A. Vẽ biểu đồ tương quan giữa (SiblingNegotiation)với(ArrivalTime) cho cùng 1 tổ (Nest)
Allnests = unique(owls$Nest)
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data/image")
for (i in 1:27){
  Nest.i = Allnests[i]
  owls.i = owls[owls$Nest == Nest.i,]
  YourFileName = paste(Nest.i,".jpg",sep = "")
  jpeg(file = YourFileName)
  plot(x = owls.i$ArrivalTime, y = owls.i$NegPerChick,
       xlab = "Arrival Time",
       main = Nest.i,
       ylab = "Negotiation behaviour"
  )
  dev.off()
}


#B. 
help(paste)

