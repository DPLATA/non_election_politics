library(ggplot2) #Para hacer las gráficas
library(tidyverse) #un conjunto de paquetes para transformar y comunicar datos
library(sf) #Para representar los objetos geográficos como objetos nativos de R en listas, matrices o vectores
library(ggspatial) #Una versión de ggplot para añadir fondos a mapas

capa1 <- st_read("areas_naturales_protegidas/areas_naturales_protegidas.shp")
viv_sin_drenaje <- st_read("viv_sin_drenaje/Viv_sin_drenaje.shp")
transporte_publico_por_mzn <- st_read("transporte_publico_por_mzn/manzanas_zmvm.shp")

capa1 %>%
  ggplot() +
  annotation_map_tile(type = "hotstyle", zoomin = 0) +
  geom_sf(aes(geometry=geometry, color = categor, fill = categor)) +
  theme_void() +
  labs(title = "", subtitle = "2019", caption = "@el_dato_mx, @foreverpelon") +
  theme(plot.title = element_text(hjust = .5, vjust = 1, size = 10),
        plot.subtitle = element_text(hjust = .5, vjust = 1, size = 8),
        plot.caption = element_text(hjust = .1, size = 7),
        legend.title = element_text(size = 10),
        legend.position="bottom")


capa1

transporte_publico_por_mzn %>%
  ggplot() +
  annotation_map_tile(type = "hotstyle", zoomin = 0) +
  geom_sf(aes(geometry=geometry, color = Metro, fill = Metro)) +
  theme_void() +
  labs(title = "", subtitle = "2019", caption = "@el_dato_mx, @foreverpelon") +
  theme(plot.title = element_text(hjust = .5, vjust = 1, size = 10),
        plot.subtitle = element_text(hjust = .5, vjust = 1, size = 8),
        plot.caption = element_text(hjust = .1, size = 7),
        legend.title = element_text(size = 10),
        legend.position="bottom")


