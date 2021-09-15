## 정규성 검정

set.seed(7201)
df <- rnorm(n = 10, mean = 95, sd = 4)

shapiro.test(df)


df_exp <- rexp(n = 15)
shapiro.test(df_exp)


## mpg, wt 자료 뽑아 plot 그리기

mtcars %>% 
  select(mpg, wt) %>% 
  plot()


## 특정 변수만 제외하고 나머지 변수 추출 (- 기호)

mtcars %>% 
  select(-c(am:carb)) %>% 
  head()


##

iris %>% 
  select(c(Petal.Length, Petal.Width, Species)) %>% 
  head()


iris %>% 
  select(starts_with("Petal"), Species) %>% 
  head()


## 원하는 컬럼을 맨앞으로 두고 정렬
iris %>% 
  select(Species, everything()) %>% 
  head()


## Pe가 들어간 열 찾기
iris %>% 
  select(contains("Pe"), Species) %>% 
  head()


iris %>% 
  select(matches("[pt]al")) %>% 
  head()


iris %>% 
  select(last_col()) %>% 
  head()


## filter
iris %>% 
  filter(Species == "setosa") %>% 
  head()


## TootheGrowth dataset 그리기
ToothGrowth %>% 
boxplot(len ~ supp * dose, data = .)


## supp이 OJ이고 dose가 1인 것만 추출
ToothGrowth %>% 
  filter(supp == "OJ", dose == 1) %>% 
  head()


## row 번호로 추출
ToothGrowth %>% 
  filter(between(row_number(), 5, n())) %>% 
  head()


## 길이의 평균보다 큰 것만 추출
ToothGrowth %>% 
  filter(len > mean(len)) %>% 
  head()



## Group_by (factor별로)
ToothGrowth %>% 
  group_by(supp) %>% 
  filter(len > mean(len))


## Group_by / summarise 함께 사용
ToothGrowth %>% 
  group_by(supp, dose) %>% 
  summarise(mean = mean(len),
            sd = sd(len))


## sort, order

ToothGrowth %>% 
  arrange(desc(len)) %>% 
  head()


## mtcars
mtcars %>% 
  summarise(mean = mean(mpg))

mtcars %>% 
  summarise(mean = mean(mpg),
            sd = sd(mpg),
            median = median(mpg))

## total number 중 mpg 5번째에 위치한 값 추출
mtcars %>% 
  summarise(tot_n = n(),
            n5th = nth(mpg, 5),
            mean = mean(mpg),
            median = median(mpg),
            sd = sd(mpg),
            min = min(mpg),
            iqr = IQR(mpg))


## case_when

x <- 1:10

case_when(
  x %% 2 == 0 ~ "A",
  x %% 5 == 0 ~ "B",
  x %% 3 == 0 ~ "C",
  TRUE ~ as.character(x)
)


##
x <- c(1, 3, 5, 4, 6)
cummean(x)
cumsum(x)


##
PlantGrowth %>% 
  group_by(group) %>% 
  filter(weight >= mean(weight)) %>% 
  summarise(mean = mean(weight))


## t.test

set.seed(1234)
df <- rnorm(n = 10, mean = 95, sd = 4)

t.test(df, alternative = "two.sided",
       mu = 100, conf.level = 0.95)

t.test(df, alternative = "greater",
       mu = 100, conf.level = 0.95)


##
g1 <- c(1.7,3.9,1.6,4.4,2,2.2,2.6,2,0.9,0.7)
g2 <- c(1.2,3.4,2,3.6,2.5,1.4,4.7,2.9)
boxplot(g1, g2)

t.test(x = g1, y = g2,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = T,
       conf.level = 0.95)


##
summary(ToothGrowth)

t.test(len ~ supp, data = ToothGrowth,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = T,
       conf.level = 0.95)


##
chickwts %>% 
  filter(feed == "soybean" | feed == "meatmeal") %>% 
  t.test(weight ~ feed, data = .,
         var.equal = F)


## group 4, 6 간의 mpg 평균에 차이가 있는가?

mtcars %>% 
  filter(cyl == 4 | cyl == 6) %>% 
  t.test(mpg ~ cyl, data = .)


## ToothGrowth

names(ToothGrowth)

oj <- ToothGrowth %>% 
  filter(supp == "OJ")
shapiro.test(oj$len)

ToothGrowth %>% 
  t.test(len ~ supp, data = .)


##
library(car)
library(tidyverse)
ToothGrowth %>% 
  leveneTest(len ~ supp, data = .,
              center = "mean")


## sleep

sleep %>% 
  t.test(extra ~ group, data = .,
         paired = T)
