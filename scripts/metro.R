# library
library(ggridges)
library(ggplot2)
library(tidyverse)
library(ggthemes)
library(ggtext)

metro <- read.csv('metro/afluencia_simple.csv')
# metro <- subset(metro, anio==2022)

#metro <-metro %>%
 # group_by(anio, linea) %>% 
  #summarise(afluencia_por_anio = sum(afluencia))

metro <-metro %>%
  group_by(anio, linea, mes, estacion) %>% 
  summarise(afluencia_por_anio = sum(afluencia))

#metro <- subset(metro, anio==2023)
metro <- subset(metro, subset = anio == 2022 & linea == "Linea 2")

ggplot(metro, aes(fill=estacion, y=afluencia_por_anio, x=estacion)) + 
 geom_bar(position="dodge", stat="identity") +
 facet_wrap(~ mes) +
  labs(x=NULL,
       y=NULL,
       title = "AFLUENCIA L2 STCM 2022",
       subtitle = "DESGLOSE POR MES",
       caption = "<br>**Data:** Portal de datos abiertos CDMX | **Plot:** @el_dato_mx, @foreverpelon") +
  theme_wsj() +
  theme(
    #panel.grid.minor = element_blank(),
    #panel.grid.major.y = element_blank(),
    plot.title = element_text(face = "bold", size = 10),
    plot.subtitle = element_text(size = 8, face = "bold"),
    plot.caption = element_markdown(size = 6),
    axis.text = element_blank(),
    axis.text.y = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.y = element_blank()
  ) +
  scale_colour_wsj("colors6")

ggplot(metro, aes(fill=linea, y=afluencia_por_anio, x=linea)) + 
  geom_bar(position="dodge", stat="identity") +
  facet_wrap(mes ~ anio) +
  labs(x=NULL,
       y=NULL,
       title = "AFLUENCIA STCM 2023",
       subtitle = "DESGLOSE POR MES Y LINEA",
       caption = "<br>**Data:** Portal de datos abiertos CDMX | **Plot:** @el_dato_mx, @foreverpelon") +
  theme_wsj() +
  theme(
  #panel.grid.minor = element_blank(),
  #panel.grid.major.y = element_blank(),
  plot.title = element_text(face = "bold", size = 10),
  plot.subtitle = element_text(size = 8, face = "bold"),
  plot.caption = element_markdown(size = 6),
  axis.text = element_blank(),
  axis.text.y = element_blank(),
  axis.text.x = element_blank(),
  axis.ticks.y = element_blank()
  ) +
  scale_colour_wsj("colors6")

ggplot(metro, aes(y=afluencia_por_anio, x=linea)) +
  geom_density_ridges()
