# limpando a ambiente de trabalho
rm(list = ls())

# carregando todos os pacotes com o pacman
# se necessario, antes: install.packages("pacman")
pacman::p_load(rio, tidyverse, janitor, bit64)

# indicando o diretorio de trabalho e importando a base
setwd("C:/Users/RX/Desktop/Exercicio Flavio/Ex 2")
ces_18 <- import("DM_CURSO.CSV")

# dando uma olhada na base antes de comecar a mexer nela ate mesmo para saber
# qual o nome das variaveis que eu vou querer
glimpse(ces_18)

# selecionando o que foi pedido ao mesmo tempo que renomeando as variaveis
# repare que o select funciona quase como um rename
ces_18 <- ces_18 %>% 
  select(ano = NU_ANO_CENSO, 
         rede = TP_CATEGORIA_ADMINISTRATIVA,
         grau = TP_GRAU_ACADEMICO, 
         modalidade = TP_MODALIDADE_ENSINO,
         matriculas = QT_MATRICULA_TOTAL, 
         nome = NO_CURSO, 
         codigo = CO_CURSO)

# Dando uma olhada agora que selecionei as novas variaveis
glimpse(ces_18)
summary(ces_18)

# Tirando NA de toda a base de uma vez so
ces_18 <- drop_na(ces_18)

################################################################################
# Opção 1 - Mudando os valores para characters
################################################################################

# Recodificando as variaveis categoricas rede, grau e modalidade. Deixei
# especial por nao saber se era publica ou privada
ces_18.1 <- ces_18 %>% 
  mutate(rede = case_when(rede == 1 | 
                          rede == 2 | 
                          rede == 3 ~ "Publica",
                          
                          rede == 4 | 
                          rede == 5 | 
                          rede == 6 |
                          rede == 8 | 
                          rede == 9 ~ "Privada",
                          
                          rede == 7 ~ "Especial"),
         
         
         grau = case_when(grau == 1 ~ "Bacharelado",
                          grau == 2 ~ "Licenciatura",
                          grau == 3 ~ "Tecnologico",
                          grau == 4 ~ "Bacharelado e Licenciatura"),
         
         
         modalidade = case_when(modalidade == 1 ~ "Presencial",
                                modalidade == 2 ~ "Distancia"))
           
# Dando uma olhada novamente
glimpse(ces_18.1)
summary(ces_18.1)

################################################################################
# Opção 2 - Usando factors
################################################################################

# Transformando as 6 categorias de rede em apenas tres (deixei "Especial" por)
# nao saber se era publica ou privada)
ces_18.2 <- ces_18 %>%
  mutate(rede = case_when(rede == 1 | 
                          rede == 2 | 
                          rede == 3 ~ 1, # 1=Publico
                          
                          rede == 4 | 
                          rede == 5 |
                          rede == 6 | 
                          rede == 8 | 
                          rede == 9 ~ 2, # 2=Privado
                          
                          rede == 7 ~ 3)) #3=Especial

# Dando uma olhada na variavel rede e suas categorias           
ces_18.2 %>% 
  tabyl(rede)

# Factor de rede. Como nao especifiquei os levels, ele vai gerar automaticamente
# de acordo com o numemero de categorias que temos (3) em ordem crescente, o que 
# seria 1, 2 e 3
ces_18.2 <- ces_18.2 %>% 
  mutate(rede = factor(rede, labels = c("Publica",
                                        # 1 especificacao = nome da 1a posicao
                                        
                                        "Privada",     
                                        # 2 especificacao = nome da 2a posicao
                                        
                                        "Especial")))
                                        # 3 especificacao = nome da 3a posicao

# Dando uma olhada na variavel rede e suas categorias           
ces_18.2 %>% 
  tabyl(grau)

# Factor de grau. Repara no tabyl que tem apenas 3 categorias. Isso implica que
# se nao especificar os levels em factor, ele vai criar automaticamente apenas
# tres levels na ordem 1, 2 e 3. No entanto, queremos que tenha um quarto level
# que seria referente a "Bacharelado e Licenciatura"
ces_18.2 <- ces_18.2 %>% 
  mutate(grau = factor(grau, labels = c("Bacharelado",  #1
                                        "Licenciatura", #2
                                        "Tecnologico",  #3
                                        "Bacharelado e Licenciatura"))) #4

# Repare que vai dar erro se especificarmos 4 labels para apenas 3 levels (que
# foram gerados automaticamente). Temos duas opcoes: (1) ou deixamos de fora a 
# categoria que nao tem caso nenhum ou entao devemos especificara os 4 levels, 
# deixando evidente que a categoria 4 eh uma possibilidade, mas apesar disso nao 
# tivemos nenhum caso desses na base
ces_18.2 <- ces_18.2 %>% 
  mutate(grau = factor(grau, levels = c(1, 2, 3, 4), #indicando que sao 4 levels
                             labels = c("Bacharelado",  #1
                                        "Licenciatura", #2
                                        "Tecnologico",  #3
                                        "Bacharelado e Licenciatura"))) #4

# No tabyl podemos ver que a caregoria 4 vai aparecer, mas n = 0. Essa eh uma
# das vantagens de se usar factor, em alguns casos queremos saber que nao houve
# casos em um determinada categoria de forma explicita
ces_18.2 %>% 
  tabyl(grau)

# Tabyl de modalidade antes de criar o factor
ces_18.2 %>% 
  tabyl(modalidade)

# Factor de modalidade
ces_18.2 <- ces_18.2 %>% 
  mutate(modalidade = factor(modalidade, labels = c("Presencial", "Distancia")))

################################################################################

# Dando uma olhada para ver como ficou tudo. Uma das vantagens de utilizar os
# factors eh que o summary retorna o numero de casos das categorias de factors
# Repare que em grau a categoria 4 não te nenhum caso.

summary(ces_18.1) # Transformando os dados em chars
summary(ces_18.2) # Usando factors e levels

# Comparando o glimpse da uma ideia que a exibicao eh basicamente a mesma
glimpse(ces_18.1) # Transformando os dados em chars
glimpse(ces_18.2) # Usando factors e levels














