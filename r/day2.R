df <- c(2, 3, 5, 7, 9, 10)
summary(df)
fivenum(df)

set.seed(202103)
df <- c(round(runif(6, 10, 20), 0))

df <- c(12, 14, 18, 18, 19, 20)
summary(df)

mydf <- table(mtcars$cyl, mtcars$vs,
              dnn = list(c = "Cylinder",
                         r = "Transmission"))
barplot(mydf, beside = T, legend.text = T)

##
my_tbl <- table(mtcars$cyl)
barplot(my_tbl)

## 분할표
my_df2 <- table(mtcars$cyl, mtcars$am)
barplot(my_df2, beside = T, legend.text = T)

## CORRELATION
x <- c(88, 55, 66, 62, 69)
y <- c

mean(x)
mean(y)

varx <- sum((x-68)^2)/4
vary <- sum((y-67.6)^2)/4
sdx <- sqrt(varx)
sdy <- sqrt(vary)

Covxy <- sum((x-68)*(y-67.6))/4

r <- Covxy/(sdx*sdy)

df <- data.frame(x = x, y = y)
plot(df)
abline(lm(y~x, data = df), col="red")



##
a <- c(1:10) ## Numeric type
b <- c(TRUE, FALSE, FALSE) ## Boolean
c <- c("Red", "Blue", "Black") ## Character

print(a)

## vector 타입 만들기
mydf <- vector("character", length = 5)
mydf_logi <- vector("logical", length = 5)

## matrix 타입 만들기
mymat <- matrix(data = 1:12, nrow = 3,
                byrow = F,
                dimnames = list(rname = c("r1", "r2", "r3"),
                                cname = c("c1", "c2", "c3", "c4"))) ## nrow를 2로 하면 column이 6개 생김김
mymat

mymat[2,3] ## [row, column] 형식. 8을 뽑을 때
mymat[2:3,3] ## 2-3번째 row와 3번째 column
mymat[1,] ## 1번째 row만 출력
mymat[1, c(1,3)] ## 1번째 row의 1, 3번째 column

mydf <- data.frame(v1 = c(1:4),
                   v2 = letters[1:4],
                   v3 = vector("logical", length = 4))
mydf$v2 ## 내부 변수가 열림

## list
mylist <- list(academy = "YOUNG WOO",
               class = "Data Science",
               score = c(89, 88))
mylist[[1]]


## Data View (객체 탐색을 위한 함수)
boxplot(weight ~ feed, data = chickwts)

head(chickwts) ## 상위 6개 보기
dim(chickwts) ## 데이터 객체의 차원(dimension)


##
mydf_save <- data.frame(v1 = c(1:4),
                   v2 = letters[1:4],
                   v3 = vector("logical", length = 4))
mydf_save
write.csv(x = mydf_save,
          file = "mydf_save.csv")

##
library(readxl)
install.packages("xlsx") # 엑셀 패키지 설치
install.packages("rJava") # rjava 설치치


## bind
xx <- 1:4
yy <- 5:8
cbind(xx, yy)
rbind(xx, yy)

x <- c(1/0, NA, 2, NA, NaN)
is.na(x)
is.infinite(x)
is.nan(x)
which(is.na(x))


class(mymat)
mymat_df <- as.data.frame(mymat)
class(mymat_df)


## R Basic Fucntion
seq(from = 1, to = 10, by = 2)
seq(1, 10, 2)
seq(1, 10, length.out = 4) # 길이 4만큼 나눔
seq_along(mtcars)
dim(mtcars)


##
rep(1:4, times = 2) # 1:4를 2번 반 복
rep(1:4, each = 2, times = 2) # 각각 두 번씩
rep(1:4, each = 2, times = 2, length.out = 4) # 


## sampling
sample(x = 1:10, size = 5, replace = F)


##
vec1 <- 1:8
vec1 <= 2 | vec1 <= 4
vec1 <= 2 & vec1 <= 4


## Sorting
v1 <- c(40, 35, 32, 50, 22)

sort(v1)
sort(v1, decreasing = T)

sort(v1)
order(v1)
