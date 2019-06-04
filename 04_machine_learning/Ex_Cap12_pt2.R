# Lista II de Exercícios - Capítulo 12

#### 1. Setup Ambiente ####
# Diretório de Trabalho
setwd('/Users/ls_rafael/Documents/GitHub/machine_learning_R/04_machine_learning')
getwd()

# Pacotes
# Usaremos o dataset iris neste exemplo
# O dataset iris possui observações de 3 especies de flores (Iris setosa, 
# Iris virginica e Iris versocolor)
# Para cada flor, 4 medidas sao usadas: 
# comprimento (length) e largura (width) do caule (sepal) e comprimento e 
# largura da petala (petal)
library(datasets)
?iris
head(iris)

#### 2. Análise exploratoria de dados com ggplot2 ####
library(ggplot2)

# Veja que os dados claramente possui grupos com caracteristcas similares
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point(size = 3)

# Agora usarmeos o K-Means para tentar agrupar os dados em clusters
set.seed(101)
help(kmeans)

# Exercício 1 - Usando a função kmeans(), crie um modelo de clustering 
# (aprendizagem não supervisionada), use a documentação para fazer sua pesquisa
# Neste caso, ja sabemos quantos grupos (clusters) existem em nossos dados (3)
# Perceba que o dataset iris possui 5 colunas, mas estamos usando as 4 primeiras
cluster_iris <- kmeans(iris[1:4] , 3)

# Obtendo informação sobre os clusters
# Foram criados 3 clusters: cluster 1, 2 e 3
# Perceba que apesar o algoritmo ter feito a divisão dos dados em clusters, 
# houve problema em dividir alguns dos dados, que apesar de terem caracteristicas 
# diferentes, ficaram no mesmo cluster
summary(cluster_iris)

# Visualizando os clusters
install.packages("cluster")
library(cluster)
help(clusplot)

clusplot(cluster_iris, cluster_iris$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0, )


clusplot(iris[ ,1:4], cluster_iris, color = TRUE)




