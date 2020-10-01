#============================================================================#
#================================= AULA 4.1 =================================#
#============================================================================#

# Inicio
rm(list = ls())

# carregando os pacotes
pacman::p_load(rio, tidyverse, janitor)

# abrindo a base
setwd("C:/Users/RX/Desktop/Aula R")
hogwarts <- import("Hogwarts.sav")

# olhando as variaveus da base
glimpse(hogwarts)

# Renomeando as variaveis
hogwarts <- hogwarts %>% 
  rename(genero = gender, 
         raca = race, 
         idade = age, 
         ano = year, 
         casa = house,
         pontos = points, 
         pai_origem = fa.orign, 
         mae_origem = mo.orign)

# verificando se as mudancas deram certo
glimpse(hogwarts)

# Resumo das variaveis, procurando por erros
summary(hogwarts)

# Verificar melhor com tabyl idade, pontos e raca
hogwarts %>% 
  tabyl(idade)

hogwarts %>% 
  tabyl(pontos)

hogwarts %>% 
  tabyl(raca)

# Idade com valor 0 trocar para NA
# Pontos com valor 9999 trocar para NA
# Remover NA de todas as bases
hogwarts <- hogwarts %>% 
  mutate(idade = na_if(idade, 0)) %>% 
  mutate(pontos = na_if(pontos, 9999)) %>% 
  drop_na()

# verificando se as mudancas deram certo
summary(hogwarts)

# Renomeando as categorias de genero e verificando com tabyl se deu certo
hogwarts <- hogwarts %>% 
  mutate(genero = case_when(genero == 1 ~ "Feminino",
                            genero == 2 ~ "Masculino",
                            genero == 3 ~ "Outro"))

# Tabyl de genero para ver os resultados
hogwarts %>% 
  tabyl(genero) %>% 
  arrange(desc(n)) #Organizando em ordem decrescente de n

# Renomeando as categorias de raca e verificando com tabyl se deu certo
hogwarts <- hogwarts %>% 
  mutate(raca = case_when(raca == 1 ~ "Branco",
                          raca == 2 ~ "Pardo",
                          raca == 3 ~ "Preto",
                          raca == 4 ~ "Outro"))

# Tabyl de raca para ver os resultados
hogwarts %>% 
  tabyl(raca) %>% 
  arrange(-n) #Organizando em ordem decrescente de n, forma 2


# Renomeando as categorias de casa e verificando com tabyl se deu certo
hogwarts <- hogwarts %>% 
  mutate(casa = case_when(casa == 1 ~ "Lufa-lufa",
                          casa == 2 ~ "Corvinal",
                          casa == 3 ~ "Grifinoria",
                          casa == 4 ~ "Sonserina"))

# Tabyl de casa para ver os resultados
hogwarts %>% 
  tabyl(casa) %>% 
  arrange(desc(n))


# Renomeando as categorias de origem e verificando com tabyl se deu certo
hogwarts <- hogwarts %>% 
  mutate(pai_origem = case_when(pai_origem == 1 ~ "Bruxo",
                                pai_origem == 2 ~ "Trouxa"),
         
         mae_origem = case_when(mae_origem == 1 ~ "Bruxo",
                                mae_origem == 2 ~ "Trouxa"))

# Tabyl de origem para ver os resultados
hogwarts %>% 
  tabyl(pai_origem) %>% 
  arrange(desc(n))

hogwarts %>% 
  tabyl(mae_origem) %>% 
  arrange(desc(n))

# Criando nova variavel para ver quem contribuiu com pontos
hogwarts <- hogwarts %>%
  mutate(contribuiu = if_else(pontos > 0,"sim", "nao"))


# Resumo das variaveis, procurando por erros
glimpse(hogwarts)
summary(hogwarts)

# Tudo parece certo, exportando usando R
export(hogwarts, "Hogwarts tidied.sav")

# Recomendo criar sempre um scrpit apenas para arrumar uma base e depois de
# realizada as mudancas que queria, exportar uma nova base. Ao fazer suas
# analises utilize o arquivo da base exportada com as mudancas ja realizadas










