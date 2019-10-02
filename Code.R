# Tarea: Comentar el siguiente código.
## Describir brevemente lo que hace cada línea.
## Si no saben que hace una línea, pueden escribirme o googlear la función
## Recuerden hacer comentarios usando #

# importa la libreria tidyverse que sirve para optimizar algoritmos relacionados con data science
library("tidyverse")

# guarda el archivo csv en una variable llamada gap_5060
gap_5060<-readr::read_csv("https://raw.githubusercontent.com/mine-cetinkaya-rundel/reproducibility-uscots15/master/data/gapminder-5060.csv")

# eliges la columna que tenga de nombre "Canada" y la guardamos en la variable "gap_5060_CA"
gap_5060_CA <- gap_5060 %>% filter(country == "Canada")

# grafica la expectativa de vida por año en Canada
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

# nos permite intercambiar un dato en Canada en 1957 por un dato específico, en la variable "gap_5060"
gap_5060 <- gap_5060 %>%
  mutate(lifeExp = replace(lifeExp, (country == "Canada" & year == 1957), 69.96)) %>%
  as.data.frame()

# vuelves aasignar los valores ya modificados en el paso anterior a la variable "gap_5060_CA"
gap_5060_CA <- gap_5060 %>%
  filter(country == "Canada")

# volvemos a graficar
ggplot(data = gap_5060_CA, aes(x = year, y = lifeExp)) +
  geom_line()

# Filtramos para guardar en una nueva variable todos los datos de NA
gap_5060_NA <- gap_5060 %>%
  filter(country %in% c("Canada", "Mexico", "United States"))

# Graficamos la nueva varible con colores
ggplot(data = gap_5060_NA, aes(x = year, y = lifeExp, color = country)) +
  geom_line()