## Model 의  Bias와 Variance simulation
library(tidyverse)


## MSE of training set ##
df <- tibble(x = seq(-2, 2, length.out = 100),
             y_con = x + 10*x^2 + 10*x^3,
             y = y_con + rnorm(100, 100, 10))

# plot(df$x, df$y, cex = 2)

# df %>% 
# plot(y_con ~ x, lty = 2)

# df %>% 
#   ggplot(aes(x = x, y = y)) +
#   geom_point(size = 2, alpha = 0.5) +
#   geom_smooth(color = "red")

# df %>% 
#   ggplot(aes(x = x, y = y)) +
#   geom_point(size = 2, alpha = 0.5) +
#   geom_smooth(method = "lm", color = "blue")

n <-25
perf_train <- tibble(poly = vector("numeric", n),
                     mse = vector("numeric", n))

for (i in 1:n){
  lm_fit  <- lm(y ~ poly(x, i), data = df)
  predicted_df <- data.frame(y_pre = predict(lm_fit, df), x = df$x)
  perf_train$poly[i] <- i
  perf_train$mse[i] <- sum((df$y - predicted_df$y_pre)^2)/100
  
  p1 <- df %>% 
    ggplot(aes(x = x, y = y)) +
    geom_point() + 
    geom_line(aes(x = x, y = y_pre), color = "red", data =predicted_df ) +
    ggtitle(paste("Polynomial fitting in training set", "Poly ~", i))
  
  plot(p1)
  Sys.sleep(1)
}


## MSE of validation set ##
df <- tibble(x = seq(-2, 2, length.out = 100),
             y_con = x + 10*x^2 + 10*x^3,
             y = y_con + rnorm(100, 100, 10))

set.Seed(1234)
index_sample <- sample(1:nrow(df), size = round(nrow(df)*0.7), replace = F)
train_df <- df[index_sample, ]
validation_df <- df[index_sample, ]

n <-25
perf_validation <- tibble(poly = vector("numeric", n),
                     mse = vector("numeric", n))

for (i in 1:n){
  lm_fit  <- lm(y ~ poly(x, i), data = train_df)
  predicted_df <- data.frame(y_pre = predict(lm_fit, validation_df), x = validation_df$x)
  perf_validation$poly[i] <- i
  perf_validation$mse[i] <- sum((validation_df$y - predicted_df$y_pre)^2)/nrow(validation_df)
  
  p1 <- validation_df %>% 
    ggplot(aes(x = x, y = y)) +
    geom_point() + 
    geom_line(aes(x = x, y = y_pre), color = "red", data =predicted_df ) +
    ggtitle(paste("Polynomial fitting in validation set", "Poly ~", i))
            
  plot(p1)
  Sys.sleep(1)
}


#
perf_validation %>% 
  plot(mse ~poly, type = 'l')