setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data")

tem = read.csv("Temperature.csv", header = TRUE)
#Câu 1
tapply(tem$Temperature,list(tem$Month,tem$Year), mean,na.rm = TRUE) #gia tri trung binh
tapply(tem$Temperature,list(tem$Month,tem$Year), sd,na.rm ? TRUE) #standard deviation
tapply(tem$Temperature,list(tem$Month,tem$Year), length) #so quan sat
#Câu 2
table(tem$Year) #so quan sat tren 1 nam
table(list(tem$Year,tem$Station)) #so quan sat tren 1 nam/tram
