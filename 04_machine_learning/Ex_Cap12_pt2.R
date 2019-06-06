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
iris_cl <- iris[ ,1:4]

# Opção com o algoritimo K-means
?kmeans
cluster_iris_km_v1 <- kmeans(iris_cl , 3)
cluster_iris_km_v2 <- kmeans(iris_cl , 3, nstart = 20)

# Algoritimo pam - Uma versão mais robusta do K-means, ver help para detalhes
?pam
cluster_iris_pm <- pam(iris_cl, 3)$clustering

# Obtendo informação sobre os clusters
# Foram criados 3 clusters: cluster 1, 2 e 3
# Perceba que apesar o algoritmo ter feito a divisão dos dados em clusters, 
# houve problema em dividir alguns dos dados, que apesar de terem caracteristicas 
# diferentes, ficaram no mesmo cluster
table(cluster_iris_km_v1$cluster, iris$Species)
table(cluster_iris_km_v2$cluster, iris$Species)
table(cluster_iris_pm   , iris$Species)

# Visualizando os clusters
install.packages("cluster")
library(cluster)
help(clusplot)

# K-means
clusplot(iris_cl, cluster_iris_km_v1$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0, main = 'Cluster Iris v1 (Algoritimo K-means)')
clusplot(iris_cl, cluster_iris_km_v2$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0, main = 'Cluster Iris v2 (Algoritimo K-means)')

# pam
clusplot(iris_cl, cluster_iris_pm, color = TRUE, shade = TRUE, labels = 0, lines = 0, main = 'Cluster Iris (Algoritimo pam)')
