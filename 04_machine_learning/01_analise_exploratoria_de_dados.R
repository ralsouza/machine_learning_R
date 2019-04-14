# ANÁLISE EXPLORATÓRIA DE DADOS

setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')

#### CARREGAR PACOTE READR ####
library(readr)

#### CARREGAR DATASET ####

# Checar especificações do readr para entender como importar os dados, mudando o tipo de dados apenas da
# coluna "ano" de numérico para carácter
vignette('readr')

# Checar os tipos de dados padrão especificados pelo readr antes de importar
readr::spec_csv('carros-usados.csv')

# Conforme na documentação do readr, é melhor prática especificar explicitamente os tipos de dados para 
# evitar problemas inesperados nos dados. Optamos por especificar explicitamente todas as colunas, invés
# de apenas a coluna "ano"
carros <- readr::read_csv('carros-usados.csv'
                          ,col_types = cols(
                              ano = col_character(),
                              modelo = col_character(),
                              preco = col_double(),
                              kilometragem = col_double(),
                              cor = col_character(),
                              transmissao = col_character()
                          )
                 )

# Renomear a coluna kilometragem para quilometragem
carros <- plyr::rename(carros, c('kilometragem' = 'quilometragem'))

# Exibir a especificação do data frame conforme nova especificação
readr::spec(carros)

#### RESUMO DOS DADOS  ####
View(carros)
str(carros)

#### MEDIDAS DE TENDÊNCIA CENTRAL ####
summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])

#### ANÁLISE EXPLORATÓRIA PARA VARIÁVEIS NUMÉRICAS ####
mean(carros$preco)
median(carros$preco)
# Obs.: Os dados não estão em uma distribuição normal, pois a média e mediana tem valores diferentes

# Quartis
quantile(carros$preco)

# Percentis
quantile(carros$preco, probs = c(0.01, 0.50, 0.99))
quantile(carros$preco, seq(from = 0, to = 1, by = 0.20))

# Intervalo interquartil, diferença entre Q3 e Q1
IQR(carros$preco)

# Alcance dos dados
range(carros$preco)
diff(range(carros$preco))

# Plot dos dados
# Usamos boxplot e histogramas para análise de dados univariada
# Boxplot - Leitura de baixo para cima  - Q1, Q2, Mediana e Q3
boxplot(carros$preco, main = 'Boxplot para Preços de Carros Usados', ylab = 'Preço (R$)')
boxplot(carros$quilometragem, main = 'Boxplot para Quilometragem de Carros Usados,', ylab = 'Quilometragem (Km)')
# Obs.: Podemos verificar nas "bolinhas", os outliers máximos e mínimos

# Histograma - Indicam a frequência de valores dentro de cada bin (classe de valores)
hist(carros$preco, main = 'Histograma para Valores de Carros Usados', ylab = 'Preço (R$)')
hist(carros$quilometragem, main = 'Histograma para Quilometragem de carros Usados', ylab = 'Quilometragem (Km)')
# Reduzindo os bins para visualizar um pouco melhor os dados
hist(carros$quilometragem, main = 'Histograma para Quilometragem de Carros Usados', ylab = 'Quilometragem (Km)', breaks = 5)

# Usa-se o scatterplot para analisar mais de uma variáveis, ou seja, multivariada

# Analisar a relação entre a variável preço e quilometragem
# Usando a variável preço como variável dependente (y)






































