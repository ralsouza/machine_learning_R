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
library(ggplot2)
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
# Como a questão é saber qual empresa atrasa mais do que a outra, é necessário selecionar 
# apenas os dados onde o tempo de chegada for maior ou igual a zero
pop_data <- flights %>% 
                select(carrier, arr_delay) %>% 
                filter(carrier == 'UA' | carrier == 'DL', arr_delay >= 0) %>% 
                drop_na()

dim(pop_data) # 106.775 x 2

# Exercício 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2

# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra
?sample

# Separar a população das empresas em dois data frames
pop_data_UA <- pop_data %>% 
               filter(carrier == 'UA') 

pop_data_DL <- pop_data %>% 
               filter(carrier == 'DL') 

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


# Exercício 4 - Calcule o intervalo de confiança (95%) da amostra sample_DL
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
# Exemplo Apresentação
( 2.575 * 1.5) + 25 # = 28.86
(-2.575 * 1.5) + 25 # = 21.14 

upper_tail_DL <- ( 1.96 * erro_padrao_sample_DL) + mean(sample_DL$arr_delay) 
lower_tail_DL <- (-1.96 * erro_padrao_sample_DL) + mean(sample_DL$arr_delay) 


# Intervalo de confiança
ic_DL <- data.frame(ic_dl = c(lower_tail_DL, upper_tail_DL))
mean(sample_DL$arr_delay) # Temos a média de 39 minutos de atraso na empresa DL
ic_DL # Verificamos que o IC é 33.20088 à 40.52112, ou seja, a média de 39 está dentro deste intervalo

# Exercício 5 - Calcule o intervalo de confiança (95%) da amostra sample_UA
# Erro padrão
erro_padrao_sample_UA = sd(sample_UA$arr_delay) / sqrt(nrow(sample_UA))

upper_tail_UA <- ( 1.96 * erro_padrao_sample_UA) + mean(sample_UA$arr_delay) 
lower_tail_UA <- (-1.96 * erro_padrao_sample_UA) + mean(sample_UA$arr_delay) 

# Intervalo de confiança
ic_UA <- data.frame(ic_ua = c(lower_tail_UA, upper_tail_UA))
mean(sample_UA$arr_delay) # Temos a média de 34 minutos de atraso na empresa DL
ic_UA # Verificamos que o IC é 31.38087 à 37.14913, ou seja, a média de 34 está dentro deste intervalo

# Exercício 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2
# Juntando tudo
df.dl <- sample_DL %>% 
  group_by(carrier) %>% 
  summarise(
    n = n(),
    media = mean(sample_DL$arr_delay),
    desvio_padrao = sd(sample_DL$arr_delay)
  ) %>% 
  mutate(lower_tail = (-1.96 * erro_padrao_sample_DL) + mean(sample_DL$arr_delay)) %>% 
  mutate(upper_tail= ( 1.96 * erro_padrao_sample_DL) + mean(sample_DL$arr_delay)) %>% 
  mutate(erro_padrao = sd(sample_DL$arr_delay) / sqrt(n)) %>% 
  mutate(intevalo_confianca = erro_padrao * qt((1 - 0.05) / 2 + .5, n - 1 ))

df.ua <- sample_UA %>% 
  group_by(carrier) %>% 
  summarise(
    n = n(),
    media = mean(sample_UA$arr_delay),
    desvio_padrao = sd(sample_UA$arr_delay)
  ) %>% 
  mutate(lower_tail = (-1.96 * erro_padrao_sample_UA) + mean(sample_UA$arr_delay)) %>% 
  mutate(upper_tail= ( 1.96 * erro_padrao_sample_UA) + mean(sample_UA$arr_delay)) %>% 
  mutate(erro_padrao = sd(sample_UA$arr_delay) / sqrt(n)) %>% 
  mutate(intevalo_confianca = erro_padrao * qt((1 - 0.05) / 2 + .5, n - 1 ))

df.carriers <- rbind(df.dl, df.ua)

?aes
ggplot(df.carriers) + 
  geom_point(aes(x = carrier, y = media, colour = carrier), size = 3) +
  geom_errorbar(aes(x = carrier, ymin = lower_tail, ymax = upper_tail), width = .1)

# Exercício 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que? Sim. Pois parte dos dados de ambas amostras estão no mesmo intervalo de confiança. Podemos 
#          notar isso traçando uma linha horizontal imaginária entre os erros para e visualizar onde os dados se encontram
 
# Exercício 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)
# H0 e H1 devem ser mutuamente exclusivas.

