##R fundatmentals
## Vectors in R
Vec = seq(1,5)
Vec1 = c(1,2,3,4,5)
Vec%*%Vec1 ## Got a number

## Matrix in R
Mat <- matrix(seq(1,5))
Mat1 <- t(Mat)
Mat1%*%Mat

Mat2 <- matrix(seq(1,6),nrow =2,ncol = 3)
Mat3 <- matrix(seq(1,6),nrow = 2,ncol = 3,byrow = T)

## Data Frame in R
Df <- data.frame(cA=c(1,2,3),cB=c(4,5,6),cC=c(7,8,9),row.names = c("rA",'rB','rC'))
Mat4 <- as.matrix(Df)


setwd('C:\\Users\\Xin\\Desktop\\Github-repo\\Independent_Data_Science_Projects\\Linear_Regression_R_Fundamentals')

toluca <- read.table("Data.txt",header=F) ## toluca is 2D list, or say dataframe
## read.table and read.csv both save the data as dataframe
toluca[1]
toluca[2]
typeof(toluca[1]) ## a list
toluca <- as.matrix(toluca) ## Now this is a matrix
toluca[2]
toluca[,1] ## this is a column vector
t(toluca[,1]) ## This is a row vector
typeof(toluca[,1])

toluca <- read.table("Data.txt",header=F,col.names=c("X","Y"))
## toluca is a list (2D)

toluca <- read.csv("Data.csv.txt",header=F,col.names = c('X','Y'))
toluca$X



attach(toluca)

toluca

plot(X,Y) ## X and Y are two column vectors

n <- length(Y)

mean_x <- mean(X); mean_y <- mean(Y)
var_x <- var(X);  var_y <- var(Y);  cov_xy <- cov(X,Y)

SS_xx <- (n-1)*var_x
SS_xy <- (n-1)*cov_xy
SS_yy <- (n-1)*var_y

b1 <- SS_xy/SS_xx
b0 <- mean_y - b1*mean_x

yhat <- b0 + b1*X
e <- Y-yhat

SSE <- sum(e^2)
MSE <- SSE/(n-2)
s <- sqrt(MSE)

print(cbind(mean_x,mean_y))
print(cbind(SS_xx,SS_xy,SS_yy))
print(cbind(b0,b1))
print(cbind(Y,yhat,e))


plot(X,Y,xlim=c(0,125))
abline(a=b0,b=b1, col='red')  
