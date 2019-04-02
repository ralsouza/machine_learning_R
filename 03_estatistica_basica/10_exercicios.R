# Solução Lista de Exercícios - Capítulo 10

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/03_estatistica_basica')
getwd()

# Pacotes
install.packages('nycflights13')
library(nycflights13)
library(dplyr)
library(tidyr)
flights

# Definindo o Problema de Negócio
# Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)


##### ATENÇÃO #####
# Você vai precisar do conhecimento adquirido em outros capítulos do curso 
# estudados até aqui para resolver esta lista de exercícios!


# Exercício 1 - Construa o dataset pop_data com os dados de voos das 
# companhias aéreas UA (United Airlines) e DL (Delta Airlines). 
# O dataset deve conter apenas duas colunas, nome da companhia e atraso nos voos de chegada.
# Os dados devem ser extraídos do dataset flights para construir o dataset pop_data
# Vamos considerar este dataset como sendo nossa população de voos

##### 1 - EXPLORANDO OS DADOS ####
?flights
dim(flights) # 3367.776 x 19
flights[1:3,15:19]

##### 2 - CARREGANDO OS DADOS ####
pop_data <- flights %>% 
                select(carrier, arr_delay) %>% 
                filter(carrier == 'UA' | carrier == 'DL')

dim(pop_data) # 106.775 x 2

# Exercício 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2

# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra
?sample

# Separar a população das empresas em dois data frames
pop_data_UA <- pop_data %>% 
               filter(carrier == 'UA') %>% 
               drop_na()

pop_data_DL <- pop_data %>% 
               filter(carrier == 'DL') %>% 
               drop_na()

# Coletar 1000 amostras aleatórias
sample_DL <- pop_data_DL[sample(nrow(pop_data_DL), 1000), ] %>% 
             mutate(sample_id = 1) 

View(sample_DL)

sample_UA <- pop_data_UA[sample(nrow(pop_data_UA), 1000), ] %>% 
             mutate(sample_id = 2)

View(sample_UA)

# Exercício 3 - Crie um dataset contendo os dados das 2 amostras criadas no item anterior. 
?rbind

sample_pop_data <- rbind(sample_DL, sample_UA)

View(sample_pop_data)


# Exercício 4 - Calcule o intervalo de confiança (95%) da amostra1
# Usamos a fórmula: erro_padrao_amostra1 = sd(amostra1$arr_delay) / sqrt(nrow(amostra1))
# Esta fórmula é usada para calcular o desvio padrão de uma distribuição da média amostral
# (de um grande número de amostras de uma população). Em outras palavras, só é aplicável 
# quando você está procurando o desvio padrão de médias calculadas a partir de uma amostra de 
# tamanho n𝑛, tirada de uma população.

# Digamos que você obtenha 10.000 amostras de uma população qualquer com um tamanho de amostra de n = 2.
# Então calculamos as médias de cada uma dessas amostras (teremos 10.000 médias calculadas).
# A equação acima informa que, com um número de amostras grande o suficiente, o desvio padrão das médias 
# da amostra pode ser aproximado usando esta fórmula: sd(amostra) / sqrt(nrow(amostra))
  
# Deve ser intuitivo que o seu desvio padrão das médias da amostra será muito pequeno, 
# ou em outras palavras, as médias de cada amostra terão muito pouca variação.

# Com determinadas condições de inferência (nossa amostra é aleatória, normal, independente), 
# podemos realmente usar esse cálculo de desvio padrão para estimar o desvio padrão de nossa população. 
# Como isso é apenas uma estimativa, é chamado de erro padrão. A condição para usar isso como 
# uma estimativa é que o tamanho da amostra n é maior que 30 (dado pelo teorema do limite central) 
# e atende a condição de independência n <= 10% do tamanho da população.

# Erro padrão
erro_padrao_sample_DL = sd(sample_DL$arr_delay) / sqrt(nrow(sample_DL))

# Limites inferior e superior
# 1.96 é o valor de z score para 95% de confiança
# Intervalos de confiança e Nível de significância
# IC = 90%, 𝜶 = 0.10
# IC = 95%, 𝜶 = 0.05
# IC = 99%, 𝜶 = 0.01�5𝜶 = 𝜶 = 0.00.05

# 0.05/2 = upper 0.025 lower 0.025
# Olhando na tabela z, .0250 = 1.96, logo os valores de Z são -1.96 e 1.96
( 2.575 * 1.5) + 25 # = 28.86
(-2.575 * 1.5) + 25 # = 21.14 

# Desvio Padrão
sd(sample_DL$arr_delay) # 38.44438

# Média da Amostra
mean(sample_DL$arr_delay) # 0.316

upper.tail = ( 1.96 * sd(sample_DL$arr_delay)) + mean(sample_DL$arr_delay) #  75.66698
lower.tail = (-1.96 * sd(sample_DL$arr_delay)) + mean(sample_DL$arr_delay) # -75.03498

# Intervalo de confiança




# Exercício 5 - Calcule o intervalo de confiança (95%) da amostra2



# Exercício 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2



# Exercício 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que?



# Exercício 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)

# H0 e H1 devem ser mutuamente exclusivas.

