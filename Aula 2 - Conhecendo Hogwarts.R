# Inicio
rm(list = ls())

# carregando os pacotes
library(rio)
library(tidyverse)
library(janitor)

# abrindo a base
setwd("C:/Users/RX/Desktop/Aula R")
hogwarts <- import("Hogwarts.sav")

# olhando a base
glimpse(hogwarts)

# Resumo das variáveis no dataframe copa
summary(hogwarts)

# selecionado apenas variaveis (colunas) desejadas
hogwarts %>% 
  select(house, year, points)

# selecioanndo e atribuindo
copa <- hogwarts %>% 
  select(house, year, points)

# Como posso renomear as variaveis?
copa <- copa %>% 
  rename(casa = house, ano = year, pontos =points)

# Renomear ao selecionar
copa <- hogwarts %>% 
  select(casa = house, ano = year, pontos = points)

# Visualizado a base com as variaveis escolhidas
glimpse(copa)
summary(copa)

# Filtrando o valor de uma observação (linha)
copa %>% 
  filter(ano == 2019)

# Filtrando e atribuindo a um novo objeto
copa_19 <- copa %>% 
  filter(ano == 2019)

# Visualizado uma sintese das variaveis escolhidas
glimpse(copa_19)
summary(copa_19)

