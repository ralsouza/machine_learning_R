# Exemplo de como encontrar o número ideal de clusters
# Tutorial: https://www.r-bloggers.com/finding-optimal-number-of-clusters/
# Referência: http://www.diegonogare.net/2015/08/entendendo-como-funciona-o-algoritmo-de-cluster-k-means/
# Dataset: https://archive.ics.uci.edu/ml/datasets/ser+Knowledge+Modeling+Data+(Students'+Knowledge+Levels+on+DC+Electrical+Machines)

#### 1. Setup ####
# Diretório de Trabalho
# Ubuntu
setwd('/home/ralsouza/Documents/r_projects/machine_learning_R/04_machine_learning')
# OS X
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')

# Bibliotecas
#install.packages('readr')
# install.packages('mclust')
# install.packages("NbClust",dependencies = TRUE)
library(readr)
library(tibble)
library(readr)
library(mclust) # BIC (Bayesian Information Criterion for k means)
library(NbClust) # Ver no teste respectivo abaixo

### 2. Carga do Dataset ####
?read.csv
ds_SKD <- read_csv( 'StudentKnowledgeData.csv'
                    ,col_types = cols(
                      STG = col_double()
                      ,SCG = col_double()
                      ,STR = col_double()
                      ,LPR = col_double()
                      ,PEG = col_double()
                      ,UNS = col_character()
                    )
                  ,locale = locale(decimal_mark = ','))

ds_SKD
summary(ds_SKD)
str(ds_SKD)

#### 3. Pré-Processamento ####
# Dimensão do Dataset
dim(ds_SKD)

# Validar Dados NA
is.na(ds_SKD)

# Dimensionar e Escalar o Dataset
?scale
ds_SKD_scaled <- as.matrix(scale(ds_SKD[ ,1:5]))
summary(ds_SKD_scaled)

##### 4. Encontrando o Número Ideal de Clusters ####
?kmeans

# Aplicação de k=3 no algoritimo kmeans
# iter.max = 15: Garantir que o algoritimo fará até 15 iterações
# nstart = 50: Garantir que pelo menos 50 conjuntos aleatórios sejam selecionados
kmm <- kmeans(ds_SKD_scaled, 3, nstart = 50, iter.max = 15)

# between_SS / total_SS: Esta proporção representa efectivamente a quantidade 
# da soma dos quadrados dos pontos de dados que se situa entre os aglomerados
kmm # (between_SS / total_SS =  29.4 %)

# Método Elbow
# Calcular e plotar o wss para k=2 e até k=15
k.max <- 15

data <- ds_SKD_scaled

wss <- sapply( 1:k.max
              ,function(k){kmeans(data, k, nstart = 50, iter.max = 15)$tot.withinss})

wss

plot(1:k.max, wss,
     type = 'b', pch = 19, frame = FALSE,
     xlab = 'Número de Clusters K',
     ylab = 'Soma dos Quadrados Entre os Clusters',
     main = 'Medida Valor Ideal de K - Método Elbow')

# Parece que k=4 e k=5 são bons candidatos, pois tentem a mudar lentamente e permanecer
# menos alterados do que os outros k's.

# Critério de Inferência Bayesian - BIC(Bayesian Information Criterion for k means)
d_clust <- Mclust(as.matrix(ds_SKD_scaled), G = 1:15,
                  modelNames = mclust.options('emModelNames'))

d_clust$BIC

plot(d_clust)

# 1: BIC - As opções com k=4 e k=5 parecem ser as melhores opções disponíveis

# NbClust - Incrivel!!!
# O pacote NbClust, fornece 30 índices para determinar o número de clusters e 
# propõe-se a utilizar o melhor esquema de clustering a partir dos diferentes 
# resultados obtidos variando todas as combinações de número de clusters, 
# medidas de distância e métodos de clustering

nb <- NbClust(ds_SKD_scaled, diss = NULL, distance = 'euclidean',
              min.nc = 2, max.nc = 5, method = 'kmeans', index = 'all',
              alphaBeale = 0.1)

hist(nb$Best.nc[1, ], breaks = max(na.omit(nb$Best.nc[1, ])))

#  Há um ponto importante aqui que este método sempre leva para a maioria 
# dos índices para cada tamanho de cluster. Por isso, é importante entender 
# quais dos índices são relevantes para os dados e com base nele para determinar 
# se a melhor opção é o valor máximo sugerido ou qualquer outro valor.
#  Como vemos abaixo, olhando para o segundo gráfico D-index de diferenças, 
# sabemos que é bastante claro que o melhor número de clusters é k = 4
# ESTUDAR MELHOR ESTES CONCEITOS