# AULA INTRODUTÓRIA DE R

# Instalação do R Base e do RStudio
# Personalizar o R Studio  
# A importância dos comentários // ctrl(cmd) + shift + C
# O R é, dentre outras coisas, um calculadora

# Ctrl(Command) + Enter para rodar o script

# Adição
5 + 5 

# Subtração
5 - 5 

# Multiplicação
3 * 5

# Divisão
(5 + 5) / 2 

# Exponenciação
2 ^ 5

# Módulo (calculo do resto de uma divisão)
5 %% 2

# Atribuindo uma variável
x <- 10
y <- 5
z <- x+y

# Imprimindo
z

# Outro exemplo
gatos <- 9
caes <- 6
pets <- gatos+caes

# Imprimindo
pets

# Como apagar uma variável
rm(pets)
rm(z)

# Como apagar tudo de uma vez
rm(list = ls())

# TIPOS BÁSICOS DE DADOS
# Qualquer número com decimal (numérico)
decimal <- 3.5
# Qualquer número inteiro (também numérico)
integer <- 3
# Logical: TRUE or FALSE
logical <- TRUE
# Character: palavras ou frases, maísculas e minísculas são diferentes
character <- "gatos" # caracteres sempre entre aspas

# Descobrindo tipo básico de dados
# RStudio sugere funções e objetos
class(decimal)
class(integer)
class(logical)
class(text)
# é possível usar a função str também

# Não é possível somar carcteres
character + 4

# Valores lógicos são booleans: TRUE equivale a 1 e FALSE a 0
T+T
F+F

# Vetores: variáveis que têm vários valores do mesmo tipo
# "c" significa "combine", usa sempre que for mais de um valor
animais <- c("cães", "gatos", "tartarugas")
numeros1 <- c(1, 2, 3, 4) 
numeros2 <- 1:100
boolen <- c(TRUE, FALSE, TRUE)

# Vamos supor que você quer calcular o quanto conseguiu economizar em 3 meses
# Em janeiro você ganhou 109, mas gastou 96
# Em fevereiro você ganhou 126, mas gastou 116
# Em março você ganhou 94, mas gastou 107
rm(list = ls())

# Então temos que: (cada posição representa um mês)
ganhos <- c(1090, 1260, 940, 1070)
gastos <- c(960, 1180, 1110, 1070)

# Dando nome para as posições de cada vetor
names(ganhos) <- c("Janeiro", "Fevereiro", "Março", "Abril")
names(gastos) <- c("Janeiro", "Fevereiro", "Março", "Abril")
# Imprimindo
ganhos
gastos

# Uma forma mais prática, é criar um vetor de nomes e atribuir ele
meses <- c("Janeiro", "Fevereiro", "Março", "Abril")
names(ganhos) <- meses
names(gastos) <- meses
# Imprimindo
ganhos
gastos

# Calculando quanto economizei mensalmente
economia_mensal <- 
economia_mensal

# Calculando quanto economizei em todos os meses
economia_total <- sum()
economia_total
print(economia_total)

# Selecionando uma posição específica do vetor
# Vamos pegar o resultado apenas de um mês específico 
economia_março <- economia_mensal[3]
economia_janeiro <- economia_mensal["Janeiro"]
primeiro_bimestre <- economia_mensal[c(1,2)]
segundo_bimestre <- economia_mensal[3:4]

# Calculando a média de ganhos
mean(ganhos)
mean(economia_mensal)

# COMPARAÇÃO
# Descobrindo que meses eu economizei ou não
economizei <- 
economizei <- 

# Selecionando apenas os meses que economizei
meses_positivos <- economia_mensal[]
meses_positivos

# O que acontece se passar um vetor lógico na posição?
economia_mensal[c(F, F, T, T)]

# Menor que
1<3
ganhos < perdas

#Maior que
1>3
ganhos > perdas

# Menor ou igual que
1<=3

ganhos <= perdas

# Maior ou igual que
1>=3
ganhos >= perdas

# Igual a
1==2
ganhos == perdas

# Diferente de
1!=2
ganhos != perdas

#===================================================================================#

rm(list = ls())

# O R possui várias funções, que sempre são escritas função()
# Entre parenteses são indicados os parâmetros da função e as variáveis com a qual
# a função vai trabalhar, como já vimos em alguns casos acima.

# O R tem algumas funções nativas, mas boa parte delas foram criados pela comunidade
# Como R é um software livre, todo mundo pode criar suas funções, e muitas delas
# com o tempo se tornaram muito usadas. Um conjunto de funções é chamdo de pacote
# ou library em inglês. Para serem usadas elas precisam ser baixadas no R e carregadas
# a cada uso

# instalando pacotes
install.packages("tidyverse")
install.packages(c("rio", "janitor"))
update.packages()

# carregando pacotes
library(rio)

# para não precisa ficar fazendo isso toda vez, o pacote pacman pode ajudar
install.packages("pacman")
pacman::p_load(tidyverse, janitor, rio)

# escolhendo lugar de onde carregar e para onde salvar os arquivos
# pode-se usar crtl+shift+h
getwd()
dir()
setwd("C:/Users/Homedesk/Desktop")


# importando uma base de dados usando a função import() do pacote rio
base <- import("base_de_dados.sav")

# Vizualizando o banco de dados importado
view(base)







