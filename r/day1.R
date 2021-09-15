## mydata
df <- cars

##scala
2+3
3 * pi
3/pi
3^4

23%/%2 ##integer division
23 %% 2 ## 나머지

log(10)
log(10, base = 10)
exp(1)

## vector
x <- c(1:10)
x + 1
2*x+1
x %/% 2

x[3:4] ## index

## mtcars
mtcars <- mtcars
mtcars$cyl

## 도수분포표 (실린더 수)
mtcars_tb <- table(mtcars$cyl)
barplot(mtcars_tb)

## 히스토그램 (연비)
hist(mtcars$mpg)

## 박스플롯
boxplot(mtcars$mpg)

## 플롯
plot(mtcars$wt, mtcars$mpg)

hist(chickwts$weight)
boxplot(chickwts$weight)


## 평균, 중앙값
df <- c(950, 775, 925, 2500, 1150, 850, 975)
mean(df)
median(df)
summary(df)


## 특정 컬럼을 기준으로 통계량 구하기
aggregate(wt ~ cyl,
          data = mtcars,
          summary)

## IQR 구하기
IQR(mtcars$wt)