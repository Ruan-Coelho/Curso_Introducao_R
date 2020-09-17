# inicio
options(scipen = 999) #tirando notacao cientifica
setwd("C:/Users/RX/Desktop") #definindo local de trabalho
install.packages("pacman") #instalando o pacote pacman
pacman::p_load(janitor, tidyverse,  rio) # pacotes que vou usar

# CRIANDO BASE DOS ALUNOS

# código dos alunos
var0 <- paste(var4, rep(10:68, 6), sep = "")

#gender (feminino, masculino, outro)
var1 <- sample(1:3, 406, replace = T, prob = c(0.5, 0.45, 0.01))

#race (branco, pardo, preto, outro)
var2 <- sample(1:4, 406, replace = T, prob = c(0.5, 0.5, 0.1, 0.01))

#age of conclusion (17:11)
var3 <- c(rep(17, 58), 
          rep(16, 58),
          rep(15, 58),
          rep(14, 58),
          rep(13, 58),
          rep(12, 58),
          rep(11, 58))

#year (13:19)
var4 <- c(rep(2013, 58), 
          rep(2014, 58),
          rep(2015, 58),
          rep(2016, 58),
          rep(2017, 58),
          rep(2018, 58),
          rep(2019, 58))

#houses (grif, sonse, corv, lufa)
var5 <- c(rep(1, 14), rep(2, 15), rep(3, 14), rep(4, 15),
          rep(1, 15), rep(2, 14), rep(3, 15), rep(4, 14),
          rep(1, 14), rep(2, 14), rep(3, 14), rep(4, 16),
          rep(1, 14), rep(2, 16), rep(3, 14), rep(4, 14),
          rep(1, 15), rep(2, 14), rep(3, 14), rep(4, 15),
          rep(1, 15), rep(2, 15), rep(3, 15), rep(4, 13),
          rep(1, 14), rep(2, 14), rep(3, 15), rep(4, 15))

#points 
probs <- c(seq(0.01, 0.1, length.out = 25), 
           rep(1, 26),
           seq(0.1, 0.01, length.out = 25))

var6 <- sample(-25:50, 406, replace = T, prob = probs)

# origem do pai (1 wizard, 2 muggle)
var7 <- sample(1:2, 406, replace = T, prob = c(0.85, 0.15)) 
  
# origem da mãe (1 wizard, 2 muggle)
var8 <- sample(1:2, 406, replace = T, prob = c(0.65, 0.35))   

base <- data.frame(var0, var1, var2, var3, var4, var5, var6, var7, var8)


base %>% 
  tabyl(var7, var8)

# Campeão
base %>% 
  filter(var4 == 2019) %>% 
  group_by(var5) %>% 
  summarise(sum(var6))


base %>% 
  filter(var4 == 2018) %>% 
  group_by(var5) %>% 
  summarise(sum(var6))

base %>% 
  filter(var4 == 2017) %>% 
  group_by(var5) %>% 
  summarise(sum(var6))







