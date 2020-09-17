# Carregando pacotes
pacman::p_load(janitor, tidyverse)

# Criando vetores
genero <- sample(c("feminino", "masculino", "outro"), 4723, replace = T,
                 prob = c(0.5, 0.45, 0.01))

raca <- sample(c("branco", "pardo", "preto", "outro"), 4723, replace = T,
                 prob = c(0.5, 0.5, 0.1, 0.01))

idade <- sample(18:65, 4723, replace = T,
                prob = 48:1)

# Tabulando os vetores criados (tabela de frequência)
tabyl(genero) %>% 
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 2)


tabyl(raca) %>% 
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 2)


tabyl(idade) %>% 
  arrange(desc(n)) %>% 
  adorn_pct_formatting(digits = 2)

# Criando a base (data.frame)
base <- data.frame(genero, raca, idade)

# Dando uma olhada na base
glimpse(base)
summary(base)







