library(ggplot2) #Para hacer las gráficas
library(tidyverse) #un conjunto de paquetes para transformar y comunicar datos
library(sf) #Para representar los objetos geográficos como objetos nativos de R en listas, matrices o vectores
library(ggspatial) #Una versión de ggplot para añadir fondos a mapas

capa1 <- st_read("Puntos de accidentes de Ciclistas/accidentado_ciclista.shp")

capa1 = mutate(capa1, CONDICION=condicion,
               CONDICION = case_when(condicion == "LESIONADO" ~ "1",
                                     condicion == "OCCISO" ~ "2"))

#Luego removeremos los vacíos de datos dentro de la nueva variable: Prioridad
#Guardaremos los cambios en un nuevo dataframe

capa2 <- capa1 %>%
  filter(!is.na(condicion))

#CAPAS DE FONDO
#[1] "osm"                    "opencycle"
##  [3] "hotstyle"               "loviniahike"
##  [5] "loviniacycle"           "hikebike"
##  [7] "hillshade"              "osmgrayscale"
##  [9] "stamenbw"               "stamenwatercolor"
## [11] "osmtransport"           "thunderforestlandscape"
## [13] "thunderforestoutdoors"  "cartodark"
## [15] "cartolight"

capa2 %>%
  ggplot() +
  annotation_map_tile(type = "hotstyle", zoomin = 0) +
  geom_sf(aes(geometry=geometry, color = condicion, fill=condicion )) +
  theme_void() +
  labs(title = "ACCIDENTES CICLISTAS", subtitle = "2019", caption = "@el_dato_mx, @foreverpelon") +
  theme(plot.title = element_text(hjust = .5, vjust = 1, size = 10),
        plot.subtitle = element_text(hjust = .5, vjust = 1, size = 8),
        plot.caption = element_text(hjust = .1, size = 7),
        legend.title = element_text(size = 10),
        legend.position="bottom")


capa2
