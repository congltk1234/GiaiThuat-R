x <- seq(-pi,pi,0.1)
plot(x, sin(x))
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)")
#"p" - points
#"l" - lines
#"b" - both points and lines
#"c" - empty points joined by lines
#"o" - overplotted points and lines
#"s" and "S" - stair steps
#"h" - histogram-like vertical lines
#"n" - does not produce any points or lines
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)",
     type="l",
     col="blue")
plot(x, sin(x),
     main="Overlaying Graphs",
     ylab="",
     type="l",
     col="blue")
lines(x,cos(x), col="red")
legend("topleft",
       c("sin(x)","cos(x)"),
       fill=c("blue","red")
)