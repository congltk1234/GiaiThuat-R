#Thiết lập thư mục hiện hành
setwd("C:/Users/ADMIN/Desktop/GiaiThuat-R/R/data")

#Du lieu:
dt = read.table('Vegetation2.txt',header = TRUE)
names(dt)
str(dt)
#Bien Species(loai) tu cot thu 5 den 9 trong dt
Species = dt[,5:9]
names(Species)
#Kiem tra dimensions -chieu cua bien Species
n = dim(Species)
n
sum(Species[1,], na.rm=TRUE)
sum(Species[2,], na.rm=TRUE)
#...............
TA = vector(length = n[1])
for (i in 1:n[1]){
  TA[i]=sum(Species[i,],na.rm=TRUE)
}
#Ham rowSums tinh tong cac cot trong ham
#na.rm =TRUE loai bo cac gia tri rong
TA
TA02 = rowSums(Species,na.rm=TRUE)
TA02
#di vao chi tiet tung vi tri quan sat
sum(Species[1,]>0,na.rm=TRUE)
Richness = vector(length = n[1])
for (i in 1:n[1]){
  Richness[i]=sum(Species[i,]>0,na.rm=TRUE)
}
Richness
Richness02=rowSums(Species>0,na.rm=TRUE)
Richness02
#chi so da dang loai
#H=sum chay ru i -> m cua bien p: xac suat*log10 p
RS = rowSums(Species,na.rm =TRUE)
prop=Species/RS

H = -rowSums(prop * log10(prop), na.rm= TRUE)
H
#Ket hop lai lam 1 ham
Index.function <-function(Spec, Choice){
  if (Choice=="Richness") {
    Index <- rowSums(Species>0, na.rm = TRUE)
  }
  if (Choice=="Total Abundance") {
    Index <- rowSums(Species, na.rm = TRUE)
  }
  if (Choice=="Shannon") {
    RS <- rowSums(Species, na.rm=TRUE)
    prop <- Species / RS
    Index <- -rowSums(prop * log10(prop), na.rm= TRUE)
  }
  list(Index=Index, MyChoice= Choice)
}
#chayham
Index.function(Species,"Shannon")
Index.function(Species,"Total Abundance")
Index.function(Species,"Richness")
