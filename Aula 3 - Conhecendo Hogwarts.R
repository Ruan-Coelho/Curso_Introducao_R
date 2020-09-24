#=============================================================================#
#================================== AULA 2 ===================================#
#=============================================================================#

# Inicio
rm(list = ls())

# carregando os pacotes
pacman::p_load(rio, tidyverse, janitor, stargazer)


# abrindo a base
setwd("C:/Users/RX/Desktop/Aula R")
hogwarts <- import("Hogwarts.sav")


# olhando a base
glimpse(hogwarts)

# Resumo das variÃ¡veis no dataframe copa
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

# Filtrando o valor de uma observaÃ§Ã£o (linha)
copa %>% 
  filter(ano == 2019)

# Filtrando e atribuindo a um novo objeto
copa_19 <- copa %>% 
  filter(ano == 2019)

# Visualizado uma sintese das variaveis escolhidas
glimpse(copa_19)
summary(copa_19)

#=============================================================================#
#================================== AULA 3 ===================================#
#=============================================================================#

# Tabela de frequencia da variavel 'casa'
copa_19 %>% 
  tabyl(casa)

# Mesma tabela mas com formatacao em % com 2 digitos decimais
copa_19 %>% 
  tabyl(casa) %>% 
  adorn_pct_formatting(digits = 2)

# Tabela de frequencia da variavel 'ano'
copa_19 %>% 
  tabyl(ano) %>% 
  adorn_pct_formatting(digits = 0)

# Transformando o ano 2019 em 19
copa_19 %>%
  mutate(ano = 19)

# Transformando o ano 2019 em 19, forma 2
copa_19 %>%
  mutate(ano = ano - 2000)

# Transformando os nomes dos valores
copa_19 <- copa_19 %>%
  mutate(casa = case_when(casa == 1 ~ "Lufa-lufa",
                          casa == 2 ~ "Corvinal",
                          casa == 3 ~ "Grifinória",
                          casa == 4 ~ "Sonserina"))

# Criando nova variável para ver quem contribuiu com pontos
copa_19 <- copa_19 %>%
  mutate(contribuiu = if_else(pontos > 0,"sim", "não"))

# Transformando em NA valores 9999 na variavel pontos            
copa_19 <- copa_19 %>%
  mutate(pontos = na_if(pontos, 9999))
         
# Tirar NA da base
copa_19 <- copa_19 %>% 
  drop_na(pontos)

# Tabela cruzada de quem contribuiu 
copa_19 %>%
  tabyl(casa, contribuiu)

# Tabela cruzada com porcentagem em relação as linhas
copa_19 %>%
  tabyl(casa, contribuiu) %>% 
  adorn_percentages() %>% 
  adorn_pct_formatting(digits = 2)

# Mesma coisa de cima, especificar "row" é opcional
copa_19 %>%
  tabyl(casa, contribuiu) %>% 
  adorn_percentages("row") %>% 
  adorn_pct_formatting(digits = 2)

# Tabela cruzada com porcentagem em relação as colunas
copa_19 %>%
  tabyl(casa, contribuiu) %>% 
  adorn_percentages("col") %>% 
  adorn_pct_formatting(digits = 2)

# Tabela cruzada com porcentagem em relação a tudo
copa_19 %>%
  tabyl(casa, contribuiu) %>% 
  adorn_percentages("all") %>% 
  adorn_pct_formatting(digits = 2) %>% 
  adorn_ns()























