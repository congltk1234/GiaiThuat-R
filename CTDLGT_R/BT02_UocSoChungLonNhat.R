ucln<-function(a,b){
  if(b==0){
    return(a)}
  else if (a==0) {
    return(b)}
  ucln(b,a%%b)
}

a<-15
b<-20
cat('UCLN của',a,'và',b,'là:',ucln(a,b))
