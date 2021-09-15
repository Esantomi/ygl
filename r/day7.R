library(tidyverse)
library(car)

##
ToothGrowth %>% 
  leveneTest(len ~ supp*dose, data = .)


## Normality
ToothGrowth <- ToothGrowth %>% 
  mutate(supp = factor(supp),
         dose = factor(dose))

ToothGrowth %>% 
  group_by(supp, dose) %>% 
  mutate(shapi = list(shapiro.test(len)$p.value))


##
aov.result1 <- ToothGrowth %>% 
  aov(len ~ supp+dose, data = .)

aov.result2 <- ToothGrowth %>% 
  aov(len ~ supp*dose, data = .)

summary(aov.result2)


##
with(ToothGrowth, stats::interaction.plot(dose, supp, len, fun = mean,
                                          main = "Interaction Plot"))

TukeyHSD(aov.result2)



## linear regression
cars %>% 
  lm(dist ~ speed, data = .) %>% 
  summary()


## multiple regression
mtcars %>% 
  lm(mpg ~ wt, data = .) %>% 
  summary()

lm.result <- mtcars %>% 
  lm(mpg ~ wt, data = .)

plot(lm.result)


mtcars %>% 
  lm(mpg ~ wt + factor(cyl) + factor(am), data = .) %>% 
  summary()

mtcars %>% 
  lm(mpg ~ wt*factor(cyl), data = .) %>% 
  summary()



## Scatter plot

?plot
head(cars)

plot(x = cars$speed, y = cars$dist)
plot(dist ~ speed, data = cars)

?pch

cars %>% 
  plot(dist ~ speed, data = .,
       main = "Speed vs Distance",
       xlab = "Speed (km/s)",
       ylab = "Distance (m)",
       pch = 19,
       cex = 2, cex.main = 1.5, cex.lab = 1, cex.axis = 1,
       font.main = 8, font.lab = 3, font.axis = 3,
       col = "red", col.main = "blue", col.lab = "blue")

palette()

plot(1:10, cex = 3, pch = 19, col = 1:10)


## mtcars mpg vs wt 

mtcars %>% 
  plot(mpg ~ wt, data = .,
       main = "mpg vs wt",
       pch = 16)


## RColorBrewer

install.packages("RcolorBrewer")
library(RColorBrewer)

display.brewer.all()

mycolor <- brewer.pal(n = 8, name = "Accent")
palette(mycolor)
palette()

mycolor2 <- brewer.pal(n = 8, name = "Set3")
palette(mycolor2)

plot(1:10, col = 1:10, pch = 19, cex = 4)

palette("default")


##
## regression fitting line 넣기
## a = intercept, b = slope
## abline(a = NULL, b = NULL, h = NULL, v = NULL, reg = NULL,
## coef = NULL, untf = FALSE, ...)


cars %>% 
  plot(dist ~ speed, data = .,
       pch = 19, cex = 2,
       main = "Speed vs Distance")
  abline(lm(dist ~ speed, data = cars),
         col = "red")
  text(x = 7, y = 110,
       label = "Y = -17.6 + 3.93x", col = "red", cex = 1.5)


coef(lm.result) ## 계수 보기

lm.result <- cars %>% 
  lm(dist ~ speed, data = .)

lm.result$coefficients[1] ## Intercept 뽑기
lm.result$coefficients[2] ## Speed 뽑기


## Ginzberg depression = Y, fatalism = X
## scatter polot, fitted line and regression result

palette(mycolor)

Ginzberg %>% 
  plot(Ginzberg$depression ~ Ginzberg$fatalism, data = .,
       cex = 1.5, pch = 19, col = 1) 
  abline(lm(depression ~ fatalism, data = Ginzberg),
         col = "red", lwd = 2)
  text(0.4, 2.2, labels = "Y = 0.34 + 0.66x, p < 0.001", col = 5, font = 3)

lm.result2 <- Ginzberg %>% 
  lm(depression ~ fatalism, data = .)

lm(depression ~ fatalism, data = Ginzberg) %>% 
  summary()

coef(lm.result2)


## data = iris, Septal.length vs Septal.width

png(filename = "myplot.png", width = 980, height = 600)

iris %>% 
  plot(Sepal.Width ~ Sepal.Length, data = .,
       cex = 2, pch = 19,
       col = iris$Species, ## 종 별로 색깔
       main = "IRIS")
legend("topright", legend = c("setosa", "versicolor", "virginica"),
       pch = 19, col = 1:3, bty = "n", cex = 1, pt.cex = 2) ## 범례

## abline(lm(Sepal.Width ~ Sepal.Length, data = iris),
##       col = "red", lwd = 2)


dev.off()


## abline 3개 구하기
iris %>% 
  filter(Species == "setosa") %>% 
  lm(Sepal.With ~ Sepal.Length, data = .) %>% 
  coef()


## bar plot 그리기
mytable <- table(mtcars$vs, mtcars$cyl,
      dnn = c("Engine", "cyl"))

barplot(mytable, beside = T,
        main = "Engine type vs Cyliinder number",
        xlab = "Cylinder number",
        ylab = "Frequency",
        names.arg = c("4기통", "6기통", "8기통"),
        cex.main = 1.3, cex.lab = 1.2,
        font.main = 3, font.lab = 3,
        ylim = c(0,18),
        legend.text = c("V-shape", "Straight"),
        args.legend = list(x = "topleft", bty = "n"))


## VS vs AM
