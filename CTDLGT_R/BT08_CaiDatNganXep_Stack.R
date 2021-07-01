library(dequer)
s <- stack()
for (i in 1:3) push(s, i)
str(s)
## stack of 3
##  $ : int 3
##  $ : int 2
##  $ : int 1

pop(s)
## [1] 3
str(s)
## stack of 2
##  $ : int 2
##  $ : int 1