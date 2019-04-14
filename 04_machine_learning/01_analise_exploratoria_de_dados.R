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

# Exibir a especificação do data frame conforme nova especificação
readr::spec(carros)

#### RESUMO DOS DADOS  ####
View(carros)
str(carros)

#### MEDIDAS DE TENDÊNCIA CENTRAL ####
summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])
