# H0: Tempo médio de chegada da Delta Airlines é igual que a média de chegada da United Airlines.
#     arr_delay: DL <= UA
# H1: Tempo médio de chegada da Delta Airlines é maior que a média de chegada da United Airlines.
#     arr_delay: DL > UA

# Coletar 1000 amostras aleatórias

# Coletar amostras apenas com atrasos maiores que zero, pois queremos saber quem atrasa mais
sample_hip_DL <- sample_n(filter(pop_data, carrier == "DL", arr_delay > 0), 1000)
sample_hip_UA <- sample_n(filter(pop_data, carrier == "UA", arr_delay > 0), 1000)


?rnorm
hist(rnorm(sample_hip_DL$arr_delay))

# Erro padrão
ep_amostra_DL_hip = sd(sample_hip_DL$arr_delay) / sqrt(nrow(sample_hip_DL)) 
mean(sample_hip_DL$arr_delay)

ep_amostra_UA_hip = sd(sample_hip_UA$arr_delay) / sqrt(nrow(sample_hip_UA))
mean(sample_hip_UA$arr_delay)


# Desvio padrão da população
sd(pop_data$arr_delay)
# 42.57368

# Teste t
# O teste t (de Student) foi desenvolvido por Willian Sealy Gosset em 1908 que usou o
# pseudônimo “Student” em função da confidencialidade requerida por seu empregador
# (cervejaria Guiness) que considerava o uso de estatística na manutenção da qualidade como
# uma vantagem competitiva.
# O teste t de Student tem diversas variações de aplicação, e pode ser usado na comparação 
# de duas (e somente duas) médias e as variações dizem respeito às hipóteses que são testadas
?t.test

# Como o sinal de condição do H1 é >, a Região Crítica é unicaldal à direita
# Ver vídeo de do passo a passo nas anotações o iCloud
# Quando a análise for pelo P-Valor

# Para usar o P-Valor na decisão de um teste de hipótese, basta compararmos o P-Valor com:
#  1. Se P-Valor <= a, então rejeitamos H0 - Baixo valor p: forte evidência empírica contra h0
#  2. Se P-Valor > a, então aceitamos H0 - Alto valor p: pouca ou nenhuma evidência empírica contra h0

# Valor p
# O valor-p é uma quantificação da probabilidade de se errar ao rejeitar H0 e a mesma
# decorre da distribuição estatística adotada.
# Se o valor-p é menor que o nível de significância, conclui-se que o correto é rejeitar a
# hipótese de nulidade.

# Valor p é a probabiblidade de que a estatística do teste assuma um valor extremo em relação 
# ao valor observado quando H0 é verdadeira.

# Estamos trabalhando com alfa igual a 0.05 (95% de confiança)

t.test(sample_hip_DL$arr_delay, sample_hip_UA$arr_delay, alternative = 'greater')
# O valor-p de 0.9626, logo HA Rejeitada e H0 Não Rejeitada.

# Outro Tipo de Teste
# Quando a análise for pela Região Crítica
# 1. Se o valor observado pertencer à Região Crítica, então Rejeitar H0 (Aceitar HA)
# 2. Se o valor observado não pertencer à Região Crítica, então Aceitar H0 (Rejeitar HA)

# Z Observado
sd_hip <- sd(pop_data$arr_delay) / sqrt(nrow(sample_hip_UA)) 
z_obs <- (mean(sample_hip_DL$arr_delay) - mean(sample_hip_UA$arr_delay)) / sd_hip 
# -2.586619

# Explicação em https://www.youtube.com/watch?v=dIuicq-hlm4
# Valor Crítico ou Região Crítica
zc <- (1.64+1.65)/2 # 1.645

# Como o valor do Z Observado está fora da Região Crítica, HA Rejeitada e H0 Não Rejeitada.

##### 3 - Conclusão do Teste de Hipótese ####

# p-value = 0.9626, logo > que a = 0.05
# Não temos evidências suficientes para rejeitar a hipósete nula, ou seja, nos dados analisados não há
# evidências suficientes que indiquem que DL atrase mais que UA.

# Ou

# Ao nível de 5%, não há evidências de que o tempo médio de atraso da DL seja superior ao da UA.

# Ou ainda

# Falhamos em rejeitar a hipótese nula, pois p-valor é maior que o nível de significância
# Isso que dizer que há uma probabilidade alta de não haver diferença significativa entre os atrasos.
# Para os nossos dados, não há evidência estatística de que a DL atrase mais que a UA.

