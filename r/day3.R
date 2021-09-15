##

quantile(mtcars$mpg)

cut(mtcars$mpg, 
    breaks = quantile(mtcars$mpg),
    labels = c("Q1", "Q2", "Q3", "Q4"))


## if-else

score <- 60

if (score > 80){
  print("Excellent")
} else {
  print("Study harder")
}


## for loop

for (i in 1:10){
  print(i)
}


## switch

type <- "apple"

switch (type,
  "apple" = paste("delicious"),
  "lemon" = paste("sour")
)


## aggregate

mean(chickwts$weight)
aggregate(weight ~ feed, data = chickwts,
          mean)


## apply

mean(cars$speed)

apply(cars, 2, mean)
apply(cars, 2, max)


##
x <- seq(1, 20, by = 0.1)
y <- cos(x)
plot(x, y, type = "l")


## Pipe operator
x %>%
  cos() %>% 
  plot(type = "l", col = "red")

y <- x %>% 
  cos()


##
x <- table(mtcars$cyl)
barplot(x)

table(mtcars$cyl) %>% 
  barplot()


## histogram
hist(chickwts$weight)

chickwts$weight %>% 
  hist()

## box plot
boxplot(weight ~ feed, data = chickwts)

chickwts %>% 
  boxplot(weight ~ feed, data = .) ## chickwts 값을 .에 넣어라는 의미


x <- 1:10
x %>% 
  exp() %>% 
  log() %>% 
  hist()


## mutate
cars$kph_speed <- cars$speed * 1.61
cars$m_dist <- cars$dist * 0.304
cars$ratio <- cars$m_dist/cars$kph_speed

cars <- cars

cars %>% 
  mutate(ratio = (dist * 0.304) / (speed * 1.61)) %>% 
  head()

##
chickwts %>% 
  mutate(log_weight = log(weight),
         check = if_else(weight > median(weight), "Upper", "lower")) %>% 
  head()


##
set.seed(7201)
df <- round(rnorm(n = 10, mean = 95, sd = 50), 0) ## 평균이 95고 분산이 16

df_mean <- mean(df)
df_se <- 50/sqrt(10)

(1-pnorm(q = df_mean, mean = 100, sd = df_se))*2 ## 양쪽이라 2를 곱해 줌


## 예제2

drink <- c(99, 97, 102, 88, 103, 91)

drink_mean <- mean(drink)
drink_se <- sd(drink)/sqrt(6)

pnorm(q = drink_mean, mean = 100, sd = drink_se) * 2


##

set.seed(7201)

df <- round(rnorm(n=10, mean=95, sd=16))

df_mean <- mean(df)
df_se <- sd(df)/sqrt(10)

z_value <- (df_mean - 100)/df_se

pnorm(z_value, mean = 0, sd = 1) * 2
