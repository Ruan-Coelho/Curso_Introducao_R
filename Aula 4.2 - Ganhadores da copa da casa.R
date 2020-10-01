#==============================================================================#
#================================== AULA 4.2 ==================================#
#==============================================================================#

# Inicio
rm(list = ls())

# carregando os pacotes
pacman::p_load(rio, tidyverse, janitor)

# abrindo a base
setwd("C:/Users/RX/Desktop/Aula R")
hogwarts <- import("Hogwarts tidied.sav")

# Olhando a base
glimpse(hogwarts)
summary(hogwarts)

# Descobrindo quem foi a casa que ganhou no ano de 2019
hogwarts %>% 
  filter(ano == 2019) %>% 
  tabyl(pontos, casa)

# Se fizermos a tabela cruzada, retorna o numero de casos de cada uma das
# opcoes de pontos que existem na base. Por exemplo, 2 pessos fizeram o pontos
# na GrifinÃ³ria enquanto 1 fez 0 na lufa-lufa. Nao e isso que queremos

# Precisamos somar o valor de cada aluno em cada casa, fazemos isso da
# seguinte forma:
hogwarts %>% 
  filter(ano == 2019) %>% 
  group_by(casa) %>% 
  summarise(sum(pontos))

# Primeiro filtramos apenas o ano de 2019, depois pedimos ele para agrupar os
# dados por casa usando o group_by() e deopois somar usando sum() dentro de
# summarise.
#
# Se nao agrupassemos usando o group_by iriamos acabar somando todos os pontos
# de todos os alunos da base e nao apenas os dos alunos dentro de cada casa.
#
# O summarise() basicamente permite gerar uma tabela, precisamos apenas
# indicar o que sera as colunas. Usamos sum() dos pontos, mas poderia ser
# mean(), por exemplo.
#
# Podemos especificar o nome da coluna antes da operacao a ser feita
hogwarts %>% 
  filter(ano == 2019) %>% 
  group_by(casa) %>% 
  summarise(pts = sum(pontos), media = mean(pontos))

# Obs: evite dar o mesmo nome das variaveis para as colunas caso va fazer mais
# de uma coluna no summarise(). Vejo no exemplo a seguir, quando ele vai tirar
# a media de pontos, ele acha que "pontos" e a coluna que vc acabou de criar e
# nao a variavel pontos da base.
hogwarts %>% 
  filter(ano == 2019) %>% 
  group_by(casa) %>% 
  summarise(pontos = sum(pontos), media = mean(pontos))

# Originalmente estava em ordem alfabetica de casa, agora em ordem crescente de
# pontos
hogwarts %>% 
  filter(ano == 2019) %>% 
  group_by(casa) %>% 
  summarise(pts = sum(pontos)) %>%
  arrange(pts)

# Podemos inverter isso com a funcao desc(). 
hogwarts %>% 
  filter(ano == 2019) %>% 
  group_by(casa) %>% 
  summarise(pts = sum(pontos)) %>%
  arrange(desc(pts))

# Podemos usar também a função slice para mostrar os maiores valores
hogwarts %>% 
  filter(ano == 2019) %>% 
  group_by(casa) %>% 
  summarise(pts = sum(pontos)) %>% 
  slice_max(pts, n = 1)

# Caso queira fazer de todos 
hogwarts %>% 
  group_by(casa, ano) %>% 
  summarise(pts= sum(pontos)) %>% 
  print(n = 28) # garantindo que vai mostrar mais do que as 10 primeiras linhas

# Deixando a tabela mais facil de ver
hogwarts %>% 
  group_by(casa, ano) %>% 
  summarise(pts= sum(pontos)) %>%  
  pivot_wider(names_from = ano, values_from = pts) # nova versao de spread()

# Quando usando o slice, a ordem na qual foi agrupado importa. O que foi 
# especificado primeiro (casa) vai ser onde ele vai procuar o maior valor.
# No caso abaixo, ele vai buscar o maior valor da casa em cada ano
hogwarts %>% 
  group_by(casa, ano) %>% 
  summarise(pts= sum(pontos)) %>%  
  slice_max(pts, n = 1) 

# Ao inveter, teremos o maior valor de cada ano em cada casa
hogwarts %>% 
  group_by(ano, casa) %>% 
  summarise(pts= sum(pontos)) %>%  
  slice_max(pts, n = 1) 

#==============================================================================#
#================================ Curiosidade =================================#
#==============================================================================#

# Pode ser usado no lugar de tabyl, mas eh mais complicado
# Tabyl 
hogwarts %>% 
  tabyl(casa, genero)

# Tidyvse, n() retorna o numero de casos
hogwarts %>% 
  group_by(casa, genero) %>% 
  summarise(n = n()) %>% 
  pivot_wider(names_from = genero, values_from = n)

# Tidyverse tem o tally() que faz o summarise do numero de casos automatico
hogwarts %>% 
  group_by(casa, genero) %>% 
  tally() %>% 
  pivot_wider(names_from = genero, values_from = n)

# Melhor ainda, e possivel usar a funcao count, que basicamente substitiu tanto
# o group_by e tambem o summarize. E o mais proximo do tabyl que chegamos, mas 
# ainda assim ee fornece a tabela em formato long ao inves de wide. Tambem nao
# conseguimos gerar facilmente a frequencia em proporcional (porcentagem)
hogwarts %>% 
  count(casa, genero) %>% 
  pivot_wider(names_from = genero, values_from = n)

# Como tabyl simplifca a vida, recomendo sempre usar ele a menos que precise 
# fazer tabelas mais complexas, como as de soma ou media.
