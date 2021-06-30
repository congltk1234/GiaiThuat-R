ucln<-function(a,b){
  if(b==0){
    return(a)}
  else if (a==0) {
    return(b)}
  ucln(b,a%%b)
}

a<-readline('Nhap a:')
a<-as.integer(a)
b<-readline('Nhap b:')
b<-as.integer(b)
cat('UCLN của',a,'và',b,'là:',ucln(a,b))
