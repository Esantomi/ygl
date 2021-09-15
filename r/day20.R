library(tidyverse)
library(leaflet)

a <- leaflet()

leaflet() %>% 
  addTiles() %>% 
  addMarkers(lat = 37.55,
             lng = 127.07,
             label = "영우 글로벌",
             popup = "영우 글로벌")

df <- data.frame(lat = runif(6, min = 37.52, max = 37.56),
                 lng = runif(6, min = 127.06, max = 127.08),
                 name = LETTERS[1:6])

df %>% 
  leaflet() %>% 
  addTiles() %>% 
  # addMarkers(label = df$name) %>% 
  addCircles(lat = ~lat, lng = ~lng,
             radius = 50, color = "red")

library(leaflet.extras)

mean_lng <- mean(quakes$long)
mean_lat <- mean(quakes$lat)

quakes %>% 
  leaflet() %>% 
  addProviderTiles(providers$OperaStreetMap) %>% 
  setView(lng = mean_lng, lat = mean_lat, zoom = 5) %>% 
  addHeatmap(lng = ~long, lat = ~lat, intensity = ~mag,
             radius = 10, max = 10, blur = 20)


## starbucks

starbucks <- read.csv('/home/esantomi/R/starbucks.csv', 
               header=T,
               fileEncoding = 'euc-kr',
               encoding = 'utf-8')

starbucks$income <- rnorm(dim(starbucks)[1], 100, 100)^2

starbucks %>% 
  leaflet() %>% 
  addProviderTiles(providers$OpenStreetMap) %>% 
  setView(lng = mean(starbucks$경도),
          lat = mean(starbucks$위도), zoom = 5) %>% 
  addHeatmap(lng = ~경도, lat = ~위도, intensity = ~income, 
             radius = 10, max = 1, blur = 20)

head(starbucks)
view(starbucks)


## 3d
ggfaithful <- faithful %>% 
  ggplot(aes(x = eruptions, y = waiting)) +
  stat_density_2d(aes(fill = stat(nlevel)),
                  geom = "polygon",
                  n = 100, bins = 100) + 
  xlim(0, 6) + ylim(20, 110)

library(rayshader)
plot_gg(ggfaithful)

# hist(faithful$eruptions, nclass =100)


## diamond 3d example
library(rgl)

ggdiamonds <- diamonds %>% 
  ggplot(aes(x = x, y = depth)) + 
  stat_density_2d(aes(fill = stat(nlevel)),
                  geom = "polygon",
                  n = 100, bins = 100) +
  scale_fill_viridis_c(option = "A") +
  facet_wrap(clarity ~.)

plot_gg(ggdiamonds,
        width = 5, height = 5, multicore = T,
        scale = 250, theta = 10, phi = 90,
        windowsize = c(600, 600))

rglwidget()


## render_movie

install.packages("av")
library(av)

render_movie(filename = "ggdiamonds",
             type = "orbit", theta = 60, phi = 45)


## gganimate

install.packages("gganimate")
library(gganimate)

iris %>% 
  plot(Petal.Length ~ Petal.Width, data = .)

p1 <- iris %>% 
  ggplot(aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point(size = 4, alpha = .6)

p2 <- p1 +
  transition_states(states = Species,
                    transition_length = 0.1,
                    state_length = 0.5) +
  ease_aes("linear") +
  labs(title = paste("Iris type: {closest_state}")) +
  enter_fade() +
  exit_fade()

animate(p2, renderer = av_renderer())


##
view(population)

datpot <- population %>% 
  pivot_longer(contains("male"), names_to = "gender",
               values_to = "population")

pp <-  datpot %>% 
  ggplot(aes(x = age2, 
             y = if_else(gender == "male", population,
                         -population),
             fill = gender)) + 
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = paste("한국 연령 : {frame_time}"),
       x = "연령", y = "인구수") + 
  transition_time(year) + ease_aes("linear") +
  scale_y_continuous(breaks = seq(-5*10^5, 5*10^5, 2.5*10^5),
                     labels = paste(abs(seq(-5*10^5, 5*10^5, 2.5*10^5))))
          

## dashboard
install.packages("flexdashboard")
